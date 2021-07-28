import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Equipamento from 'App/Models/Equipamento'
import ProducaoEquipamentosService from 'App/Services/ProducaoEquipamentosService'

export default class ProducaoEquipamentosController {
  public async index({ view, request, session, response }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const equipamentos = await Equipamento.query().apply((scopes) => {
      scopes.inContract(contratoId)
      scopes.isSonda()
    })

    const { initialDate, finalDate, equipamentoId } = request.qs()

    if (Object.keys(request.qs()).length === 0) {
      return view.render('admin/reports/producao_equipamentos/index', {
        equipamentos,
      })
    } else {
      if (!initialDate || !finalDate) {
        session.flash('error', 'Selecione as datas para continuar')
        return response.redirect().back()
      }
    }

    try {
      const service = new ProducaoEquipamentosService(
        contratoId,
        initialDate,
        finalDate,
        equipamentoId
      )
      const summary = await service.build()

      return view.render('admin/reports/producao_equipamentos/index', {
        summary,
        equipamentos,
      })
    } catch (error) {
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }
}
