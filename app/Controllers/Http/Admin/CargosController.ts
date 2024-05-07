import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { rules, schema } from '@ioc:Adonis/Core/Validator'
import resources from 'Config/resources'
import Cargo from 'App/Models/Cargo'
import CargoPermission from 'App/Models/CargoPermission'
import Contrato from 'App/Models/Contrato'
import LimitePagamento from 'App/Models/LimitePagamento'

export default class CargosController {
  private validationMessages = {
    required: '{{ field }} é obrigatório, preencha este campo.',
    unique: '{{ field }} já cadastrado, tente outro.',
  }

  public async index({ view, request, session }: HttpContextContract) {
    const { page } = request.qs()
    const contratoId: number = session.get('contratoId')

    const cargos = await Cargo.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .orderBy('titulo')
      .paginate(page || 1)

    return view.render('admin/cargos/index', {
      cargos: cargos.baseUrl('cargos').toJSON(),
    })
  }

  public async create({ view }: HttpContextContract) {
    return view.render('admin/cargos/create', { resources })
  }

  public async store({ request, response, session, logger }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const cargoSchema = schema.create({
      titulo: schema.string({}, [
        rules.unique({
          table: 'cargos',
          column: 'titulo',
          where: {
            contrato_id: contratoId,
          },
        }),
      ]),
      name: schema.array().members(schema.string()),
      create: schema.array().members(schema.boolean()),
      read: schema.array().members(schema.boolean()),
      update: schema.array().members(schema.boolean()),
      delete: schema.array().members(schema.boolean()),
    })

    const { titulo, ...data } = await request.validate({
      schema: cargoSchema,
      messages: this.validationMessages,
    })

    const newData = data.name.map((name, index) => {
      return {
        name,
        can_create: data.create[index],
        can_read: data.read[index],
        can_update: data.update[index],
        can_delete: data.delete[index],
      }
    })

    try {
      const cargo = await Cargo.create({ titulo, contratoId })

      await cargo.related('permissions').createMany(newData)

      session.flash('success', 'Cargo cadastrado.')

      return response.redirect().toRoute('admin.cargos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }

  public async edit({ view, params, response, session, logger }: HttpContextContract) {
    const { id } = params

    try {
      const cargo = await Cargo.query()
        .where({ id })
        .preload('permissions', (q) => {
          q.orderBy('created_at')
        })
        .firstOrFail()

      const contratos = await Contrato.query().orderBy('numero')

      return view.render('admin/cargos/edit', {
        cargo: cargo.toJSON(),
        permissions: cargo.permissions,
        resources,
        contratos
      })
    } catch (error) {
      logger.error(error)
      session.flash('error', 'Cargo não econtrado.')
      return response.redirect().back()
    }
  }

  public async update({ request, session, params, response, logger }: HttpContextContract) {
    const { id } = params
    const contratoId: number = session.get('contratoId')

    const cargoSchema = schema.create({
      titulo: schema.string({}, [
        rules.unique({
          table: 'cargos',
          column: 'titulo',
          whereNot: { id },
          where: { contrato_id: contratoId },
        }),
      ]),
      name: schema.array().members(schema.string()),
      create: schema.array().members(schema.boolean()),
      read: schema.array().members(schema.boolean()),
      update: schema.array().members(schema.boolean()),
      delete: schema.array().members(schema.boolean()),
      id: schema.array().members(schema.number()),
      contratoLimitePagamento: schema.number.optional()
    })

    const { titulo, contratoLimitePagamento, ...data } = await request.validate({
      schema: cargoSchema,
      messages: this.validationMessages,
    })

    const newData = data.name.map((name, index) => {
      return {
        name,
        can_create: data.create[index],
        can_read: data.read[index],
        can_update: data.update[index],
        can_delete: data.delete[index],
        id: data.id[index],
      }
    })

    try {
      await Cargo.query().where({ id }).update({ titulo })

      await CargoPermission.updateOrCreateMany('id', newData)

      await LimitePagamento.create({
        contratoId: contratoLimitePagamento,
        limite: 1000
      })

      session.flash('success', 'Cargo atualizado.')

      return response.redirect().toRoute('admin.cargos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }

  public async destroy({ params, response, session, logger }: HttpContextContract) {
    const { id } = params

    try {
      await Cargo.query().where({ id }).delete()

      session.flash('success', 'Cargo deletado.')

      return response.redirect().back()
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }
}
