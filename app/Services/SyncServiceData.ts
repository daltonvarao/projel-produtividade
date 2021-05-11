import ApiSyncVersion from 'App/Models/ApiSyncVersion'
import Atividade from 'App/Models/Atividade'
import Cargo from 'App/Models/Cargo'
import Contrato from 'App/Models/Contrato'
import Equipamento from 'App/Models/Equipamento'
import Estrutura from 'App/Models/Estrutura'
import Furo from 'App/Models/Furo'
import User from 'App/Models/User'

interface EquipamentoContract {
  id: number
  tag: string
  descricao: string
  sonda: boolean
  tag_description: string
}

interface AtividadeContract {
  id: number
  descricao: string
  unidadeMedida: string
  tipo: string
}

interface CargoContract {
  id: number
  titulo: string
}
interface EstruturaContract {
  id: number
  nome: string
}
interface FuroContract {
  id: number
  estruturaId: number
  nome: string
}

interface UserContract {
  id: number
  cpf: string
  nome: string
  cargoId: number
}

interface ContratoContract {
  id: number
  numero: string
  descricao: string
}

interface Data {
  equipamentos: EquipamentoContract[]
  furos: FuroContract[]
  estruturas: EstruturaContract[]
  atividades: AtividadeContract[]
  users: UserContract[]
  cargos: CargoContract[]
  contratos: ContratoContract[]
  sync_version_id: number
}

export default class SyncServiceData {
  private _atividadesView(atividades: Atividade[]): AtividadeContract[] {
    return atividades.map(({ id, unidadeMedida, descricao, tipo }) => ({
      id,
      descricao,
      unidadeMedida,
      tipo,
    }))
  }

  private _contratosView(contratos: Contrato[]): ContratoContract[] {
    return contratos.map(({ id, descricao, numero }) => ({
      id,
      descricao,
      numero,
    }))
  }

  private _usersView(users: User[]): UserContract[] {
    return users.map(({ id, cpf, nome, cargoId }) => ({
      id,
      cpf,
      nome,
      cargoId,
    }))
  }

  private _cargosView(cargos: Cargo[]): CargoContract[] {
    return cargos.map(({ id, titulo }) => ({
      id,
      titulo,
    }))
  }

  private _equipamentosView(equipamentos: Equipamento[]): EquipamentoContract[] {
    return equipamentos.map(({ id, descricao, tag, tag_description, sonda }) => ({
      id,
      descricao,
      tag,
      sonda,
      tag_description,
    }))
  }

  public async build(contratoId: number) {
    const syncVersionId = await ApiSyncVersion.query().orderBy('created_at', 'desc').first()

    if (!syncVersionId) {
      throw new Error('ApiSyncVersion not found.')
    }

    const atividades = await Atividade.query().apply((scopes) => scopes.inContract(contratoId))
    const equipamentos = await Equipamento.query().apply((scopes) => scopes.inContract(contratoId))
    const users = await User.query().apply((scopes) => scopes.inContract(contratoId))
    const cargos = await Cargo.query().apply((scopes) => scopes.inContract(contratoId))
    const furos = await Furo.query().apply((scopes) => scopes.inContract(contratoId))
    const estruturas = await Estrutura.query().apply((scopes) => scopes.inContract(contratoId))
    const contratos = await Contrato.all()

    const data: Data = {
      atividades: this._atividadesView(atividades),
      cargos: this._cargosView(cargos),
      equipamentos: this._equipamentosView(equipamentos),
      users: this._usersView(users),
      contratos: this._contratosView(contratos),
      sync_version_id: syncVersionId.id,
      estruturas: estruturas.map(({ nome, id }) => ({ nome, id })),
      furos: furos.map(({ nome, id, estruturaId }) => ({ nome, id, estruturaId })),
    }

    return data
  }
}
