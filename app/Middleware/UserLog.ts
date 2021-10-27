import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import UserLog from 'App/Models/UserLog'

export default class UserLogger {
  public async handle({ auth, request, route }: HttpContextContract, next: () => Promise<void>) {
    if (request.matchesRoute('admin.configuracoes.logs.index')) {
      return await next()
    }

    const body = request.all()

    if (body['password']) {
      body.password = 'super_secret_encrypted_password'
    }

    await UserLog.create({
      route: route?.name,
      ip: request.ip(),
      url: request.url(),
      userId: auth.user?.id,
      method: request.method(),
      body: JSON.stringify(body),
    })

    await next()
  }
}
