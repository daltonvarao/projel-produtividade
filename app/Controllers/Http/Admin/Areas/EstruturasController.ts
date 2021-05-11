import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import Estrutura from 'App/Models/Estrutura'
import Mina from 'App/Models/Mina'

export default class EstruturasController {
  protected validationMessages = {
    'nome.required': 'Nome é obrigatório.',
    'mina_id.required': 'Mina é obrigatória.',
    'nome.unique': 'Nome já cadastrado.',
  }

  public async index({ view, request, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')
    const { page } = request.qs()

    const estruturas = await Estrutura.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .preload('mina')
      .paginate(page || 1)

    return view.render('admin/areas/estruturas/index', {
      estruturas: estruturas.baseUrl('estruturas').toJSON(),
    })
  }

  public async create({ view, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const minas = await Mina.query().apply((scopes) => scopes.inContract(contratoId))

    return view.render('admin/areas/estruturas/create', {
      minas: minas.map((i) => i.toJSON()),
    })
  }

  public async store({ request, session, response, logger }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const validationSchema = schema.create({
      nome: schema.string({}, [
        rules.unique({
          table: 'estruturas',
          column: 'nome',
          where: {
            contrato_id: contratoId,
          },
        }),
      ]),
      mina_id: schema.number(),
    })

    const data = await request.validate({
      schema: validationSchema,
      messages: this.validationMessages,
    })

    try {
      await Estrutura.create({ ...data, contratoId })

      session.flash('success', 'Estrutura cadastrada.')

      return response.redirect().toRoute('admin.areas.estruturas.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async edit({ view, request, session, response, logger }: HttpContextContract) {
    const { id } = request.params()
    const contratoId: number = session.get('contratoId')

    const minas = await Mina.query().apply((scopes) => scopes.inContract(contratoId))

    try {
      const estrutura = await Estrutura.findOrFail(id)

      return view.render('admin/areas/estruturas/edit', {
        estrutura: estrutura.toJSON(),
        minas: minas.map((i) => i.toJSON()),
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
          table: 'estruturas',
          column: 'nome',
          whereNot: {
            id,
          },
          where: {
            contrato_id: contratoId,
          },
        }),
      ]),
      mina_id: schema.number(),
    })

    const data = await request.validate({
      schema: validationSchema,
      messages: this.validationMessages,
    })

    try {
      await Estrutura.query().where({ id }).update(data)

      session.flash('success', 'Estrutura atualizada.')

      return response.redirect().toRoute('admin.areas.estruturas.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async destroy({ request, response, logger, session }: HttpContextContract) {
    const { id } = request.params()

    try {
      await Estrutura.query().where({ id }).delete()
      session.flash('success', 'Estrutura deletada.')

      return response.redirect().toRoute('admin.areas.estruturas.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }
}
