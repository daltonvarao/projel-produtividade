import { DateTime } from 'luxon'
import {
  BaseModel,
  BelongsTo,
  belongsTo,
  column,
  HasMany,
  hasMany,
  scope,
} from '@ioc:Adonis/Lucid/Orm'
import Estrutura from 'App/Models/Estrutura'
import AtividadeRdo from 'App/Models/AtividadeRdo'

export default class Furo extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public contratoId: number

  @column()
  public estruturaId: number

  @column()
  public invalid: boolean

  @belongsTo(() => Estrutura)
  public estrutura: BelongsTo<typeof Estrutura>

  @hasMany(() => AtividadeRdo)
  public rdoAtividades: HasMany<typeof AtividadeRdo>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  public static inContract = scope((query, contratoId: number) => {
    query.where({ contratoId })
  })
}
