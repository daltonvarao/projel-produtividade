import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User'

export default class ProducaoUsersController {
  public async index({ view, request, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const { initialDate, finalDate } = request.qs()

    if (!initialDate || !finalDate) {
      return view.render('admin/reports/producao_users/index')
    }

    const users = await User.query()
      .where({ contratoId })
      .preload('cargo')
      .preload('rdoUsers', (qru) =>
        qru
          .whereHas('rdo', (qr) => qr.whereBetween('data', [initialDate, finalDate]))
          .preload('rdo', (qr) =>
            qr.preload('rdoAtividades', (qra) => {
              qra
                .whereHas('atividade', (qa) => {
                  qa.where('tipo', 'produtiva')
                })
                .preload('atividade', (qa) => qa.preload('atividadeCargoValores'))
                .preload('rdo')
            })
          )
      )

    const producaoUsers = users
      .map((user) => {
        return user.rdoUsers.map((rdo) => {
          let quantidade = 0

          rdo.rdo.rdoAtividades.map((atividade) => {
            const cargosValores = atividade.atividade.atividadeCargoValores

            const cargo = cargosValores.filter(
              (cv) => cv.cargoId === user.cargoId && cv.atividadeId === atividade.atividadeId
            )[0]

            quantidade += Number(atividade.quantidade * cargo.valorUnitario)
          })

          return { user: user, quantidade }
        })
      })
      .filter((ps) => ps.length)
      .map((ps) => {
        return ps.reduce((pv, cv) => {
          return { quantidade: pv.quantidade + cv.quantidade, user: pv.user }
        })
      })

    return view.render('admin/reports/producao_users/index', {
      users: users.map((u) => u.toJSON()),
      producaoUsers,
    })
  }
}
