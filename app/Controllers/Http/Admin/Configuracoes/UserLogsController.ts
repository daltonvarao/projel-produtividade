import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import UserLog from 'App/Models/UserLog'

export default class UserLogsController {
  public async index({ view, request }: HttpContextContract) {
    const { page } = request.qs()

    const logs = await UserLog.query()
      .preload('user')
      .orderBy('created_at', 'desc')
      .paginate(page || 1)

    return view.render('admin/user_logs/index', {
      logs: logs.baseUrl('logs').toJSON(),
    })
  }
}
