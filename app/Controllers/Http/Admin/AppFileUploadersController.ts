import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema } from '@ioc:Adonis/Core/Validator'
import Application from '@ioc:Adonis/Core/Application'
import { DateTime } from 'luxon'
import AppFile from 'App/Models/AppFile'
import fs from 'fs'

export default class AppFileUploadersController {
  public async index({ view }: HttpContextContract) {
    const apps = await AppFile.all()

    return view.render('admin/apps/index', {
      apps: apps.map((i) => i.toJSON()),
    })
  }

  public async create({ view }) {
    return view.render('admin/apps/create')
  }

  public async store({ request, response, logger, session }: HttpContextContract) {
    const validationSchema = schema.create({
      name: schema.string(),
      version: schema.string(),
      notes: schema.string.optional(),
      lastModified: schema.number(),
      app: schema.file({
        extnames: ['zip'],
        size: '100mb',
      }),
    })

    const { app, lastModified, ...appFileData } = await request.validate({
      schema: validationSchema,
    })

    const appFileCreateData = {
      ...appFileData,
      lastModified: DateTime.fromMillis(lastModified),
      size: app.size,
    }

    try {
      const appFile = new AppFile().merge(appFileCreateData)

      await app.move(Application.tmpPath('uploads/apps'), {
        name: `${Application.helpers.cuid()}.apk`,
      })

      await appFile.merge({ filename: app.fileName }).save()

      session.flash('success', 'App enviado')

      return response.redirect().toRoute('admin.apps_upload.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }

  public async destroy({ request, response, logger, session }: HttpContextContract) {
    const id = request.param('id')

    try {
      const file = await AppFile.findOrFail(id)

      fs.unlinkSync(Application.tmpPath('/uploads/apps', file.filename))

      await file.delete()
      session.flash('success', 'App removido')

      return response.redirect().toRoute('admin.apps_upload.index')
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)

      return response.redirect().back()
    }
  }
}
