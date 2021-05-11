import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import Equipamento from 'App/Models/Equipamento'

export default class EquipamentosController {
  private validationMessages = {
    'tag.required': 'Tag é obrigatório, preencha este campo.',
    'tag.unique': 'Tag já cadastrada, tente outra.',
    'descricao.required': 'Descrição é obrigatória, preencha este campo.',
  }

  public async index({ view, request, session }: HttpContextContract) {
    const { page } = request.qs()
    const contratoId: number = session.get('contratoId')

    const equipamentos = await Equipamento.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .orderBy('tag')
      .paginate(page || 1)

    return view.render('admin/equipamentos/index', {
      equipamentos: equipamentos.baseUrl('equipamentos').toJSON(),
    })
  }

  public async create({ view }: HttpContextContract) {
    return view.render('admin/equipamentos/create')
  }

  public async store({ session, request, response, logger }: HttpContextContract) {
    const { currentContrato } = request
    const contratoId: number = session.get('contratoId')

    if (!currentContrato) {
      session.flash('error', 'Contrato não encontrado.')
      return response.redirect().back()
    }

    const equipamentoSchema = schema.create({
      tag: schema.string({}, [
        rules.unique({
          table: 'equipamentos',
          column: 'tag',
          where: {
            contrato_id: contratoId,
          },
        }),
      ]),
      descricao: schema.string(),
      sonda: schema.boolean.optional(),
    })

    const data = await request.validate({
      schema: equipamentoSchema,
      messages: this.validationMessages,
    })

    try {
      await currentContrato.related('equipamentos').create(data)

      session.flash('success', 'Equipamento cadastrado.')

      return response.redirect().toRoute('admin.equipamentos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().toRoute('admin.equipamentos.index')
    }
  }

  public async edit({ view, params, session, response, logger }: HttpContextContract) {
    const { id } = params

    try {
      const equipamento = await Equipamento.findOrFail(id)

      return view.render('admin/equipamentos/edit', {
        equipamento,
      })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().toRoute('admin.equipamentos.index')
    }
  }

  public async update({ params, session, request, response, logger }: HttpContextContract) {
    const { id } = params

    const equipamentoSchema = schema.create({
      tag: schema.string({}, [
        rules.unique({
          table: 'equipamentos',
          column: 'tag',
          whereNot: { id },
        }),
      ]),
      descricao: schema.string(),
      sonda: schema.boolean.optional(),
    })

    const data = await request.validate({
      schema: equipamentoSchema,
      messages: this.validationMessages,
    })

    try {
      await Equipamento.query()
        .where({ id })
        .update({
          sonda: false,
          ...data,
        })

      session.flash('success', 'Equipamento atualizado.')
      return response.redirect().toRoute('admin.equipamentos.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }

  public async destroy({ params, response, session, logger }: HttpContextContract) {
    const { id } = params

    try {
      await Equipamento.query().where({ id }).delete()

      session.flash('success', 'Equipamento deletado.')

      return response.redirect().back()
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }
}
