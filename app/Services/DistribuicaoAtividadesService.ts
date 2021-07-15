import Atividade from 'App/Models/Atividade'
import AtividadeRdo from 'App/Models/AtividadeRdo'

export default class DistribuicaoAtividadesService {
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

  public _summaryByTipoAtividade(atvds: Atividade[]) {
    const atividades = atvds.filter((atividade) => {
      return atividade.rdoAtividades.length > 0
    })

    const summary = atividades.map((atividade) => {
      let totalTime = 0
      let quantidade = 0

      atividade.rdoAtividades.map((atividadeRdo) => {
        const time = atividadeRdo.horaFim.diff(atividadeRdo.horaInicio).as('hour')
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

  public _totalTime(rdoAtividades: AtividadeRdo[]) {
    let totalTime = 0

    rdoAtividades.map((atividadeRdo) => {
      const time = atividadeRdo.horaFim.diff(atividadeRdo.horaInicio).as('hour')
      totalTime += time
    })

    return this.round(totalTime)
  }

  public async build() {
    const atividades = await AtividadeRdo.query()
      .whereHas('rdo', (qr) => {
        qr.whereBetween('data', [this.initialDate, this.finalDate]).andWhere({
          contrato_id: this.contractId,
        })

        if (this.equipamentoId) {
          qr.andWhere({ equipamentoId: this.equipamentoId })
        }
      })
      .preload('rdo')

    const produtivas = await this._baseQuery().where({ tipo: 'produtiva' })
    const improdutivas = await this._baseQuery().where({ tipo: 'improdutiva' })
    const paradas = await this._baseQuery().where({ tipo: 'parada' })

    const totalTime = this._totalTime(atividades)

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
      totalTime,
    }
  }
}
