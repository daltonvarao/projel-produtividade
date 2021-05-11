import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema } from '@ioc:Adonis/Core/Validator'
import EquipamentoRdo from 'App/Models/EquipamentoRdo'
import Rdo from 'App/Models/Rdo'

export default class RdoEquipamentosController {
  public async store({ request, session, response, logger }: HttpContextContract) {
    const { rdoId } = request.params()

    const validationSchema = schema.create({
      equipamentoId: schema.number(),
      quantidade: schema.number(),
    })

    const data = await request.validate({
      schema: validationSchema,
    })

    try {
      const rdo = await Rdo.findOrFail(rdoId)

      await rdo.related('rdoEquipamentos').create(data)

      session.flash('success', 'Equipamento cadastrado.')

      return response.redirect().toRoute('admin.rdos.show', { id: rdoId })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }

  public async destroy({ request, session, response, logger }: HttpContextContract) {
    const { id, rdoId } = request.params()

    try {
      await EquipamentoRdo.query().where({ id }).delete()

      session.flash('success', 'Equipamento removido.')

      response.redirect().toRoute('admin.rdos.show', { id: rdoId })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }
}
