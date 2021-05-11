import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class EquipamentoRdos extends BaseSchema {
  protected tableName = 'equipamento_rdos'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.decimal('quantidade')

      table.integer('rdo_id').unsigned().references('id').inTable('rdos').onDelete('CASCADE')
      table
        .integer('equipamento_id')
        .unsigned()
        .references('id')
        .inTable('equipamentos')
        .onDelete('CASCADE')

      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
