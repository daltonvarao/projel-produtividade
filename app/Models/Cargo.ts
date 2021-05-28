import { DateTime } from 'luxon'
import {
  BaseModel,
  belongsTo,
  column,
  hasMany,
  HasMany,
  BelongsTo,
  scope,
} from '@ioc:Adonis/Lucid/Orm'
import CargoPermission from 'App/Models/CargoPermission'
import Contrato from 'App/Models/Contrato'
import User from 'App/Models/User'
import AtividadeCargoValor from './AtividadeCargoValor'

export default class Cargo extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public titulo: string

  @column()
  public contratoId: number

  @belongsTo(() => Contrato)
  public contrato: BelongsTo<typeof Contrato>

  @hasMany(() => CargoPermission)
  public permissions: HasMany<typeof CargoPermission>

  @hasMany(() => User)
  public users: HasMany<typeof User>

  @hasMany(() => AtividadeCargoValor)
  public atividadeCargoValores: HasMany<typeof AtividadeCargoValor>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  public static inContract = scope((query, contratoId: number) => {
    query.where('contratoId', contratoId)
  })
}
