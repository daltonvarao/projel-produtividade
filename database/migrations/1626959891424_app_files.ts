import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class AppFiles extends BaseSchema {
  protected tableName = 'app_files'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table.string('filename').notNullable()
      table.string('name').notNullable()
      table.string('version').notNullable()
      table.string('size')
      table.string('notes')
      table.timestamp('last_modified')
      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
