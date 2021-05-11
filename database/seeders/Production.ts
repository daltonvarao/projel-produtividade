import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import { UserFactory } from 'Database/factories'

export default class ProductionSeeder extends BaseSeeder {
  public async run() {
    await UserFactory.with('cargo', 1, (cargo) => {
      cargo.merge({
        titulo: 'Admin',
      })
    }).create((user) => {
      user.merge({
        nome: 'Admin',
        cpf: '00000000000',
        password: 'dalton10',
      })
    })
  }
}
