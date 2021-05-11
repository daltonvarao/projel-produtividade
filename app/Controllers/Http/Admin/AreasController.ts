import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema } from '@ioc:Adonis/Core/Validator'
import Area from 'App/Models/Area'

export default class AreasController {
  public async index({ view, request, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')
    const { page } = request.qs()

    const areas = await Area.query()
      .orderBy('nome')
      .apply((scopes) => scopes.inContract(contratoId))
      .paginate(page || 1)

    return view.render('admin/areas/index', { areas: areas.baseUrl('areas').toJSON() })
  }

  public async create({ view }: HttpContextContract) {
    return view.render('admin/areas/create')
  }

  public async store({ request, session, logger, response }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const validationSchema = schema.create({
      nome: schema.string(),
    })

    const data = await request.validate({
      schema: validationSchema,
      messages: {
        'nome.required': 'Nome é obrigatório.',
      },
    })

    try {
      await Area.create({ contratoId, ...data })
      session.flash('success', 'Área cadastrada.')
      return response.redirect().toRoute('admin.areas.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async edit({ view, request, logger, session, response }: HttpContextContract) {
    const { id } = request.params()
    try {
      const area = await Area.findOrFail(id)
      return view.render('admin/areas/edit', { area: area.toJSON() })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async update({ request, session, logger, response }: HttpContextContract) {
    const { id } = request.params()

    const validationSchema = schema.create({
      nome: schema.string(),
    })

    const data = await request.validate({
      schema: validationSchema,
      messages: {
        'nome.required': 'Nome é obrigatório.',
      },
    })

    try {
      await Area.query().where({ id }).update(data)

      session.flash('success', 'Área atualizada.')
      return response.redirect().toRoute('admin.areas.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async destroy({ request, session, response, logger }: HttpContextContract) {
    const { id } = request.params()
    try {
      await Area.query().where({ id }).delete()
      session.flash('success', 'Área deletada.')
      return response.redirect().toRoute('admin.areas.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }
}
