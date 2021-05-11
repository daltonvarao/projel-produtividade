import { DateTime } from 'luxon'
import {
  BaseModel,
  BelongsTo,
  belongsTo,
  column,
  hasMany,
  HasMany,
  scope,
} from '@ioc:Adonis/Lucid/Orm'
import Complexo from 'App/Models/Complexo'
import Estrutura from './Estrutura'

export default class Mina extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public contratoId: number

  @column()
  public complexoId: number

  @belongsTo(() => Complexo)
  public complexo: BelongsTo<typeof Complexo>

  @hasMany(() => Estrutura)
  public estruturas: HasMany<typeof Estrutura>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  public static inContract = scope((query, contratoId: number) => {
    query.where({ contratoId })
  })
}
