import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User'
import ProducaoUserService from 'App/Services/ProducaoUserService'
import ProducaoUsersExcel from 'App/Services/ProducaoUsersExcel'
import { DateTime } from 'luxon'

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
      const service = new ProducaoUserService(contratoId, initialDate, finalDate, userId)
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

  public async downloadExcel({ request, response, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const { initialDate, finalDate, userId } = request.qs()

    const service = new ProducaoUserService(contratoId, initialDate, finalDate, userId)

    const producaoUsers = await service.build()
    const producaoUsersExcel = new ProducaoUsersExcel()
    const workbook = producaoUsersExcel.build(producaoUsers)
    const excelReportBuffer = await workbook.xlsx.writeBuffer()

    const filename = `RelatorioProducaoFuncionarios_${DateTime.fromISO(initialDate).toFormat(
      'dd-MM-yyyy'
    )}_${DateTime.fromISO(finalDate).toFormat('dd-MM-yyyy')}.xlsx`

    return response
      .header(
        'Content-Type',
        'application/application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      )
      .header('Content-Disposition', `attachment; filename="${filename}"`)
      .send(excelReportBuffer)
  }
}
