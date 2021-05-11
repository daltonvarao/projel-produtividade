import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class UsersSchema extends BaseSchema {
  protected tableName = 'users'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()

      table.string('nome', 255).notNullable()
      table.string('cpf', 255).notNullable()
      table.string('password', 180).notNullable()
      table.string('remember_me_token').nullable()
      table
        .integer('cargo_id')
        .unsigned()
        .references('id')
        .inTable('cargos')
        .notNullable()
        .onDelete('CASCADE')

      table
        .integer('contrato_id')
        .unsigned()
        .references('id')
        .inTable('contratos')
        .onDelete('CASCADE')

      table.string('banco').notNullable()
      table.string('agencia').notNullable()
      table.string('conta').notNullable()
      table.string('operacao_caixa')

      table.timestamps(true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
