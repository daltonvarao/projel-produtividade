import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Minas extends BaseSchema {
  protected tableName = 'minas'

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
        .integer('complexo_id')
        .unsigned()
        .references('id')
        .inTable('complexos')
        .onDelete('CASCADE')

      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
