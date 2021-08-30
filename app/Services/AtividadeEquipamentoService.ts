import Database from '@ioc:Adonis/Lucid/Database'
import { DateTime } from 'luxon'

interface AtividadesEquipamentoQuery {
  atividade: string
  furo: string
  data: Date
  horas: number
  minutos: number
  quantidade: string
}

interface TotalAtividadesQuery {
  atividade: string
  horas: number
  minutos: number
  quantidade: string
}

export default class AtividadeEquipamentoService {
  constructor(
    private contratoId: number,
    private equipamentoId: number,
    private initialDate: string,
    private finalDate: string
  ) {}

  protected _sanitize(data: AtividadesEquipamentoQuery[]) {
    return data.map(({ quantidade, data, minutos, ...row }) => {
      const horas = row.horas + minutos / 60

      return {
        ...row,
        horas,
        quantidade: +quantidade,
        data: DateTime.fromJSDate(data).toFormat('dd/MM/yyyy'),
      }
    })
  }

  protected _groupByDate(data: ReturnType<AtividadeEquipamentoService['_sanitize']>) {
    if (!data.length) return []

    const dates = [[data[0]]]

    let currentIndex = 0

    data.map((date, index) => {
      if (index === 0) return

      if (date.data === data[index - 1].data) {
        if (date.atividade !== data[index - 1].atividade) {
          dates[currentIndex].push(date)
        } else {
          dates.push([date])
          currentIndex++
        }
      } else {
        dates.push([date])
        currentIndex++
      }
    })

    return dates
  }

  protected async _atividadesEquipamentoQuery() {
    const { contratoId, equipamentoId, finalDate, initialDate } = this

    const query = await Database.rawQuery<{
      rows: AtividadesEquipamentoQuery[]
    }>(
      `
      select
        descricao as atividade,
        furos.nome as furo,
        rdos.data,
        sum(DATE_PART('hour', hora_fim::time - hora_inicio::time)) as horas,
        sum(DATE_PART('minute', hora_fim::time - hora_inicio::time)) as minutos,
        sum(quantidade) as quantidade
      from atividades
      inner join atividade_rdos on atividades.id = atividade_rdos.atividade_id
      inner join rdos on rdos.id = atividade_rdos.rdo_id
      left join furos on furos.id = atividade_rdos.furo_id
      where
        atividades.tipo != 'improdutiva'
        and rdos.contrato_id = :contratoId
        and rdos.equipamento_id = :equipamentoId
        and rdos.data between :initialDate and :finalDate
      group by atividades.descricao, furos.nome, rdos.data
      order by rdos.data, atividades.descricao
      `,
      {
        contratoId,
        equipamentoId,
        initialDate,
        finalDate,
      }
    )

    const data = this._sanitize(query.rows)
    const groupedByDateData = this._groupByDate(data)

    return groupedByDateData
  }

  public async _totalAtividadesQuery() {
    const { contratoId, equipamentoId, finalDate, initialDate } = this

    const query = await Database.rawQuery<{
      rows: TotalAtividadesQuery[]
    }>(
      `
      select
        descricao as atividade,
        sum(DATE_PART('hour', hora_fim::time - hora_inicio::time)) as horas,
        sum(DATE_PART('minute', hora_fim::time - hora_inicio::time)) as minutos,
        sum(quantidade) as quantidade
      from atividades
      inner join atividade_rdos on atividades.id = atividade_rdos.atividade_id
      inner join rdos on rdos.id = atividade_rdos.rdo_id
      left join furos on furos.id = atividade_rdos.furo_id
      where
        atividades.tipo != 'improdutiva'
        and rdos.contrato_id = :contratoId
        and rdos.equipamento_id = :equipamentoId
        and rdos.data between :initialDate and :finalDate
      group by atividades.descricao
      order by atividades.descricao
      `,
      {
        contratoId,
        equipamentoId,
        initialDate,
        finalDate,
      }
    )

    const data = query.rows

    const sanitized = data.map((row) => {
      const horas = row.horas + row.minutos / 60

      return {
        atividade: row.atividade,
        quantidade: +row.quantidade,
        horas,
      }
    })

    return sanitized
  }
  public async _atividadesQuery() {
    const { contratoId, equipamentoId, finalDate, initialDate } = this

    const query = await Database.rawQuery<{
      rows: { descricao: string; unidade_medida: string; tipo: string }[]
    }>(
      `
      select distinct descricao, unidade_medida, atividades.tipo
      from atividades
      inner join atividade_rdos on atividades.id = atividade_rdos.atividade_id
      inner join rdos on rdos.id = atividade_rdos.rdo_id
      left join furos on furos.id = atividade_rdos.furo_id
      where
        atividades.tipo != 'improdutiva'
        and rdos.contrato_id = :contratoId
        and rdos.equipamento_id = :equipamentoId
        and rdos.data between :initialDate and :finalDate
      order by descricao
      `,
      {
        contratoId,
        equipamentoId,
        initialDate,
        finalDate,
      }
    )

    const data = query.rows

    return data
  }

  public async build() {
    const atividadesEquipamento = await this._atividadesEquipamentoQuery()
    const totalAtividades = await this._totalAtividadesQuery()
    const atividades = await this._atividadesQuery()

    return { atividadesEquipamento, totalAtividades, atividades }
  }
}
