import { DateTime } from 'luxon'
import { BaseModel, column, computed } from '@ioc:Adonis/Lucid/Orm'
import Application from '@ioc:Adonis/Core/Application'
import fs from 'fs'
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

  @column()
  public currentRelease: boolean

  @computed()
  public get sizeToMb() {
    return (this.size / 10 ** 6).toFixed(1)
  }

  @computed()
  public get fileExists() {
    return fs.existsSync(Application.tmpPath('/uploads/apps', this.filename))
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
