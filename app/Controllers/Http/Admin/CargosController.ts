import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { rules, schema } from '@ioc:Adonis/Core/Validator'
import resources from 'Config/resources'
import Cargo from 'App/Models/Cargo'
import CargoPermission from 'App/Models/CargoPermission'

export default class CargosController {
  private validationMessages = {
    required: '{{ field }} é obrigatório, preencha este campo.',
    unique: '{{ field }} já cadastrado, tente outro.',
  }

  // GET
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

  // GET in /create
  public async create({ view }: HttpContextContract) {
    return view.render('admin/cargos/create', { resources })
  }

  // POST
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

  // GET in /:id/edit
  public async edit({ view, params, response, session, logger }: HttpContextContract) {
    const { id } = params

    try {
      const cargo = await Cargo.query()
        .where({ id })
        .preload('permissions', (q) => {
          q.orderBy('created_at')
        })
        .firstOrFail()

      return view.render('admin/cargos/edit', {
        cargo: cargo.toJSON(),
        permissions: cargo.permissions,
        resources,
      })
    } catch (error) {
      logger.error(error)
      session.flash('error', 'Cargo não econtrado.')
      return response.redirect().back()
    }
  }

  // PUT in /:id
  public async update({ request, session, params, response, logger }: HttpContextContract) {
    const { id } = params

    const cargoSchema = schema.create({
      titulo: schema.string({}, [
        rules.unique({
          table: 'cargos',
          column: 'titulo',
          whereNot: { id },
        }),
      ]),
      name: schema.array().members(schema.string()),
      create: schema.array().members(schema.boolean()),
      read: schema.array().members(schema.boolean()),
      update: schema.array().members(schema.boolean()),
      delete: schema.array().members(schema.boolean()),
      id: schema.array().members(schema.number()),
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
        id: data.id[index],
      }
    })

    try {
      await Cargo.query().where({ id }).update({ titulo })

      await CargoPermission.updateOrCreateMany('id', newData)

      session.flash('success', 'Cargo atualizado.')

      return response.redirect().toRoute('admin.cargos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }

  // DELETE in /:id
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
