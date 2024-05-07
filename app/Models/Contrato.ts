import { DateTime } from 'luxon'
import { BaseModel, column, HasMany, hasMany } from '@ioc:Adonis/Lucid/Orm'

import AtividadeCargoValor from 'App/Models/AtividadeCargoValor'
import User from 'App/Models/User'
import Cargo from 'App/Models/Cargo'
import Equipamento from 'App/Models/Equipamento'
import Atividade from 'App/Models/Atividade'
import LimitePagamento from './LimitePagamento'

export default class Contrato extends BaseModel {
  public static table = 'contratos'

  @column({ isPrimary: true })
  public id: number

  @column()
  public centroCusto: number

  @column()
  public descricao: string

  @column()
  public numero: string

  @hasMany(() => AtividadeCargoValor)
  public atividadeCargoValores: HasMany<typeof AtividadeCargoValor>

  @hasMany(() => User)
  public users: HasMany<typeof User>

  @hasMany(() => Atividade)
  public atividades: HasMany<typeof Atividade>

  @hasMany(() => Cargo)
  public cargos: HasMany<typeof Cargo>

  @hasMany(() => Equipamento)
  public equipamentos: HasMany<typeof Equipamento>

  @hasMany(() => LimitePagamento)
  public limitePagamentos: HasMany<typeof LimitePagamento>

  @column.dateTime({
    autoCreate: true,
    serialize: (value?: DateTime) => {
      return value ? value.toFormat('dd/MM/yyyy') : value
    },
  })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
