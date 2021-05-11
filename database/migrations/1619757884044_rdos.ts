import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Rdos extends BaseSchema {
  protected tableName = 'rdos'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')

      table.string('nome')
      table.date('data')
      table.enu('status', ['andamento', 'finalizado']).defaultTo('andamento')
      table.enu('condicoes_tempo', ['bom', 'chuvoso']).defaultTo('bom')
      table.decimal('pluviometria').defaultTo(0)

      // responsavel
      table.integer('user_id').unsigned().references('id').inTable('users').onDelete('CASCADE')

      // equipamento principal
      table
        .integer('equipamento_id')
        .unsigned()
        .references('id')
        .inTable('equipamentos')
        .onDelete('CASCADE')

      // equipamento principal
      table
        .integer('estrutura_id')
        .unsigned()
        .references('id')
        .inTable('estruturas')
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
