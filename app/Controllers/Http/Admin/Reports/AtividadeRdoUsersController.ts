import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User'

import AtividadeFuncionarioService from 'App/Services/AtividadeFuncionarioService'

const fs = require('fs').promises
import Env from '@ioc:Adonis/Core/Env'
import Application from '@ioc:Adonis/Core/Application'

export default class AtividadeRdoUsersController {
  public async index({ view, request, session, response, logger }: HttpContextContract) {
    const contratoId: number = session.get('contratoId')

    const { userId, initialDate, finalDate, format } = request.qs()

    const users = await User.query()
      .apply((scopes) => scopes.inContract(contratoId))
      .orderBy('nome')

    if (!initialDate || !finalDate || !userId) {
      return view.render('admin/reports/atividade_rdo_users/index', {
        users: users.map((u) => u.toJSON()),
      })
    }

    const service = new AtividadeFuncionarioService(contratoId, userId, initialDate, finalDate)
    const { atividadesUsuario, atividades, totals } = await service.build()

    // download excel
    if (format === 'excel') {

      const colaboradorId = userId

      const excelFilePath = `/tmp/atividades-colaborador-${colaboradorId}.xlsx`

      const deleteFile = async (filePath) => {
        try {
            await fs.unlink(filePath)
        } catch (error) {
            if (error.code != 'ENOENT') {
                throw error
            }
        }
      }

      await deleteFile(excelFilePath)

      const runPythonScript = async ({colaboradorId, initialDate, finalDate, excelFilePath}:{
        colaboradorId: number, initialDate:string, finalDate:string, excelFilePath: string
    }) => {

        return new Promise<void>((resolve) => {
            const { spawn } = require('child_process')

            
            
            

            const pyProg = spawn(Env.get("PYTHON_PATH"), [
                Application.makePath('analysis/production_report.py'),
                "--initialDate", initialDate,
                "--finalDate", finalDate,
                "--contractId", contratoId,
                "--dbname", Env.get("PG_DB_NAME"),
                "--user", Env.get("PG_USER"),
                "--password", Env.get("PG_PASSWORD"),
                "--host", Env.get("PG_HOST"),
                "--port", Env.get("PG_PORT"),
                "--target-excel-file", excelFilePath,
                "--type-of-report", "atividade_colaborador",
                "--colaborador-id", colaboradorId

            ])

            pyProg.stdout.on('data', function (data) {
                logger.debug(data.toString())

            })

            pyProg.stderr.on('data', (data) => {
                logger.error(data.toString())
            })

            pyProg.on('close', () => {
                resolve()
            })
        })


    }

      await runPythonScript({colaboradorId, initialDate, finalDate, excelFilePath})

      return response.attachment(excelFilePath)

      
    }

    return view.render('admin/reports/atividade_rdo_users/index', {
      users: users.map((u) => u.toJSON()),
      atividadesUsuario,
      atividades,
      totals,
    })
  }
}
