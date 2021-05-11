import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import Contrato from 'App/Models/Contrato'
import User from 'App/Models/User'
import Rdo from 'App/Models/Rdo'
import Atividade from 'App/Models/Atividade'

export default class AtividadeRdoUser extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public atividadeId: number

  @column()
  public userId: number

  @column()
  public rdoId: number

  @column()
  public contratoId: number

  @column()
  public quantidade: number

  @column()
  public quantidadeInicial: number

  @column()
  public quantidadeFinal: number

  @belongsTo(() => Contrato)
  public contrato: BelongsTo<typeof Contrato>

  @belongsTo(() => User)
  public user: BelongsTo<typeof User>

  @belongsTo(() => Atividade)
  public atividade: BelongsTo<typeof Atividade>

  @belongsTo(() => Rdo)
  public rdo: BelongsTo<typeof Rdo>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
