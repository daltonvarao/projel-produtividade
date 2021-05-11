import { DateTime } from 'luxon'
import {
  BaseModel,
  belongsTo,
  BelongsTo,
  column,
  HasMany,
  hasMany,
  scope,
} from '@ioc:Adonis/Lucid/Orm'
import Mina from 'App/Models/Mina'
import Furo from './Furo'

export default class Estrutura extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public contratoId: number

  @column()
  public minaId: number

  @belongsTo(() => Mina)
  public mina: BelongsTo<typeof Mina>

  @hasMany(() => Furo)
  public furos: HasMany<typeof Furo>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  public static inContract = scope((query, contratoId: number) => {
    query.where({ contratoId })
  })
}
