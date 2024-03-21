import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Application from '@ioc:Adonis/Core/Application'


export default class RelatorioCompletoProducaoController {

    public async index({view, request, logger} : HttpContextContract) {

        const runPythonScript = async () => {

            return new Promise<void>((resolve) => {
                const { spawn } = require('child_process')

                const pyProg = spawn('python3', [Application.makePath('analysis/test_script.py')])

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

        await runPythonScript()

        return view.render('admin/reports/relatorio_completo_producao/index')
    }
}