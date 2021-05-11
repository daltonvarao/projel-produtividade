import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Atividades extends BaseSchema {
  protected tableName = 'atividades'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.string('descricao')
      table.enu('tipo', ['produtiva', 'improdutiva', 'parada'])

      table.enu('unidade_medida', ['metros', 'unidades']).defaultTo(null)

      table
        .integer('contrato_id')
        .unsigned()
        .references('id')
        .inTable('contratos')
        .onDelete('CASCADE')

      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
