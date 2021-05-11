import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import Complexo from 'App/Models/Complexo'

export default class ComplexosController {
  public async index({ view, request, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')
    const { page } = request.qs()

    const complexos = await Complexo.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .orderBy('nome')
      .paginate(page || 1)

    return view.render('admin/areas/complexos/index', {
      complexos: complexos.baseUrl('complexos').toJSON(),
    })
  }

  public async create({ view }: HttpContextContract) {
    return view.render('admin/areas/complexos/create')
  }

  public async store({ request, session, response, logger }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const validationSchema = schema.create({
      nome: schema.string({}, [
        rules.unique({
          table: 'complexos',
          column: 'nome',
          where: {
            contrato_id: contratoId,
          },
        }),
      ]),
    })

    const data = await request.validate({
      schema: validationSchema,
      messages: {
        'nome.required': 'Nome é obrigatório.',
        'nome.unique': 'Nome já cadastrado.',
      },
    })

    try {
      await Complexo.create({ ...data, contratoId })

      session.flash('success', 'Complexo cadastrado.')

      return response.redirect().toRoute('admin.areas.complexos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async edit({ view, request, session, response, logger }: HttpContextContract) {
    const { id } = request.params()

    try {
      const complexo = await Complexo.findOrFail(id)

      return view.render('admin/areas/complexos/edit', {
        complexo: complexo.toJSON(),
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
          table: 'complexos',
          column: 'nome',
          whereNot: {
            id,
          },
          where: {
            contrato_id: contratoId,
          },
        }),
      ]),
    })

    const data = await request.validate({
      schema: validationSchema,
      messages: {
        'nome.required': 'Nome é obrigatório.',
        'nome.unique': 'Nome já cadastrado.',
      },
    })

    try {
      await Complexo.query().where({ id }).update(data)

      session.flash('success', 'Complexo atualizado.')

      return response.redirect().toRoute('admin.areas.complexos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async destroy({ request, response, logger, session }: HttpContextContract) {
    const { id } = request.params()

    try {
      await Complexo.query().where({ id }).delete()
      session.flash('success', 'Complexo deletado.')

      return response.redirect().toRoute('admin.areas.complexos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }
}
