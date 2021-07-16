import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Contrato from 'App/Models/Contrato'

export default class ConfiguracoesController {
  public async index({ view, auth, response }: HttpContextContract) {
    const contratos = await Contrato.all()
    const user = auth.user

    if (!user) {
      return response.redirect('sessions.index')
    }

    await user.load('contrato')
    await user.load('cargo')

    return view.render('admin/configuracoes/index', {
      contratos,
      user: user.toJSON(),
    })
  }

  public async store({ request, response, session }: HttpContextContract) {
    const { contratoId } = request.all()

    if (contratoId) {
      session.put('currentContrato', contratoId)
      session.put('contratoId', contratoId)
    }

    session.flash('success', 'Configurações atualizadas.')

    return response.redirect().back()
  }
}
