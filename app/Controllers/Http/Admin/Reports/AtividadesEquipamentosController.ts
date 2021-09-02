import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Equipamento from 'App/Models/Equipamento'
import AtividadeEquipamentoService from 'App/Services/AtividadeEquipamentoService'

export default class AtividadesEquipamentosController {
  public async index({ view, request, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const { equipamentoId, initialDate, finalDate, format } = request.qs()
    const equipamentos = await Equipamento.query().apply((scopes) => {
      scopes.isSonda()
      scopes.inContract(contratoId)
    })

    if (!initialDate || !finalDate || !equipamentoId) {
      return view.render('admin/reports/atividades_equipamentos/index', {
        equipamentos: equipamentos.map((i) => i.toJSON()),
      })
    }

    const service = new AtividadeEquipamentoService(
      contratoId,
      equipamentoId,
      initialDate,
      finalDate
    )
    const { atividadesEquipamento, atividades, totalAtividades } = await service.build()

    // download excel
    if (format) {
      session.flash('error', 'Formato não permitido')
      //   const excelService = new AtividadeFuncionarioExcelService(
      //     equipamentoId,
      //     initialDate,
      //     finalDate,
      //     {
      //       atividadesUsuario,
      //       atividades,
      //       totals,
      //     }
      //   )
      //   const workbook = await excelService.build()
      //   const excelReportBuffer = await workbook.xlsx.writeBuffer()
      //   const filename = `RelatorioAtividadesFuncionario_${DateTime.fromISO(initialDate).toFormat(
      //     'dd-MM-yyyy'
      //   )}_${DateTime.fromISO(finalDate).toFormat('dd-MM-yyyy')}.xlsx`
      //   return response
      //     .header(
      //       'Content-Type',
      //       'application/application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      //     )
      //     .header('Content-Disposition', `attachment; filename="${filename}"`)
      //     .send(excelReportBuffer)
    }

    return view.render('admin/reports/atividades_equipamentos/index', {
      equipamentos: equipamentos.map((i) => i.toJSON()),
      atividadesEquipamento,
      totalAtividades,
      atividades,
    })
  }
}
