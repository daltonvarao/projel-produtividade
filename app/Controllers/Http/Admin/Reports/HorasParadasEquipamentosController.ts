import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Equipamento from 'App/Models/Equipamento'
import HorasParadasEquipamentoExcelService from 'App/Services/HorasParadasEquipamentoExcelService'
import HorasParadasEquipamentoService from 'App/Services/HorasParadasEquipamentoService'
import { DateTime } from 'luxon'

export default class HorasParadasEquipamentosController {
  public async index({ view, request, session, response }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const { equipamentoId, initialDate, finalDate, format } = request.qs()
    const equipamentos = await Equipamento.query().apply((scopes) => {
      scopes.isSonda()
      scopes.inContract(contratoId)
    })

    if (!initialDate || !finalDate || !equipamentoId) {
      return view.render('admin/reports/horas_paradas_equipamentos/index', {
        equipamentos: equipamentos.map((i) => i.toJSON()),
      })
    }

    const service = new HorasParadasEquipamentoService(
      contratoId,
      equipamentoId,
      initialDate,
      finalDate
    )
    const { horasParadas, total } = await service.build()

    // download excel
    if (format) {
      const excelService = new HorasParadasEquipamentoExcelService(
        contratoId,
        initialDate,
        finalDate
      )

      const wb = await excelService.build(horasParadas, total)
      const excelReportBuffer = await wb.xlsx.writeBuffer()

      const filename = `RelatorioHorasParadasEquipamento_${
        horasParadas[0].equipamento
      }_${DateTime.fromISO(initialDate).toFormat('dd-MM-yyyy')}_${DateTime.fromISO(
        finalDate
      ).toFormat('dd-MM-yyyy')}.xlsx`

      return response
        .header(
          'Content-Type',
          'application/application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        )
        .header('Content-Disposition', `attachment; filename="${filename}"`)
        .send(excelReportBuffer)
    }

    return view.render('admin/reports/horas_paradas_equipamentos/index', {
      equipamentos: equipamentos.map((i) => i.toJSON()),
      horasParadas,
      total,
    })
  }
}
