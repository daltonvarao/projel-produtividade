import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class AppFiles extends BaseSchema {
  protected tableName = 'app_files'

  public async up() {
    this.schema.table(this.tableName, (table) => {
      table.boolean('current_release').defaultTo(false)
    })
  }

  public async down() {
    this.schema.table(this.tableName, (table) => {
      table.dropColumn('current_release')
    })
  }
}
