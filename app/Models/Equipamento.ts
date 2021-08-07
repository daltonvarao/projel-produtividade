import { DateTime } from 'luxon'
import {
  BaseModel,
  BelongsTo,
  belongsTo,
  column,
  computed,
  hasMany,
  scope,
  HasMany,
} from '@ioc:Adonis/Lucid/Orm'
import Contrato from 'App/Models/Contrato'
import Rdo from './Rdo'

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

  @hasMany(() => Rdo)
  public rdo: HasMany<typeof Rdo>

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

  public static isSonda = scope((query) => {
    query.andWhere({ sonda: true })
  })

  public static whereDescricaoLike = scope((query, descricao: string) => {
    if (descricao) query.andWhere('descricao', 'ilike', `%${descricao}%`)
  })

  public static whereTagLike = scope((query, tag: string) => {
    if (tag) query.andWhere('tag', 'ilike', `%${tag}%`)
  })
}
