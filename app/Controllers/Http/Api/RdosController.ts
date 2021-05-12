import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema } from '@ioc:Adonis/Core/Validator'
import AtividadeRdoUserService from 'App/Services/AtividadeRdoUser'

import RdoBuilderService from 'App/Services/RdoBuilder'

export default class RdosController {
  public async store({ request, logger, response, auth }: HttpContextContract) {
    const validationSchema = schema.create({
      data: schema.array().members(
        schema.object().members({
          condicoesTempo: schema.string(),
          data: schema.date(),
          nome: schema.string(),
          pluviometria: schema.number(),
          status: schema.string(),
          equipamentoId: schema.number(),
          estruturaId: schema.number(),
          atividades: schema.array().members(
            schema.object().members({
              atividadeId: schema.number(),
              horaFim: schema.date(),
              horaInicio: schema.date(),
              quantidadeInicial: schema.number(),
              quantidadeFinal: schema.number(),
              quantidade: schema.number(),
              furoNome: schema.string.optional(),
            })
          ),
          equipamentos: schema.array().members(
            schema.object().members({
              equipamentoId: schema.number(),
              quantidade: schema.number(),
            })
          ),
          users: schema.array().members(
            schema.object().members({
              userId: schema.number(),
            })
          ),
        })
      ),
    })

    const { data } = await request.validate({
      schema: validationSchema,
    })

    try {
      const user = auth.user

      if (!user) {
        return response.unauthorized({
          errors: [{ message: 'Acesso não autorizado.' }],
        })
      }

      await RdoBuilderService.buildMany(user, data)

      return {
        message: 'Rdos cadastrados com sucesso',
      }
    } catch (error) {
      logger.error(error)

      return response.badRequest({
        errors: [
          {
            message: error.message,
          },
        ],
      })
    }
  }
}
