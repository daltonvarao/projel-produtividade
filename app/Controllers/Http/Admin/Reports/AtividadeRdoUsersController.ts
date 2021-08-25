import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User'
import AtividadeFuncionarioExcelService from 'App/Services/AtividadeFuncionarioExcelService'
import AtividadeFuncionarioService from 'App/Services/AtividadeFuncionarioService'
import { DateTime } from 'luxon'

export default class AtividadeRdoUsersController {
  public async index({ view, request, session, response }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const { userId, initialDate, finalDate, format } = request.qs()

    const users = await User.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .orderBy('nome')

    if (!initialDate || !finalDate || !userId) {
      return view.render('admin/reports/atividade_rdo_users/index', {
        users: users.map((u) => u.toJSON()),
      })
    }

    const service = new AtividadeFuncionarioService(contratoId, userId, initialDate, finalDate)
    const { atividadesUsuario, atividades, totals } = await service.build()

    // download excel
    if (format === 'excel') {
      const excelService = new AtividadeFuncionarioExcelService(userId, initialDate, finalDate, {
        atividadesUsuario,
        atividades,
        totals,
      })

      const workbook = await excelService.build()
      const excelReportBuffer = await workbook.xlsx.writeBuffer()
      const filename = `RelatorioAtividadesFuncionario_${DateTime.fromISO(initialDate).toFormat(
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

    return view.render('admin/reports/atividade_rdo_users/index', {
      users: users.map((u) => u.toJSON()),
      atividadesUsuario,
      atividades,
      totals,
    })
  }
}
