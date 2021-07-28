import ExcelJS from 'exceljs'

interface ProducaoUsersProps {
  users: any
  valorTotal: number
}

export default class ProducaoUsersExcel {
  public build(producaoUsers: ProducaoUsersProps) {
    const workbook = new ExcelJS.Workbook()
    const worksheet = workbook.addWorksheet('Resumo Pagamentos')

    worksheet.columns = [
      {
        header: 'Nome',
        key: 'nome',
        width: 40,
      },
      {
        header: 'Cargo',
        key: 'cargo',
        width: 32,
        style: {
          alignment: {
            horizontal: 'center',
          },
        },
      },
      {
        header: 'CPF',
        key: 'maskedCpf',
        width: 20,
        style: {
          alignment: {
            horizontal: 'center',
          },
        },
      },
      {
        header: 'Banco',
        key: 'banco',
        width: 30,
        style: {
          alignment: {
            horizontal: 'center',
          },
        },
      },
      {
        header: 'Agência',
        key: 'agencia',
        width: 12,
        style: {
          alignment: {
            horizontal: 'center',
          },
        },
      },
      {
        header: 'O.C',
        key: 'operacao_caixa',
        width: 10,
        style: {
          alignment: {
            horizontal: 'center',
          },
        },
      },
      {
        header: 'Conta',
        key: 'conta',
        width: 18,
        style: {
          alignment: {
            horizontal: 'center',
          },
        },
      },
      {
        header: 'Valor',
        key: 'valor',
        width: 16,
        style: {
          alignment: {
            horizontal: 'right',
          },
          numFmt: 'R$ #,##0.00;[Red]-$#,##0.00',
        },
      },
    ]

    worksheet.columns.forEach((column) => {
      column.style = {
        ...column.style,
        font: {
          name: 'Arial Black',
        },
      }
    })

    const header = worksheet.getRow(1)

    header.height = 32
    header.eachCell((cell) => {
      cell.style = {
        alignment: {
          horizontal: 'center',
          vertical: 'middle',
        },
        font: {
          bold: true,
          name: 'Arial Black',
        },
      }
    })

    producaoUsers.users.map((producaoUser) => {
      worksheet.addRow({
        ...producaoUser,
        operacao_caixa: producaoUser.operacao_caixa ?? '-',
        cargo: producaoUser.cargo.titulo,
      })
    })

    const lastrow = worksheet.lastRow?.number

    if (lastrow) {
      worksheet.mergeCells(lastrow + 1, 1, lastrow + 1, 7)
      const totalsRow = worksheet.getRow(lastrow + 1)

      const totalCell = worksheet.getCell(lastrow + 1, 1)
      totalCell.value = 'Total'
      totalCell.alignment = {
        horizontal: 'right',
      }

      const valorCell = worksheet.getCell(lastrow + 1, 8)
      valorCell.value = Number(producaoUsers.valorTotal.toFixed(2))

      totalsRow.alignment = {
        vertical: 'middle',
      }

      totalsRow.height = 25
      totalsRow.font = {
        bold: true,
        name: 'Arial Black',
      }
    }

    return workbook
  }
}
