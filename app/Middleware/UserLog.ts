import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import UserLog from 'App/Models/UserLog'

export default class UserLogger {
  public async handle({ auth, request, route }: HttpContextContract, next: () => Promise<void>) {
    if (request.matchesRoute('admin.configuracoes.logs.index')) {
      return await next()
    }

    await UserLog.create({
      route: route?.name,
      ip: request.ip(),
      url: request.url(),
      userId: auth.user?.id,
      method: request.method(),
    })

    await next()
  }
}
