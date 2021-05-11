import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { RequestContract } from '@ioc:Adonis/Core/Request'

import ApiSyncVersion from 'App/Models/ApiSyncVersion'

const allowedMethods = ['PUT', 'POST', 'DELETE']

export default class ApiSyncVersionMiddleware {
  protected async recordApiSyncVersion(request: RequestContract, contratoId: number) {
    if (allowedMethods.includes(request.method())) {
      await ApiSyncVersion.create({
        requestMethod: request.method(),
        requestUrl: request.url(),
        contratoId,
      })
    }
  }

  public async handle({ request, session }: HttpContextContract, next: () => Promise<void>) {
    const contratoId: number = session.get('contratoId')

    await this.recordApiSyncVersion(request, contratoId)
    await next()
  }
}
