import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import Contrato from 'App/Models/Contrato'

export default class ApiSyncVersion extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column()
  public requestUrl: string

  @column()
  public requestMethod: string

  @column()
  public contratoId: number

  @belongsTo(() => Contrato)
  public contrato: BelongsTo<typeof Contrato>

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
