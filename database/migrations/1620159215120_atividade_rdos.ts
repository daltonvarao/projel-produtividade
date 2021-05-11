import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class AtividadeRdos extends BaseSchema {
  protected tableName = 'atividade_rdos'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.decimal('quantidade')
      table.decimal('quantidade_inicial')
      table.decimal('quantidade_final')

      table.dateTime('hora_inicio').notNullable()
      table.dateTime('hora_fim').notNullable()

      table
        .integer('atividade_id')
        .unsigned()
        .references('id')
        .inTable('atividades')
        .onDelete('CASCADE')

      table.integer('rdo_id').unsigned().references('id').inTable('rdos').onDelete('CASCADE')
      table.integer('furo_id').unsigned().references('id').inTable('furos').onDelete('CASCADE')

      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
