import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class UserLogs extends BaseSchema {
  protected tableName = 'user_logs'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.string('ip')
      table.string('route')
      table.string('url')
      table.string('method')

      table.integer('user_id').unsigned().references('id').inTable('users').onDelete('CASCADE')

      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
