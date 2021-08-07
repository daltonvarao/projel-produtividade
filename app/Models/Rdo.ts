import { DateTime } from 'luxon'
import {
  BaseModel,
  BelongsTo,
  belongsTo,
  column,
  computed,
  HasMany,
  hasMany,
  scope,
} from '@ioc:Adonis/Lucid/Orm'

import AtividadeRdo from 'App/Models/AtividadeRdo'
import RdoUser from 'App/Models/RdoUser'
import EquipamentoRdo from 'App/Models/EquipamentoRdo'
import User from 'App/Models/User'
import Contrato from 'App/Models/Contrato'
import AtividadeRdoUser from 'App/Models/AtividadeRdoUser'
import Equipamento from 'App/Models/Equipamento'
import Estrutura from 'App/Models/Estrutura'

export default class Rdo extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column.dateTime({
    serialize: (value: DateTime) => {
      return value.toFormat('dd/MM/yyyy')
    },
  })
  public data: DateTime

  @computed()
  public get isoData() {
    return this.data.toISODate()
  }

  @computed()
  public get formattedData() {
    return this.data.toFormat('dd/MM/yyyy')
  }

  @column()
  public status: string

  @column()
  public condicoesTempo: string

  @column()
  public pluviometria: number

  @column()
  public userId: number

  @column()
  public equipamentoId: number

  @column()
  public estruturaId: number

  @column()
  public contratoId: number

  @belongsTo(() => User)
  public user: BelongsTo<typeof User>

  @belongsTo(() => Estrutura)
  public estrutura: BelongsTo<typeof Estrutura>

  @belongsTo(() => Contrato)
  public contrato: BelongsTo<typeof Contrato>

  @hasMany(() => AtividadeRdo)
  public rdoAtividades: HasMany<typeof AtividadeRdo>

  @hasMany(() => RdoUser)
  public rdoUsers: HasMany<typeof RdoUser>

  @hasMany(() => EquipamentoRdo)
  public rdoEquipamentos: HasMany<typeof EquipamentoRdo>

  @belongsTo(() => Equipamento)
  public equipamentoPrincipal: BelongsTo<typeof Equipamento>

  @hasMany(() => AtividadeRdoUser)
  public rdoAtividadeUsers: HasMany<typeof AtividadeRdoUser>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  public static inContract = scope((query, contratoId: number) => {
    query.where({ contratoId })
  })

  public static inPeriod = scope((query, initialDate: string, finalDate: string) => {
    if (finalDate && initialDate) query.whereBetween('data', [initialDate, finalDate])
  })

  public static whereNameLike = scope((query, nome: string) => {
    if (nome) query.where('nome', 'ilike', `%${nome}%`)
  })

  public static whereEstruturaId = scope((query, estruturaId: number) => {
    if (estruturaId) query.where({ estruturaId })
  })

  public static whereEquipamentoId = scope((query, equipamentoId: number) => {
    if (equipamentoId) query.where({ equipamentoId })
  })

  public static whereStatus = scope((query, status: string) => {
    if (status) query.where({ status })
  })
}
