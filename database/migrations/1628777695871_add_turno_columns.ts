import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Rdos extends BaseSchema {
  protected tableName = 'rdos'

  public async up() {
    this.schema.table(this.tableName, (table) => {
      table.enu('turno', ['1T', '2T']).defaultTo('1T')
    })
  }

  public async down() {
    this.schema.table(this.tableName, (table) => {
      table.dropColumn('turno')
    })
  }
}
