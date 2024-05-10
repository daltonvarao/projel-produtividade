import { BaseModel, BelongsTo, belongsTo, column } from "@ioc:Adonis/Lucid/Orm"
import Contrato from "./Contrato"
import Cargo from "./Cargo"

export default class LimitePagamento extends BaseModel {
    @column({ isPrimary: true })
    public id: number

    @column()
    public contratoId: number

    @belongsTo(() => Contrato)
    public contrato: BelongsTo<typeof Contrato>

    @column()
    public cargoId: number

    public cargo: BelongsTo<typeof Cargo>

    @column()
    public limite: number
}