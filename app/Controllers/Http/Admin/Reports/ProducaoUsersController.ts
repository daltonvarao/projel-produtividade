import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User'
import ProducaoUserService from 'App/Services/ProducaoUserService'

export default class ProducaoUsersController {
  public async index({ view, request, session, logger }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const users = await User.query()
      .orderBy('nome')
      .apply((scopes) => scopes.inContract(contratoId))

    const { initialDate, finalDate, userId } = request.qs()

    if (!initialDate || !finalDate) {
      return view.render('admin/reports/producao_users/index', {
        users: users.map((i) => i.toJSON()),
      })
    }

    try {
      const service = new ProducaoUserService(
        contratoId,
        initialDate,
        finalDate,
        userId === 'undefined' ? undefined : userId
      )
      const producaoUsers = await service.build()

      return view.render('admin/reports/producao_users/index', {
        producaoUsers,
        users: users.map((i) => i.toJSON()),
      })
    } catch (error) {
      logger.error(error)

      return view.render('admin/reports/producao_users/index', {
        users: users.map((i) => i.toJSON()),
      })
    }
  }
}
