import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema } from '@ioc:Adonis/Core/Validator'
import Rdo from 'App/Models/Rdo'
import AtividadeRdo from 'App/Models/AtividadeRdo'

export default class RdoAtividadesController {
  public async store({ request, session, response, logger }: HttpContextContract) {
    const { rdoId } = request.params()

    const validationSchema = schema.create({
      atividadeId: schema.number(),
      horaInicio: schema.date(),
      horaFim: schema.date(),
      quantidade: schema.number.optional(),
      quantidadeInicial: schema.number.optional(),
      quantidadeFinal: schema.number.optional(),
      furoId: schema.number.optional(),
    })

    const data = await request.validate({
      schema: validationSchema,
    })

    try {
      const rdo = await Rdo.findOrFail(rdoId)

      await rdo.related('rdoAtividades').create(data)

      session.flash('success', 'Atividade cadastrada.')

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
      await AtividadeRdo.query().where({ id }).delete()

      session.flash('success', 'Atividade removida.')

      response.redirect().toRoute('admin.rdos.show', { id: rdoId })
    } catch (error) {
      logger.error(error)
      session.flash('error', error.message)
      return response.redirect().back()
    }
  }
}
