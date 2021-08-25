import User from 'App/Models/User'
import ExcelJS from 'exceljs'
import { DateTime } from 'luxon'

interface AtividadeFuncionarioService {
  atividades: any[]
  totals: any[]
  atividadesUsuario: any[][]
}

export default class AtividadeFuncionarioExcelService {
  constructor(
    protected userId: number,
    protected initialDate: string,
    protected finalDate: string,
    protected atividadesUser: AtividadeFuncionarioService
  ) {}

  public async build() {
    const workbook = new ExcelJS.Workbook()
    const worksheet = workbook.addWorksheet('Produção Funcionário')

    const { atividades, atividadesUsuario, totals } = this.atividadesUser
    const user = await User.query().where({ id: this.userId }).preload('cargo').first()

    worksheet.mergeCells('B1:D1')

    worksheet.getCell(1, 1).value = 'FUNCIONÁRIO'
    worksheet.getCell(1, 2).value = String(user?.nome).toUpperCase()
    worksheet.getCell(1, 5).value = 'FUNÇÃO'
    worksheet.mergeCells(1, 6, 1, 8)
    worksheet.getCell(1, 6).value = String(user?.cargo.titulo).toUpperCase()

    worksheet.mergeCells(1, 9, 1, 10)
    worksheet.getCell(1, 9).value = `\nDATA: ${DateTime.fromISO(this.initialDate).toFormat(
      'dd/MM/yyyy'
    )} - ${DateTime.fromISO(this.finalDate).toFormat('dd/MM/yyyy')}
    `

    worksheet.getRow(1).eachCell((cell) => {
      cell.style = { alignment: { horizontal: 'center', vertical: 'middle' } }
    })

    worksheet.getCell(2, 1).value = 'ATIVIDADE'

    // add as colunas de atividades
    atividades.forEach((_, index) => {
      worksheet.mergeCells([2, index * 2 + 2, 2, index * 2 + 3])
    })

    atividades.forEach((atividade, index) => {
      const cell = worksheet.getRow(2).getCell(index * 2 + 2)
      cell.value = String(atividade.descricao).toUpperCase()
    })

    // format
    worksheet.columns.forEach((col) => {
      col.width = 20
      col.alignment = {
        horizontal: 'center',
        vertical: 'middle',
      }
    })

    worksheet.insertRow(3, [
      'DATA',
      ...atividades.map(() => ['FURO', 'QUANTIDADE']).reduce((pv, cv) => [...pv, ...cv]),
    ])

    // HEADER
    worksheet.getRows(1, 3)?.map((row) => {
      row.height = 25
      row.eachCell((cell) => {
        cell.style = {
          font: {
            bold: true,
            name: 'Arial',
            size: 10,
          },
          alignment: {
            horizontal: 'center',
            vertical: 'middle',
          },
        }
        cell.fill = {
          pattern: 'gray0625',
          type: 'pattern',
        }
        cell.border = {
          bottom: { style: 'thin', color: { argb: 'F0000000' } },
          right: { style: 'thin', color: { argb: 'F0000000' } },
          left: { style: 'thin', color: { argb: 'F0000000' } },
          top: { style: 'thin', color: { argb: 'F0000000' } },
        }
      })
    })

    // ADD as quantidades de cada atividade
    atividadesUsuario.map((atividadeUser) => {
      const row = worksheet.addRow([
        atividadeUser[0].data,
        ...atividades
          .map((atividade) => {
            const currentAtividade = atividadeUser.find(
              ({ descricao }) => descricao === atividade.descricao
            )

            return [
              currentAtividade?.nome ?? '-',
              currentAtividade?.quantidade ? Number(currentAtividade?.quantidade).toFixed(2) : '-',
            ]
          })
          .reduce((pv, cv) => [...pv, ...cv]),
      ])

      row.eachCell((cell) => {
        cell.border = {
          bottom: { style: 'thin', color: { argb: 'F0000000' } },
          right: { style: 'thin', color: { argb: 'F0000000' } },
          left: { style: 'thin', color: { argb: 'F0000000' } },
          top: { style: 'thin', color: { argb: 'F0000000' } },
        }
      })

      row.height = 20
    })

    // add os totais de cada atividade
    const totalRow = worksheet.addRow([
      'TOTAL',
      ...totals
        .map((total) => ['-', Number(total.quantidade).toFixed(2)])
        .reduce((pv, cv) => [...pv, ...cv]),
    ])

    totalRow.eachCell((cell) => {
      cell.style = {
        font: {
          bold: true,
          name: 'Arial',
        },
        alignment: {
          horizontal: 'center',
          vertical: 'middle',
        },
      }

      cell.border = {
        bottom: { style: 'thin', color: { argb: 'F0000000' } },
        right: { style: 'thin', color: { argb: 'F0000000' } },
        left: { style: 'thin', color: { argb: 'F0000000' } },
        top: { style: 'thin', color: { argb: 'F0000000' } },
      }
      cell.fill = {
        pattern: 'gray0625',
        type: 'pattern',
      }
    })

    totalRow.height = 20

    return workbook
  }
}
