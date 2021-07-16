import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column, computed } from '@ioc:Adonis/Lucid/Orm'
import User from 'App/Models/User'

export default class UserLog extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public ip: string

  @column()
  public route: string

  @column()
  public url: string

  @column()
  public userId: number

  @column()
  public method: string

  @computed()
  public get acao() {
    switch (this.method) {
      case 'GET':
        return 'Leitura'
      case 'POST':
        return 'Criação'
      case 'PUT':
        return 'Atualização'
      case 'DELETE':
        return 'Exclusão'
    }
  }

  @belongsTo(() => User)
  public user: BelongsTo<typeof User>

  @computed()
  public get hora() {
    return this.createdAt.toFormat('HH:mm')
  }

  @computed()
  public get data() {
    return this.createdAt.toFormat('dd/MM/yyyy')
  }

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
