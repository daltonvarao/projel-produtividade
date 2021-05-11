import { DateTime } from 'luxon'
import { BaseModel, belongsTo, BelongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import Cargo from 'App/Models/Cargo'

export default class CargoPermission extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public cargoId: number

  @column()
  public name: string

  @column()
  public can_create: boolean

  @column()
  public can_read: boolean

  @column()
  public can_update: boolean

  @column()
  public can_delete: boolean

  @belongsTo(() => Cargo)
  public cargo: BelongsTo<typeof Cargo>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
