import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'

import Rdo from 'App/Models/Rdo'
import Atividade from 'App/Models/Atividade'
import Furo from './Furo'

export default class AtividadeRdo extends BaseModel {
  @belongsTo(() => Rdo)
  public rdo: BelongsTo<typeof Rdo>

  @belongsTo(() => Atividade)
  public atividade: BelongsTo<typeof Atividade>

  @belongsTo(() => Furo)
  public furo: BelongsTo<typeof Furo>

  @column({ isPrimary: true })
  public id: number

  @column()
  public quantidade: number

  @column()
  public quantidadeInicial: number

  @column()
  public quantidadeFinal: number

  @column.dateTime({
    serialize: (value?: DateTime) => {
      return value ? value.toFormat('HH:mm') : value
    },
  })
  public horaInicio: DateTime

  @column.dateTime({
    serialize: (value?: DateTime) => {
      return value ? value.toFormat('HH:mm') : value
    },
  })
  public horaFim: DateTime

  @column()
  public atividadeId: number

  @column()
  public rdoId: number

  @column()
  public furoId: number

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
