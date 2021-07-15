import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Equipamento from 'App/Models/Equipamento'
import DistribuicaoAtividadesService from 'App/Services/DistribuicaoAtividadesService'

export default class DistribuicaoAtividadesController {
  public async index({ view, request, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')
    const equipamentos = await Equipamento.query().apply((scopes) => {
      scopes.inContract(contratoId)
      scopes.isSonda()
    })

    const { initialDate, finalDate, equipamentoId } = request.qs()

    if (!initialDate || !finalDate) {
      return view.render('admin/reports/distribuicao_atividades/index', {
        equipamentos,
      })
    }

    const service = new DistribuicaoAtividadesService(
      contratoId,
      initialDate,
      finalDate,
      equipamentoId === 'undefined' ? undefined : equipamentoId
    )
    const summary = await service.build()

    return view.render('admin/reports/distribuicao_atividades/index', {
      summary,
      equipamentos,
    })
  }
}
