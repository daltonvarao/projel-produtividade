import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class RdoUsers extends BaseSchema {
  protected tableName = 'rdo_users'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.integer('rdo_id').unsigned().references('id').inTable('rdos').onDelete('CASCADE')
      table.integer('user_id').unsigned().references('id').inTable('users').onDelete('CASCADE')

      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
