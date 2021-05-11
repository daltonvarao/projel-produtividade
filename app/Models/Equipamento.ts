import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column, computed, scope } from '@ioc:Adonis/Lucid/Orm'
import Contrato from 'App/Models/Contrato'

export default class Equipamento extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public tag: string

  @column()
  public descricao: string

  @column()
  public sonda: boolean

  @column()
  public contratoId: number

  @belongsTo(() => Contrato)
  public contrato: BelongsTo<typeof Contrato>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @computed()
  public get tag_description() {
    return this.tag.concat(' - ').concat(this.descricao)
  }

  public static inContract = scope((query, contratoId: number) => {
    query.where({ contratoId })
  })
}
