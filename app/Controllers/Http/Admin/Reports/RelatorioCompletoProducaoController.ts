import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Application from '@ioc:Adonis/Core/Application'
import Env from '@ioc:Adonis/Core/Env'


export default class RelatorioCompletoProducaoController {

    public async index({view, request, logger, response} : HttpContextContract) {

        const runPythonScript = async ({initialDate, finalDate, excelFilePath}:{
            initialDate:string, finalDate:string, excelFilePath: string
        }) => {

            return new Promise<void>((resolve) => {
                const { spawn } = require('child_process')

                const pyProg = spawn('python3.9', [
                    Application.makePath('analysis/production_report.py'),
                    "--initialDate", initialDate,
                    "--finalDate", finalDate,
                    "--contractId", "1",
                    "--dbname", Env.get("PG_DB_NAME"),
                    "--user", Env.get("PG_USER"),
                    "--password", Env.get("PG_PASSWORD"),
                    "--host", Env.get("PG_HOST"),
                    "--port", Env.get("PG_PORT"),
                    "--target-excel-file", excelFilePath

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


        const {initialDate, finalDate} = request.qs()

        if (!initialDate || !finalDate) {
            return view.render('admin/reports/relatorio_completo_producao/index')
        }

        const excelFilePath = "/tmp/relatorio-completo-producao.xlsx"

        await runPythonScript({initialDate, finalDate,excelFilePath})

        return response.download(excelFilePath)


    }
}
