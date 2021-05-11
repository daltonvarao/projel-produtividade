import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Equipamentos extends BaseSchema {
  protected tableName = 'equipamentos'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.string('tag').notNullable()
      table.string('descricao')
      table.boolean('sonda').defaultTo(false)

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
