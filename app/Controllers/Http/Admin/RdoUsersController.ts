import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema } from '@ioc:Adonis/Core/Validator'
import Rdo from 'App/Models/Rdo'
import RdoUser from 'App/Models/RdoUser'

export default class RdoUsersController {
  public async store({ request, response, session, logger }: HttpContextContract) {
    const { rdoId } = request.params()

    const validationSchema = schema.create({
      userId: schema.number(),
    })

    const data = await request.validate({
      schema: validationSchema,
    })

    try {
      const rdo = await Rdo.findOrFail(rdoId)
      await rdo.related('rdoUsers').create(data)

      session.flash('success', 'Colaborador adicionado.')

      response.redirect().toRoute('admin.rdos.show', { id: rdoId })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async destroy({ request, session, response, logger }: HttpContextContract) {
    const { id, rdoId } = request.params()

    try {
      await RdoUser.query().where({ id }).delete()

      session.flash('success', 'Colaborador removido.')

      response.redirect().toRoute('admin.rdos.show', { id: rdoId })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }
}
