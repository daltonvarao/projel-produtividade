import ApiSyncVersion from 'App/Models/ApiSyncVersion'
import Furo from 'App/Models/Furo'
import Rdo from 'App/Models/Rdo'
import User from 'App/Models/User'
import { DateTime } from 'luxon'

interface RdoData {
  condicoesTempo: string
  data: DateTime
  nome: string
  pluviometria: number
  status: string
  equipamentoId: number
  estruturaId: number
  turno: string
}

interface Atividade {
  horaFim: DateTime
  horaInicio: DateTime
  atividadeId: number
  quantidade: number
  quantidadeInicial: number
  quantidadeFinal: number
  furoId?: number
  observacao?: string
}

interface Data extends RdoData {
  atividades: Atividade[]
  equipamentos: Array<{
    equipamentoId: number
    quantidade: number
  }>
  users: Array<{
    userId: number
  }>
}

export default class RdoBuilderService {
  protected static _rdoView({
    data,
    nome,
    status,
    pluviometria,
    condicoesTempo,
    equipamentoId,
    estruturaId,
    turno,
  }: Data): RdoData {
    return {
      condicoesTempo,
      data,
      nome,
      status,
      pluviometria,
      equipamentoId,
      estruturaId,
      turno,
    }
  }

  public static async _buildRdoAtividade({ furoId, ...atividade }: Atividade, rdo: Rdo) {
    const rdoAtividade = await rdo.related('rdoAtividades').create(atividade)

    if (furoId) {
      const furo = await Furo.query().where({ id: furoId }).first()

      if (furo) {
        await rdoAtividade.related('furo').associate(furo)
      }
    }

    return rdoAtividade
  }

  public static async build(user: User, data: Data) {
    const rdoData = this._rdoView(data)

    const rdo = await user.related('rdos').create({ ...rdoData, contratoId: user.contratoId })

    await rdo.related('rdoUsers').createMany(data.users)
    await rdo.related('rdoEquipamentos').createMany(data.equipamentos)

    const asyncRdoAtividades = data.atividades.map(async (atividade) => {
      const rdoAtividade = await this._buildRdoAtividade(atividade, rdo)

      return rdoAtividade
    })

    await Promise.all(asyncRdoAtividades)

    return rdo
  }

  public static async buildMany(user: User, data: Data[]) {
    const builds = data.map(async (rdoData) => {
      const rdo = await this.build(user, rdoData)

      return rdo
    })

    return await Promise.all(builds)
  }
}
