import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema } from '@ioc:Adonis/Core/Validator'

import Equipamento from 'App/Models/Equipamento'
import Atividade from 'App/Models/Atividade'
import User from 'App/Models/User'
import Furo from 'App/Models/Furo'
import Rdo from 'App/Models/Rdo'
import Estrutura from 'App/Models/Estrutura'

export default class RdosController {
  public async index({ view, request, session }: HttpContextContract) {
    const { page, equipamentoId, estruturaId, nome, status, initialDate, finalDate } = request.qs()
    const contratoId: number = session.get('contratoId')

    const query = Rdo.query()
      .apply((scopes) => {
        scopes.inContract(contratoId)
        scopes.inPeriod(initialDate, finalDate)
        scopes.whereEquipamentoId(equipamentoId)
        scopes.whereEstruturaId(estruturaId)
        scopes.whereNameLike(nome)
        scopes.whereStatus(status)
      })
      .preload('user')
      .preload('equipamentoPrincipal')
      .preload('contrato')
      .preload('estrutura')

    const rdos = await query.orderBy('data', 'desc').paginate(page || 1)

    const equipamentos = await Equipamento.query().apply((scopes) => {
      scopes.inContract(contratoId)
      scopes.isSonda()
    })

    const estruturas = await Estrutura.query()
      .has('rdos')
      .apply((scopes) => {
        scopes.inContract(contratoId)
      })

    return view.render('admin/rdos/index', {
      rdos: rdos.queryString(request.qs()).baseUrl('rdos').toJSON(),
      equipamentos: equipamentos.map((i) => i.toJSON()),
      estruturas: estruturas.map((i) => i.toJSON()),
    })
  }

  public async show({ request, view, logger, session, response }: HttpContextContract) {
    const { id } = request.params()
    const contratoId = session.get('contratoId')

    const users = await User.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .orderBy('nome')

    const atividades = await Atividade.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .orderBy('descricao')

    const equipamentos = await Equipamento.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .orderBy('tag')

    try {
      const rdo = await Rdo.query()
        .where({ id })
        .preload('rdoAtividades', (qra) => {
          qra.preload('atividade').preload('furo').orderByRaw('hora_inicio::TIME')
        })
        .preload('rdoEquipamentos', (qre) => {
          qre.preload('equipamento')
        })
        .preload('rdoUsers', (qru) => {
          qru.preload('user', (qu) => {
            qu.preload('cargo')
          })
        })
        .preload('contrato')
        .preload('user')
        .preload('estrutura')
        .preload('equipamentoPrincipal')
        .firstOrFail()

      const furos = await Furo.query()
        .where({ estruturaId: rdo.estruturaId })
        .apply((scopes) => scopes.inContract(contratoId))

      return view.render('admin/rdos/show', {
        rdo: rdo.toJSON(),
        users: users.map((i) => i.toJSON()),
        atividades: atividades.map((i) => i.toJSON()),
        equipamentos: equipamentos.map((i) => i.toJSON()),
        furos: furos.map((i) => i.toJSON()),
      })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }

  public async edit({ view, request, session, response, logger }: HttpContextContract) {
    const { id } = request.params()

    try {
      const rdo = await Rdo.query()
        .where({ id })
        .preload('contrato')
        .preload('equipamentoPrincipal')
        .preload('user')
        .firstOrFail()

      return view.render('admin/rdos/edit', {
        rdo: rdo.toJSON(),
      })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }

  public async update({ request, session, response, logger }: HttpContextContract) {
    const { id } = request.params()

    const validationSchema = schema.create({
      nome: schema.string(),
      data: schema.date(),
      condicoesTempo: schema.string(),
      pluviometria: schema.number(),
      status: schema.string(),
    })

    const data = await request.validate({
      schema: validationSchema,
    })

    try {
      await Rdo.updateOrCreate({ id }, data)
      session.flash('success', 'Rdo atualizado.')

      return response.redirect().toRoute('admin.rdos.show', { id })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }

  public async destroy({ request, session, response, logger }: HttpContextContract) {
    const { id } = request.params()

    try {
      await Rdo.query().where({ id }).delete()
      session.flash('success', 'Rdo deletado.')

      return response.redirect().toRoute('admin.rdos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }
}
