import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class AddBodyColumns extends BaseSchema {
  protected tableName = 'user_logs'

  public async up() {
    this.schema.table(this.tableName, (table) => {
      table.text('body')
    })
  }

  public async down() {
    this.schema.table(this.tableName, (table) => {
      table.dropColumn('body')
    })
  }
}
