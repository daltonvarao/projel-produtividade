import Atividade from 'App/Models/Atividade'
import { DateTime } from 'luxon'

export default class ProducaoEquipamentosService {
  public contractId: number
  public initialDate: string
  public finalDate: string
  public equipamentoId: number | undefined

  constructor(
    contractId: number,
    initialDate: string,
    finalDate: string,
    equipamentoId: number | undefined = undefined
  ) {
    this.contractId = contractId
    this.initialDate = initialDate
    this.finalDate = finalDate
    this.equipamentoId = equipamentoId

    this._validateParams()
  }

  protected _baseQuery() {
    return Atividade.query().preload('rdoAtividades', (qra) => {
      return qra.whereHas('rdo', (qr) => {
        qr.whereBetween('data', [this.initialDate, this.finalDate]).andWhere({
          contrato_id: this.contractId,
        })

        if (this.equipamentoId) {
          qr.andWhere({ equipamentoId: this.equipamentoId })
        }
      })
    })
  }

  public round(num: number) {
    return Number(num.toFixed(2))
  }

  protected _summaryByTipoAtividade(atvds: Atividade[]) {
    const atividades = atvds.filter((atividade) => {
      return atividade.rdoAtividades.length > 0
    })

    const summary = atividades.map((atividade) => {
      let totalTime = 0
      let quantidade = 0

      atividade.rdoAtividades.map((atividadeRdo) => {
        const rdoAtividade = atividadeRdo.toJSON()

        const finalDate = DateTime.fromFormat(rdoAtividade.hora_fim, 'HH:mm')
        const initialDate = DateTime.fromFormat(rdoAtividade.hora_inicio, 'HH:mm')

        const time = finalDate.diff(initialDate).as('hours')

        totalTime += time
        quantidade += Number(atividadeRdo.quantidade)
      })

      return {
        name: atividade.descricao,
        totalTime: this.round(totalTime),
        quantidade: this.round(quantidade),
        atividade: atividade.toJSON(),
      }
    })

    const totalTime = atividades.length
      ? summary.reduce((pAtividade, cAtividade) => {
          return { ...cAtividade, totalTime: pAtividade.totalTime + cAtividade.totalTime }
        }).totalTime
      : 0

    return {
      atividades: summary.sort((a, b) => b.totalTime - a.totalTime),
      totalTime: this.round(totalTime),
    }
  }

  protected _validateParams() {
    if (!this.contractId) {
      throw Error('Contrato inválido, selecione um para continuar')
    }

    if (this.initialDate > this.finalDate) {
      throw Error('Datas inválidas, data final deve ser maior que data inicial')
    }
  }

  public async build() {
    const produtivas = await this._baseQuery().where({ tipo: 'produtiva' })
    const improdutivas = await this._baseQuery().where({ tipo: 'improdutiva' })
    const paradas = await this._baseQuery().where({ tipo: 'parada' })

    const summary = {
      produtivas: this._summaryByTipoAtividade(produtivas),
      improdutivas: this._summaryByTipoAtividade(improdutivas),
      paradas: this._summaryByTipoAtividade(paradas),
    }

    return {
      ...summary,
      totalTimes: [
        {
          name: 'produtivas',
          value: summary.produtivas.totalTime,
        },
        {
          name: 'improdutivas',
          value: summary.improdutivas.totalTime,
        },
        {
          name: 'paradas',
          value: summary.paradas.totalTime,
        },
      ],
    }
  }
}
