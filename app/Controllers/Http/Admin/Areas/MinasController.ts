import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import Complexo from 'App/Models/Complexo'

import Mina from 'App/Models/Mina'

export default class MinasController {
  public async index({ view, request, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')
    const { page } = request.qs()

    const minas = await Mina.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .preload('complexo')
      .paginate(page || 1)

    return view.render('admin/areas/minas/index', {
      minas: minas.baseUrl('minas').toJSON(),
    })
  }

  public async create({ view, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const complexos = await Complexo.query().apply((scopes) => scopes.inContract(contratoId))

    return view.render('admin/areas/minas/create', {
      complexos: complexos.map((i) => i.toJSON()),
    })
  }

  public async store({ request, session, response, logger }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const validationSchema = schema.create({
      nome: schema.string({}, [
        rules.unique({
          table: 'minas',
          column: 'nome',
          where: {
            contrato_id: contratoId,
          },
        }),
      ]),
      complexo_id: schema.number(),
    })

    const data = await request.validate({
      schema: validationSchema,
      messages: {
        'nome.required': 'Nome é obrigatório.',
        'nome.unique': 'Nome já cadastrado.',
        'complexo_id.required': 'Complexo é obrigatório.',
      },
    })

    try {
      await Mina.create({ ...data, contratoId })

      session.flash('success', 'Mina cadastrada.')

      return response.redirect().toRoute('admin.areas.minas.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async edit({ view, request, session, response, logger }: HttpContextContract) {
    const { id } = request.params()
    const contratoId: number = session.get('contratoId')

    const complexos = await Complexo.query().apply((scopes) => scopes.inContract(contratoId))

    try {
      const mina = await Mina.findOrFail(id)

      return view.render('admin/areas/minas/edit', {
        mina: mina.toJSON(),
        complexos: complexos.map((i) => i.toJSON()),
      })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async update({ session, request, response, logger }: HttpContextContract) {
    const { id } = request.params()
    const contratoId: number = session.get('contratoId')

    const validationSchema = schema.create({
      nome: schema.string({}, [
        rules.unique({
          table: 'minas',
          column: 'nome',
          where: {
            contrato_id: contratoId,
          },
          whereNot: {
            id,
          },
        }),
      ]),
      complexo_id: schema.number(),
    })

    const data = await request.validate({
      schema: validationSchema,
      messages: {
        'nome.required': 'Nome é obrigatório',
        'nome.unique': 'Nome já cadastrado.',
        'complexo_id.required': 'Complexo é obrigatório.',
      },
    })

    try {
      await Mina.query().where({ id }).update(data)

      session.flash('success', 'Mina atualizada.')

      return response.redirect().toRoute('admin.areas.minas.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async destroy({ request, response, logger, session }: HttpContextContract) {
    const { id } = request.params()

    try {
      await Mina.query().where({ id }).delete()
      session.flash('success', 'Mina deletada.')

      return response.redirect().toRoute('admin.areas.minas.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }
}
