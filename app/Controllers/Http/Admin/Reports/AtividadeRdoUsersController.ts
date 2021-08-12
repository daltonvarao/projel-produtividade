import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User'
import AtividadeFuncionarioService from 'App/Services/AtividadeFuncionarioService'

export default class AtividadeRdoUsersController {
  public async index({ view, request, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const { userId, initialDate, finalDate } = request.qs()

    const users = await User.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .orderBy('nome')

    if (!initialDate || !finalDate || !userId) {
      return view.render('admin/reports/atividade_rdo_users/index', {
        users: users.map((u) => u.toJSON()),
      })
    }

    const service = new AtividadeFuncionarioService(contratoId, userId, initialDate, finalDate)
    const { days, atividades, totals } = await service.build()

    return view.render('admin/reports/atividade_rdo_users/index', {
      users: users.map((u) => u.toJSON()),
      atividadeUsuarios: days,
      atividades,
      totals,
    })
  }
}
