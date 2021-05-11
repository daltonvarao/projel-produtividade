import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, validator } from '@ioc:Adonis/Core/Validator'

import ApiSyncVersion from 'App/Models/ApiSyncVersion'

interface AppData {
  syncVersionId: number
}

export default class ApiSyncVersionsController {
  // check if app ApiSyncVersion stored is outdated or not
  protected checkIsOutdated(lastApiSyncVersion: ApiSyncVersion, data: AppData) {
    return !(lastApiSyncVersion.id === data.syncVersionId)
  }

  public async index({ response, request }: HttpContextContract) {
    const validationSchema = schema.create({
      syncVersionId: schema.number(),
    })

    const { sync_version_id: syncVersionId } = request.qs()

    const data = await validator.validate({
      schema: validationSchema,
      messages: {
        required: '{{ field }} é obrigatório',
      },
      reporter: validator.reporters.api,
      data: { syncVersionId },
    })

    const lastApiSyncVersion = await ApiSyncVersion.query().orderBy('created_at', 'desc').first()

    if (!lastApiSyncVersion) {
      return response.status(404).json({
        errors: [{ message: 'Nenhuma versão econtrada' }],
      })
    }

    const outdated = this.checkIsOutdated(lastApiSyncVersion, data)

    return { outdated }
  }
}
