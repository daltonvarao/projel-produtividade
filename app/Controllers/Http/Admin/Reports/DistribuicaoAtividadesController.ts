import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import DistribuicaoAtividadesService from 'App/Services/DistribuicaoAtividadesService'

export default class DistribuicaoAtividadesController {
  public async index({ view, request, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const { initialDate, finalDate } = request.qs()

    if (!initialDate || !finalDate) {
      return view.render('admin/reports/distribuicao_atividades/index', {})
    }

    const service = new DistribuicaoAtividadesService(contratoId, initialDate, finalDate)
    const summary = await service.build()

    console.log(summary)

    return view.render('admin/reports/distribuicao_atividades/index', {
      summary,
    })
  }
}
