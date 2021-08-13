import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import Rdo from 'App/Models/Rdo'

export default class ChangeRdoTurnoAndNameSeeder extends BaseSeeder {
  public async run() {
    await Rdo.query()
      .where('nome', 'ilike', '%T2%')
      .orWhere('nome', 'ilike', '%2°%')
      .orWhere('nome', 'ilike', '%2T%')
      .update({ turno: '2T' })

    const rdos = await Rdo.query().preload('estrutura').preload('equipamentoPrincipal')

    const changeRdoNameMap = rdos.map(async (rdo) => {
      const data = rdo.data.toFormat('dd.MM.yyyy')
      const turno = rdo.turno
      const equipamento = rdo.equipamentoPrincipal.tag
      const estrutura = rdo.estrutura.nome

      const nome = data
        .concat(' - ')
        .concat(turno)
        .concat(' - ')
        .concat(equipamento)
        .concat(' - ')
        .concat(estrutura)

      return await rdo.merge({ nome }).save()
    })

    await Promise.all(changeRdoNameMap)
  }
}
