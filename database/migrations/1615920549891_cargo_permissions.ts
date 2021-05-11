import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class CargoPermissions extends BaseSchema {
  protected tableName = 'cargo_permissions'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.integer('cargo_id').unsigned().references('id').inTable('cargos').onDelete('CASCADE')
      table.string('name')

      table.boolean('can_create')
      table.boolean('can_read')
      table.boolean('can_update')
      table.boolean('can_delete')

      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
