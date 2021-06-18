import Atividade from 'App/Models/Atividade'
import AtividadeRdo from 'App/Models/AtividadeRdo'

export default class DistribuicaoAtividadesService {
  public contractId: number
  public initialDate: string
  public finalDate: string

  constructor(contractId: number, initialDate: string, finalDate: string) {
    this.contractId = contractId
    this.initialDate = initialDate
    this.finalDate = finalDate
  }

  protected _baseQuery() {
    return Atividade.query().preload('rdoAtividades', (qra) =>
      qra.whereHas('rdo', (qr) =>
        qr.whereBetween('data', [this.initialDate, this.finalDate]).andWhere({
          contrato_id: this.contractId,
        })
      )
    )
  }

  public async build() {
    const produtivas = await this._baseQuery().where({ tipo: 'produtiva' })
    const improdutivas = await this._baseQuery().where({ tipo: 'improdutiva' })
    const paradas = await this._baseQuery().where({ tipo: 'parada' })

    const data = {
      produtivas: produtivas.map((i) => i.toJSON()),
      improdutivas: improdutivas.map((i) => i.toJSON()),
      paradas: paradas.map((i) => i.toJSON()),
    }

    return data
  }
}
