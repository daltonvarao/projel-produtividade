import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Cargos extends BaseSchema {
  protected tableName = 'cargos'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table.string('titulo').notNullable()

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
