import User from 'App/Models/User'

export default class DistribuicaoAtividadesService {
  public contractId: number
  public initialDate: string
  public finalDate: string
  public userId: number | undefined

  constructor(
    contractId: number,
    initialDate: string,
    finalDate: string,
    userId: number | undefined = undefined
  ) {
    this.contractId = contractId
    this.initialDate = initialDate
    this.finalDate = finalDate
    this.userId = userId
  }

  protected _baseQuery() {
    const userQuery = User.query()
      .apply((scopes) => scopes.inContract(this.contractId))
      .orderBy('nome')

    if (this.userId) {
      userQuery.where({ id: this.userId })
    }

    userQuery.preload('cargo').preload('rdoUsers', (qru) =>
      qru
        .whereHas('rdo', (qr) =>
          qr.whereBetween('data', [this.initialDate, this.finalDate]).andWhere({
            contrato_id: this.contractId,
          })
        )
        .preload('rdo', (qr) =>
          qr.preload('rdoAtividades', (qra) => {
            qra
              .preload('atividade', (qa) => qa.preload('atividadeCargoValores'))
              .whereHas('atividade', (qa) => qa.where({ tipo: 'produtiva' }))
          })
        )
    )

    return userQuery
  }

  protected _computeProducao(users: User[]) {
    return users.map((user) => {
      let producaoTotal = 0

      user.rdoUsers.map((rdoUser) =>
        rdoUser.rdo.rdoAtividades.map((rdoAtividade) => {
          const atividadeCargoValor = rdoAtividade.atividade.atividadeCargoValores.find(
            (atividadeCargoValor) => {
              return (
                atividadeCargoValor.cargoId === user.cargoId &&
                atividadeCargoValor.atividadeId === rdoAtividade.atividadeId
              )
            }
          )

          if (atividadeCargoValor) {
            const producaoUser = atividadeCargoValor.valorUnitario * rdoAtividade.quantidade
            producaoTotal += producaoUser
          }
        })
      )

      return { user: user.toJSON(), producaoTotal }
    })
  }

  public async build() {
    const users = await this._baseQuery()
    const producaoUser = this._computeProducao(users)

    return producaoUser
  }
}
