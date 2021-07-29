import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import Cargo from 'App/Models/Cargo'
import User from 'App/Models/User'

export default class UsersController {
  private validationMessages = {
    'required': '{{ field }} é obrigatório.',
    'unique': '{{ field }} já cadastrado, tente outro.',
    'confirmed': 'As senhas não conferem.',
    'cargoId.required': 'Selecione um cargo.',
    'password.required': 'Senha é obrigatória.',
    'nome.required': 'Nome é obrigatório.',
    'cpf.required': 'Cpf é obrigatório.',
    'cpf.minLength': 'Cpf inválido, muito curto.',
    'cpf.maxLength': 'Cpf inválido, muito longo.',
    'operacaoCaixa.required': 'Operação Caixa é obrigatório.',
    'conta.required': 'Conta é obrigatório.',
    'agencia.required': 'Agência é obrigatório.',
    'banco.required': 'Banco é obrigatório.',
  }

  protected getCargos = async (contratoId: number) => {
    return await Cargo.query()
      .apply((scopes) => {
        scopes.inContract(contratoId)
      })
      .orderBy('titulo')
  }

  public async index({ view, request, session }: HttpContextContract) {
    const { page } = request.qs()
    const contratoId: number = session.get('contratoId')

    const users = await User.query()
      .apply((scopes) => {
        scopes.inContract(contratoId)
      })
      .orderBy(['nome', 'cpf'])
      .preload('cargo')
      .paginate(page || 1)

    return view.render('admin/users/index', {
      users: users.baseUrl('users').toJSON(),
    })
  }

  public async create({ view, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const cargos = await this.getCargos(contratoId)

    return view.render('admin/users/create', {
      cargos,
    })
  }

  public async store({ request, response, session, logger }: HttpContextContract) {
    const { currentContrato } = request
    const contratoId: number = session.get('contratoId')

    if (!currentContrato) {
      session.flash('error', 'Contrato não encontrado.')
      return response.redirect().back()
    }

    const userSchema = schema.create({
      nome: schema.string(),
      cpf: schema.string({}, [
        rules.unique({
          table: 'users',
          column: 'cpf',
          where: {
            contrato_id: contratoId,
          },
        }),
        rules.maxLength(14),
        rules.minLength(14),
      ]),
      password: schema.string({}, [rules.confirmed('password_confirmation')]),
      cargoId: schema.number(),
      banco: schema.string(),
      agencia: schema.string(),
      conta: schema.string(),
      operacaoCaixa: schema.string.optional(),
    })

    const data = await request.validate({
      schema: userSchema,
      messages: this.validationMessages,
    })

    data.cpf = data.cpf.replace(/\D/g, '')

    try {
      await currentContrato.related('users').create(data)

      session.flash('success', 'Funcionário cadastrado.')

      response.redirect().toRoute('admin.users.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      response.redirect().back()
    }
  }

  public async edit({ view, params, response, session, logger }: HttpContextContract) {
    const { id } = params
    const contratoId: number = session.get('contratoId')

    const cargos = await this.getCargos(contratoId)

    try {
      const user = await User.findOrFail(id)

      return view.render('admin/users/edit', {
        user,
        cargos,
      })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().toRoute('admin.users.index')
    }
  }

  public async update({ params, request, response, session, logger }: HttpContextContract) {
    const { id } = params
    const contratoId: number = session.get('contratoId')

    const userSchema = schema.create({
      nome: schema.string(),
      cpf: schema.string({}, [
        rules.unique({
          table: 'users',
          column: 'cpf',
          whereNot: { id },
          where: { contrato_id: contratoId },
        }),
      ]),
      password: schema.string.optional({}, [rules.confirmed('password_confirmation')]),
      cargoId: schema.number(),
      banco: schema.string(),
      agencia: schema.string(),
      conta: schema.string(),
      operacaoCaixa: schema.string.optional(),
    })

    const data = await request.validate({
      schema: userSchema,
      messages: this.validationMessages,
    })

    data.cpf = data.cpf.replace(/\D/g, '')

    try {
      const user = await User.findOrFail(id)

      user.merge(data)
      await user.save()

      session.flash('success', 'Funcionário atualizado.')
      response.redirect().toRoute('admin.users.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      response.redirect().back()
    }
  }

  public async destroy({ params, session, response, logger }: HttpContextContract) {
    const { id } = params

    try {
      await User.query().where({ id }).delete()

      session.flash('success', 'Funcionário deletado.')

      return response.redirect().back()
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }
}
