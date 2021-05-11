import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Furos extends BaseSchema {
  protected tableName = 'furos'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.string('nome')

      table
        .integer('contrato_id')
        .unsigned()
        .references('id')
        .inTable('contratos')
        .onDelete('CASCADE')

      table
        .integer('estrutura_id')
        .unsigned()
        .references('id')
        .inTable('estruturas')
        .onDelete('CASCADE')

      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
