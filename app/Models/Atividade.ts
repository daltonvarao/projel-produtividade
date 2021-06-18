import { DateTime } from 'luxon'
import {
  BaseModel,
  BelongsTo,
  belongsTo,
  column,
  hasMany,
  HasMany,
  scope,
} from '@ioc:Adonis/Lucid/Orm'
import Contrato from 'App/Models/Contrato'
import AtividadeCargoValor from 'App/Models/AtividadeCargoValor'
import AtividadeRdo from './AtividadeRdo'

export default class Atividade extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public descricao: string

  @column()
  public tipo: string

  @column()
  public contratoId: number

  @column()
  public unidadeMedida: string

  @belongsTo(() => Contrato)
  public contrato: BelongsTo<typeof Contrato>

  @hasMany(() => AtividadeCargoValor)
  public atividadeCargoValores: HasMany<typeof AtividadeCargoValor>

  @hasMany(() => AtividadeRdo)
  public rdoAtividades: HasMany<typeof AtividadeRdo>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  public static inContract = scope((query, contratoId: number) => {
    query.where('contratoId', contratoId)
  })
}
