import Database from '@ioc:Adonis/Lucid/Database'
import { DateTime } from 'luxon'

export interface QueryRow {
  equipamento: string
  data: Date
  hora_inicio: string
  hora_fim: string
  hours: number
  minutes: number
  atividade: string
}

interface QueryRows {
  rows: QueryRow[]
}

export default class HorasParadasEquipamentoService {
  constructor(
    protected contratoId,
    protected equipamentoId,
    protected initialDate,
    protected finalDate
  ) {}

  protected async _query() {
    const { contratoId, equipamentoId, initialDate, finalDate } = this

    const data = await Database.rawQuery<QueryRows>(
      `select 
        equipamentos.tag as equipamento,
        rdos.data,
        atividade_rdos.hora_inicio::time, 
        atividade_rdos.hora_fim::time,
        DATE_PART('hour', atividade_rdos.hora_fim::time - atividade_rdos.hora_inicio::time) AS hours,
        DATE_PART('minutes', atividade_rdos.hora_fim::time - atividade_rdos.hora_inicio::time) AS minutes,
        atividades.descricao as atividade
      from atividade_rdos
      inner join rdos on rdos.id = atividade_rdos.rdo_id	
      inner join atividades on atividades.id = atividade_rdos.atividade_id
      inner join equipamentos on equipamentos.id = rdos.equipamento_id 
      where 
        rdos.data between :initialDate and :finalDate
        and rdos.contrato_id = :contratoId
        and rdos.equipamento_id = :equipamentoId
        and atividades.tipo = 'parada'
      order by rdos.data, atividade_rdos.hora_inicio
        `,
      {
        contratoId,
        equipamentoId,
        initialDate,
        finalDate,
      }
    )

    return data.rows
  }

  protected _formatTime(time: string) {
    const HH = time.split(':')[0]
    const mm = time.split(':')[1]

    return `${HH}:${mm}`
  }

  protected _sanitize(data: QueryRow[]) {
    return data.map(({ data: jsDate, hora_fim, hora_inicio, hours, minutes, ...row }) => {
      const horas = hours + minutes / 60
      const data = DateTime.fromJSDate(jsDate).toFormat('dd/MM/yyyy')

      const horaInicio = this._formatTime(hora_inicio)
      const horaFim = this._formatTime(hora_fim)

      return {
        hora_inicio: horaInicio,
        hora_fim: horaFim,
        data,
        horas,
        ...row,
      }
    })
  }

  protected _computeTotal(data: ReturnType<HorasParadasEquipamentoService['_sanitize']>) {
    if (!data.length) return 0

    return data.reduce((pv, cv) => {
      return {
        ...cv,
        horas: pv.horas + cv.horas,
      }
    }).horas
  }

  public async build() {
    const data = await this._query()

    const sanitizedData = this._sanitize(data)

    return { horasParadas: sanitizedData, total: this._computeTotal(sanitizedData) }
  }
}
