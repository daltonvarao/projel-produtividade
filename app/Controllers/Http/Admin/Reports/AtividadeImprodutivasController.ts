import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class AtividadeImprodutivasController {
  public async index({ view, request, session }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const { initialDate, finalDate } = request.qs()

    if (!initialDate || !finalDate) {
      return view.render('admin/reports/atividades_improdutivas/index', {})
    }

    const atividades = []

    return view.render('admin/reports/atividade_rdo_users/index', {
      atividades: atividades,
    })
  }
}
