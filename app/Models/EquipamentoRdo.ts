import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import Equipamento from 'App/Models/Equipamento'

export default class EquipamentoRdo extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public quantidade: number

  @column()
  public rdoId: number

  @column()
  public equipamentoId: number

  @belongsTo(() => Equipamento)
  public equipamento: BelongsTo<typeof Equipamento>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
