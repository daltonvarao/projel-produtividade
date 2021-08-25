import Database from '@ioc:Adonis/Lucid/Database'
import { DateTime } from 'luxon'

export default class AtividadeFuncionarioService {
  public userId: number
  public initialDate: string
  public finalDate: string
  public contractId: number

  constructor(contractId: number, userId: number, initialDate: string, finalDate: string) {
    this.userId = userId
    this.contractId = contractId
    this.initialDate = initialDate
    this.finalDate = finalDate
  }

  protected _baseQuery = () =>
    Database.from('atividade_rdos')
      .innerJoin('rdo_users', 'rdo_users.rdo_id', 'atividade_rdos.rdo_id')
      .innerJoin('rdos', 'rdos.id', 'atividade_rdos.rdo_id')
      .innerJoin('atividades', 'atividades.id', 'atividade_rdos.atividade_id')
      .innerJoin('furos', 'furos.id', 'atividade_rdos.furo_id')
      .where('rdo_users.user_id', this.userId)
      .andWhere('atividades.tipo', 'produtiva')
      .andWhereBetween('rdos.data', [this.initialDate, this.finalDate])
      .andWhere('rdos.contrato_id', this.contractId)
      .andWhere('furos.invalid', false)

  public async build() {
    let days = await this._baseQuery()
      .sum('quantidade', 'quantidade')
      .select('rdos.data', 'furos.nome', 'atividades.descricao', 'atividades.id')
      .groupBy('rdos.data', 'furos.nome', 'atividades.descricao', 'atividades.id')
      .orderBy('rdos.data')
      .orderBy('atividades.descricao')
      .orderBy('furos.nome')

    const atividadesUsuario = [
      [
        {
          ...days[0],
          data: DateTime.fromJSDate(days[0].data).toFormat('dd/MM/yyyy'),
          quantidade: Number(days[0].quantidade),
        },
      ],
    ]

    let currentIndex = 0

    days = days.map((day) => ({
      ...day,
      data: DateTime.fromJSDate(day.data).toFormat('dd/MM/yyyy'),
      quantidade: Number(day.quantidade),
    }))

    days.map((day, index) => {
      if (index === 0) return

      if (day.data === days[index - 1].data) {
        if (day.descricao !== days[index - 1].descricao) {
          atividadesUsuario[currentIndex].push(day)
        } else {
          atividadesUsuario.push([day])
          currentIndex++
        }
      } else {
        atividadesUsuario.push([day])
        currentIndex++
      }

      return atividadesUsuario
    })

    let totals = await this._baseQuery()
      .select('atividades.descricao', 'atividades.id')
      .sum('quantidade', 'quantidade')
      .groupBy('atividades.descricao', 'atividades.id')
      .orderBy('atividades.descricao')

    totals = totals.map((total) => ({ ...total, quantidade: Number(total.quantidade) }))

    const atividades = await this._baseQuery()
      .distinct('atividades.descricao', 'atividades.id')
      .orderBy('atividades.descricao')

    return {
      atividadesUsuario,
      totals,
      atividades,
    }
  }
}
