import Atividade from 'App/Models/Atividade'
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

  protected getSummaryByAtividade(atividade: Atividade) {
    let total = 0

    atividade.rdoAtividades.map((rdoAtividade) => {
      if (atividade.descricao === 'Ensaio de infiltração') {
      }
      total += Number(rdoAtividade.quantidade)
    })

    return { [atividade.descricao]: total }
  }

  public async build() {
    const atividades = await Atividade.query()
      .apply((scopes) => {
        scopes.inContract(this.contractId)
        scopes.produtivas()
      })
      .preload('rdoAtividades', (qra) => {
        qra
          .whereHas('rdo', (qr) => {
            qr.whereHas('rdoUsers', (qru) => {
              qru.where({ userId: this.userId })
            })
              .whereBetween('data', [this.initialDate, this.finalDate])
              .apply((scopes) => scopes.inContract(this.contractId))
          })
          .preload('rdo', (qr) => {
            qr.preload('rdoUsers', (qru) => qru.where({ userId: this.userId }))
          })
          .preload('furo')
      })
      .whereHas('rdoAtividades', (qra) => {
        qra.whereHas('rdo', (qr) => {
          qr.whereHas('rdoUsers', (qru) => qru.where({ userId: this.userId }))
            .whereBetween('data', [this.initialDate, this.finalDate])
            .apply((scopes) => scopes.inContract(this.contractId))
        })
      })

    const data = {}

    atividades.map((item) => {
      item.rdoAtividades.map((rdoAtividade) => {
        const date = rdoAtividade.rdo.data.toFormat('yyyy-MM-dd')

        // evita a substituicao de atividades iguais que acontecem no mesmo dia (2ndo turno)
        // acumula as quantidades
        const oldQtd = data[date]
          ? data[date][item.descricao]?.quantidade
            ? data[date][item.descricao]?.quantidade
            : 0
          : 0

        // add a atividade por dia
        // ex.: data = {'2021-06-21': { 'Sondagem': { quantidade: 1, furo: 'SM-03A' } }, [...otherday]: {...}}
        data[date] = {
          ...data[date],
          [item.descricao]: {
            quantidade: +rdoAtividade.quantidade + oldQtd,
            furo: rdoAtividade.furo?.nome,
          },
        }
      })
    })

    const days = Object.keys(data)
      .sort((a, b) => {
        return a > b ? 1 : -1
      })
      .map((key) => ({
        day: key,
        atividades: { ...data[key] },
        formattedDay: DateTime.fromISO(key).toFormat('dd/MM/yyyy'),
      }))

    const totals = atividades.map((i) => this.getSummaryByAtividade(i))

    return {
      days,
      atividades: atividades.map((i) => i.toJSON()),
      totals: totals.reduce((pv, cv) => ({ ...pv, ...cv })),
    }
  }
}
