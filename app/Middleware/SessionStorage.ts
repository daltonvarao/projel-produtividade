import { SessionContract } from '@ioc:Adonis/Addons/Session'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Contrato from 'App/Models/Contrato'
import { RequestContract } from '@ioc:Adonis/Core/Request'

export default class SessionStorageMiddleware {
  protected async _storeCurrentContrato(session: SessionContract, request: RequestContract) {
    const contratoId = session.get('contratoId')

    const currentContrato = await Contrato.findOrFail(contratoId)

    request.currentContrato = currentContrato
  }

  public async handle({ request, session }: HttpContextContract, next: () => Promise<void>) {
    try {
      await this._storeCurrentContrato(session, request)

      await next()
    } catch (error) {
      console.log(error)
      await next()
    }
  }
}
