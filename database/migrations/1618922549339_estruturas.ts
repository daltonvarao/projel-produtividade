import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Estruturas extends BaseSchema {
  protected tableName = 'estruturas'

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

      table.integer('mina_id').unsigned().references('id').inTable('minas').onDelete('CASCADE')

      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
