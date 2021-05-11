import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Contratos extends BaseSchema {
  protected tableName = 'contratos'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table.integer('centro_custo', 255).notNullable()
      table.string('descricao', 255).notNullable()
      table.string('numero', 255).notNullable().unique()
      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
