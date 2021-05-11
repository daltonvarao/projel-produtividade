import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class AtividadeCargoValores extends BaseSchema {
  protected tableName = 'atividade_cargo_valores'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.integer('cargo_id').unsigned().references('id').inTable('cargos').onDelete('CASCADE')

      table
        .integer('atividade_id')
        .unsigned()
        .references('id')
        .inTable('atividades')
        .onDelete('CASCADE')

      table.decimal('valor_unitario').notNullable().defaultTo(0.0)

      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
