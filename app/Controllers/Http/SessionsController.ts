import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Logger from '@ioc:Adonis/Core/Logger'

export default class SessionsController {
  public async index({ view, auth, response }: HttpContextContract) {
    const isAuthenticated = await auth.check()

    if (isAuthenticated) {
      return response.redirect().toRoute('admin.dashboard.index')
    }

    return view.render('sessions/index')
  }

  public async store({ request, auth, response, session }: HttpContextContract) {
    const { cpf, password } = request.only(['cpf', 'password'])

    try {
      await auth.attempt(cpf, password)

      const { token, user } = await auth.use('api').attempt(cpf, password)

      session.put('userToken', token)
      session.put('contratoId', user.contratoId)

      return response.redirect().toRoute('admin.dashboard.index')
    } catch (error) {
      Logger.error(error)
      session.flash('error', 'Usuário ou senha incorretos')

      return response.redirect().back()
    }
  }

  public async destroy({ auth, session, response }: HttpContextContract) {
    try {
      await auth.logout()
      session.clear()

      return response.redirect().toRoute('sessions.index')
    } catch (error) {
      Logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }
}
