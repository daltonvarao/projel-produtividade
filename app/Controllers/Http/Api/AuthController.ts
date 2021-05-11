import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema } from '@ioc:Adonis/Core/Validator'

export default class AuthController {
  public async store({ request, auth, response }: HttpContextContract) {
    const authSchema = schema.create({
      cpf: schema.string(),
      password: schema.string(),
    })

    const { cpf, password } = await request.validate({
      schema: authSchema,
      bail: true,
    })

    try {
      const { token, user } = await auth.use('api').attempt(cpf, password)

      return {
        token,
        userId: user.id,
      }
    } catch ({ code, message }) {
      switch (code) {
        case 'E_INVALID_AUTH_UID':
          return response.status(400).json({ errors: [{ message: 'Cpf inválido.', field: 'cpf' }] })

        case 'E_INVALID_AUTH_PASSWORD':
          return response
            .status(400)
            .json({ errors: [{ message: 'Senha inválida.', field: 'password' }] })

        default:
          return response.status(400).json({ errors: [{ message }] })
      }
    }
  }
}
