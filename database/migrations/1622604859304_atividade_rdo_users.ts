import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class AtividadeRdoUsers extends BaseSchema {
  protected tableName = 'atividade_rdo_users'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.decimal('quantidade')
      table.decimal('quantidade_inicial')
      table.decimal('quantidade_final')

      table.integer('rdo_id').unsigned().references('id').inTable('rdos').onDelete('CASCADE')
      table.integer('user_id').unsigned().references('id').inTable('users').onDelete('CASCADE')

      table
        .integer('atividade_id')
        .unsigned()
        .references('id')
        .inTable('atividades')
        .onDelete('CASCADE')

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
