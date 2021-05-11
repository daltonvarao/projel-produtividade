import { DateTime } from 'luxon'
import { BaseModel, column, HasMany, hasMany, scope } from '@ioc:Adonis/Lucid/Orm'
import Mina from './Mina'

export default class Complexo extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public contratoId: number

  @hasMany(() => Mina)
  public minas: HasMany<typeof Mina>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  public static inContract = scope((query, contratoId: number) => {
    query.where({ contratoId })
  })
}
