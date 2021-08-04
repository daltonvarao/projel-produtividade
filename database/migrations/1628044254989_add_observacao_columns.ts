import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class AtividadeRdos extends BaseSchema {
  protected tableName = 'atividade_rdos'

  public async up() {
    this.schema.table(this.tableName, (table) => {
      table.text('observacao')
    })
  }

  public async down() {
    this.schema.table(this.tableName, (table) => {
      table.dropColumn('observacao')
    })
  }
}
