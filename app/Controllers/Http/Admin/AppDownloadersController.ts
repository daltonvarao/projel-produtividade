import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Application from '@ioc:Adonis/Core/Application'
import AppFile from 'App/Models/AppFile'

export default class AppDownloadersController {
  public async index({ view }: HttpContextContract) {
    const apps = await AppFile.all()

    return view.render('admin/apps/downloads/index', {
      apps: apps.map((i) => i.toJSON()),
    })
  }

  public async show({ request, response, logger, session }: HttpContextContract) {
    const id = request.param('id')

    try {
      const file = await AppFile.findOrFail(id)

      session.flash('success', 'Aguarde o download')

      return response.attachment(
        Application.tmpPath('/uploads/apps', file.filename),
        `${file.name}.apk`
      )
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }
}
