import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'

import Atividade from 'App/Models/Atividade'
import Cargo from 'App/Models/Cargo'

export default class AtividadeCargoValor extends BaseModel {
  public static table = 'atividade_cargo_valores'

  @column({ isPrimary: true })
  public id: number

  @column()
  public valorUnitario: number

  @column()
  public cargoId: number

  @column()
  public atividadeId: number

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @belongsTo(() => Atividade)
  public atividade: BelongsTo<typeof Atividade>

  @belongsTo(() => Cargo)
  public cargo: BelongsTo<typeof Cargo>

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
