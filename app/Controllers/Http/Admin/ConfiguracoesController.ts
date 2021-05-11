import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Contrato from 'App/Models/Contrato'

export default class ConfiguracoesController {
  public async index({ view }: HttpContextContract) {
    const contratos = await Contrato.all()

    return view.render('admin/configuracoes/index', {
      contratos,
    })
  }

  public async store({ request, response, session }: HttpContextContract) {
    const { contratoId } = request.all()

    if (contratoId) {
      session.put('currentContrato', contratoId)
      session.put('contratoId', contratoId)
    }

    return response.redirect().toRoute('admin.dashboard.index')
  }
}
