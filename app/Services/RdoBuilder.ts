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
  furoNome?: string
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

  public static async _buildRdoAtividade({ furoNome: nome, ...atividade }: Atividade, rdo: Rdo) {
    const rdoAtividade = await rdo.related('rdoAtividades').create(atividade)

    if (nome) {
      const furo = await Furo.firstOrNew(
        { nome, contratoId: rdo.contratoId, estruturaId: rdo.estruturaId },
        { nome, contratoId: rdo.contratoId }
      )

      if (furo.$isNew) {
        await ApiSyncVersion.create({
          contratoId: rdo.contratoId,
          requestMethod: 'POST',
          requestUrl: '/api/rdos',
        })

        await furo.save()
      }

      await rdoAtividade.related('furo').associate(furo)
    }

    return rdoAtividade
  }

  public static async build(user: User, data: Data) {
    const rdoData = this._rdoView(data)

    const rdo = await user.related('rdos').create({ ...rdoData, contratoId: user.contratoId })

    await rdo.related('rdoUsers').createMany(data.users)
    await rdo.related('rdoEquipamentos').createMany(data.equipamentos)

    const asyncRdoAtividades = data.atividades.map(async (atividade) => {
      return this._buildRdoAtividade(atividade, rdo)
    })

    await Promise.all(asyncRdoAtividades)

    return rdo
  }

  public static async buildMany(user: User, data: Data[]) {
    const builds = data.map(async (rdoData) => {
      return this.build(user, rdoData)
    })

    return await Promise.all(builds)
  }
}
