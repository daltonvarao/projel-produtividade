import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class ApiSyncVersions extends BaseSchema {
  protected tableName = 'api_sync_versions'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table.string('request_url')
      table.string('request_method')
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
