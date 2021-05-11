import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import SyncServiceData from 'App/Services/SyncServiceData'

export default class ApiSyncDataController {
  public async index({ response, auth }: HttpContextContract) {
    const service = new SyncServiceData()
    const user = auth.user

    if (!user) {
      return response.unauthorized({ errors: [{ message: 'Unauthorized access.' }] })
    }

    try {
      const data = await service.build(user.contratoId)

      return data
    } catch (error) {
      console.log(error)
      return response.notFound({
        errors: [{ message: error.message }],
      })
    }
  }
}
