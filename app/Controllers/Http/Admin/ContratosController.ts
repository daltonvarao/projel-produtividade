import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import Atividade from 'App/Models/Atividade'
import Cargo from 'App/Models/Cargo'
import Contrato from 'App/Models/Contrato'

export default class ContratosController {
  private validationMessages = {
    'descricao.required': 'Descrição é obrigatória, preencha este campo.',
    'centroCusto.required': 'Centro de custo é obrigatório, preencha este campo.',
    'numero.required': 'Número é obrigatório, preencha este campo.',
    'numero.unique': 'Número é já cadastrado, tente outro.',
  }

  public async index({ view, request }: HttpContextContract) {
    const { page } = request.qs()

    const contratos = await Contrato.query()
      .orderBy('numero')
      .paginate(page || 1)

    return view.render('admin/contratos/index', {
      contratos: contratos.baseUrl('contratos').toJSON(),
    })
  }

  public async show({ params, logger, response, session, view }: HttpContextContract) {
    const { id } = params
    const cargos = await Cargo.query().orderBy('titulo')
    const atividades = await Atividade.query().orderBy('descricao')

    try {
      const contrato = await Contrato.findOrFail(id)

      return view.render('admin/contratos/show', {
        contrato: contrato.toJSON(),
        cargos,
        atividades,
      })
    } catch (error) {
      logger.error(error)

      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async create({ view }: HttpContextContract) {
    return view.render('admin/contratos/create')
  }

  public async store({ request, response, session, logger }: HttpContextContract) {
    const contratoSchema = schema.create({
      numero: schema.string({}, [
        rules.unique({
          column: 'numero',
          table: 'contratos',
        }),
      ]),
      centroCusto: schema.number(),
      descricao: schema.string(),
    })

    const data = await request.validate({
      schema: contratoSchema,
      messages: this.validationMessages,
    })

    try {
      await Contrato.create(data)

      session.flash('success', 'Contrato cadastrado')
      return response.redirect().toRoute('admin.contratos.index')
    } catch (error) {
      logger.error(error)

      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async edit({ view, params, session, response, logger }: HttpContextContract) {
    const { id } = params

    try {
      const contrato = await Contrato.findOrFail(id)

      return view.render('admin/contratos/edit', {
        contrato: contrato.toJSON(),
      })
    } catch (error) {
      logger.error(error)

      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async update({ request, session, response, params, logger }: HttpContextContract) {
    const { id } = params

    const contratoSchema = schema.create({
      numero: schema.string({}, [
        rules.unique({
          column: 'numero',
          table: 'contratos',
          whereNot: { id },
        }),
      ]),
      centroCusto: schema.number(),
      descricao: schema.string(),
    })

    const data = await request.validate({
      schema: contratoSchema,
      messages: this.validationMessages,
    })

    try {
      const contrato = await Contrato.findOrFail(id)

      await contrato.merge(data).save()

      session.flash('success', 'Contrato atualizado')
      return response.redirect().toRoute('admin.contratos.index')
    } catch (error) {
      logger.error(error)

      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async destroy({ params, session, response, logger }: HttpContextContract) {
    const { id } = params
    try {
      await Contrato.query().where({ id }).delete()

      session.flash('success', 'Contrato deletado')
      return response.redirect().toRoute('admin.contratos.index')
    } catch (error) {
      logger.error(error)

      session.flash('error', error.message)
      return response.redirect().back()
    }
  }
}
