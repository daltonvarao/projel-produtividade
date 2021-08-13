import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Furos extends BaseSchema {
  protected tableName = 'furos'

  public async up() {
    this.schema.table(this.tableName, (table) => {
      table.boolean('invalid').defaultTo(false)
    })
  }

  public async down() {
    this.schema.table(this.tableName, (table) => {
      table.dropColumn('invalid')
    })
  }
}
