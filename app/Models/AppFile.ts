import { DateTime } from 'luxon'
import { BaseModel, column, computed } from '@ioc:Adonis/Lucid/Orm'

export default class AppFile extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public filename: string

  @column()
  public name: string

  @column()
  public version: string

  @column()
  public size: number

  @computed()
  public get sizeToMb() {
    return (this.size / 10 ** 6).toFixed(1)
  }

  @column()
  public notes: string

  @column.dateTime({
    serialize: (value?: DateTime) => {
      return value ? value.toLocal().toFormat('dd/MM/yyyy - HH:mm:ss') : value
    },
  })
  public lastModified: DateTime

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
