import Rdo from 'App/Models/Rdo'

interface Data {
  atividades: Array<{
    atividadeId: number
    quantidade: number
    quantidadeInicial: number
    quantidadeFinal: number
  }>

  users: Array<{
    userId: number
  }>
}

interface AtividadeRdoUserData {
  userId: number
  atividadeId: number
  quantidade: number
  quantidadeInicial: number
  quantidadeFinal: number
}

export default class AtividadeRdoUserService {
  protected static _buildData(data: Data) {
    const atividadesRdoUsers: AtividadeRdoUserData[] = []

    data.atividades.forEach((atividade) => {
      data.users.forEach((user) => {
        atividadesRdoUsers.push({
          atividadeId: atividade.atividadeId,
          quantidade: atividade.quantidade,
          quantidadeFinal: atividade.quantidadeFinal,
          quantidadeInicial: atividade.quantidadeInicial,
          userId: user.userId,
        })
      })
    })

    return atividadesRdoUsers
  }

  public static async build(data: Data, rdo: Rdo) {
    const atividadeRdoUsers = this._buildData(data)

    return await rdo.related('rdoAtividadeUsers').createMany(atividadeRdoUsers)
  }

  public static async buildMany(data: Data[], rdos: Rdo[]) {
    const builds = rdos.map(async (rdo, index) => {
      return this.build(data[index], rdo)
    })

    return Promise.all(builds)
  }
}
