import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import Estrutura from 'App/Models/Estrutura'
import Furo from 'App/Models/Furo'

export default class FurosController {
  protected validationMessages = {
    'nome.required': 'Nome é obrigatório.',
    'estrutura_id.required': 'Estrutura é obrigatória.',
    'nome.unique': 'Nome já cadastrado.',
  }

  public async index({ view, request, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')
    const { page } = request.qs()

    const furos = await Furo.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .preload('estrutura')
      .paginate(page || 1)

    return view.render('admin/areas/furos/index', {
      furos: furos.baseUrl('furos').toJSON(),
    })
  }

  public async create({ view, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const estruturas = await Estrutura.query().apply((scopes) => scopes.inContract(contratoId))

    return view.render('admin/areas/furos/create', {
      estruturas: estruturas.map((i) => i.toJSON()),
    })
  }

  public async store({ request, session, response, logger }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const validationSchema = schema.create({
      nome: schema.string({}, [
        rules.unique({
          table: 'furos',
          column: 'nome',
          where: {
            contrato_id: contratoId,
          },
        }),
      ]),
      estrutura_id: schema.number(),
    })

    const data = await request.validate({
      schema: validationSchema,
      messages: this.validationMessages,
    })

    try {
      await Furo.create({ ...data, contratoId })

      session.flash('success', 'Furo cadastrado.')

      return response.redirect().toRoute('admin.areas.furos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async edit({ view, request, session, response, logger }: HttpContextContract) {
    const { id } = request.params()

    const contratoId: number = session.get('contratoId')

    const estruturas = await Estrutura.query().apply((scopes) => scopes.inContract(contratoId))

    try {
      const furo = await Furo.findOrFail(id)

      return view.render('admin/areas/furos/edit', {
        furo: furo.toJSON(),
        estruturas: estruturas.map((i) => i.toJSON()),
      })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async update({ session, request, response, logger }: HttpContextContract) {
    const { id } = request.params()

    const validationSchema = schema.create({
      nome: schema.string({}, [
        rules.unique({
          table: 'furos',
          column: 'nome',
          whereNot: {
            id,
          },
        }),
      ]),
      estrutura_id: schema.number(),
    })

    const data = await request.validate({
      schema: validationSchema,
      messages: this.validationMessages,
    })

    try {
      await Furo.query().where({ id }).update(data)

      session.flash('success', 'Furo atualizado.')

      return response.redirect().toRoute('admin.areas.furos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async destroy({ request, response, logger, session }: HttpContextContract) {
    const { id } = request.params()

    try {
      await Furo.query().where({ id }).delete()
      session.flash('success', 'Furo deletado.')

      return response.redirect().toRoute('admin.areas.furos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }
}
