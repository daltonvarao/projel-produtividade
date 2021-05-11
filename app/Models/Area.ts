import { DateTime } from 'luxon'
import { BaseModel, column, scope, belongsTo, BelongsTo } from '@ioc:Adonis/Lucid/Orm'
import Contrato from 'App/Models/Contrato'

export default class Area extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public contratoId: number

  @column()
  public nome: string

  @belongsTo(() => Contrato)
  public contrato: BelongsTo<typeof Contrato>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  public static inContract = scope((query, contratoId) => {
    query.where({ contratoId })
  })
}
