import test from 'japa'
import Database from '@ioc:Adonis/Lucid/Database'
import { DateTime } from 'luxon'

import Atividade from 'App/Models/Atividade'
import User from 'App/Models/User'
import Equipamento from 'App/Models/Equipamento'
import Rdo from 'App/Models/Rdo'

import { AtividadeFactory, EquipamentoFactory, RdoFactory, UserFactory } from 'Database/factories'
import AtividadeRdoUserService from 'App/Services/AtividadeRdoUser'
import AtividadeRdoUser from 'App/Models/AtividadeRdoUser'

test.group('AtividadeRdoUserService', async (group) => {
  let atividades: Atividade[]
  let users: User[]
  let equipamentos: Equipamento[]
  let data: any[]
  let rdos: Rdo[]

  group.before(async () => {
    await Database.beginGlobalTransaction()

    atividades = await AtividadeFactory.createMany(5)
    users = await UserFactory.with('cargo').createMany(5)
    equipamentos = await EquipamentoFactory.createMany(5)
    rdos = await RdoFactory.createMany(2)
    data = [
      {
        nome: 'Sondagem',
        condicoesTempo: 'normal',
        data: DateTime.fromISO('2021-02-11T19:54:33.170Z'),
        pluviometria: 0,
        status: 'andamento',
        atividades: [
          {
            horaFim: DateTime.fromISO('2021-02-11T20:55:33.278Z'),
            horaInicio: DateTime.fromISO('2021-02-11T19:55:33.278Z'),
            atividadeId: atividades[0].id,
            quantidade: 10,
          },
          {
            horaFim: DateTime.fromISO('2021-02-11T20:55:33.278Z'),
            horaInicio: DateTime.fromISO('2021-02-11T19:55:33.278Z'),
            atividadeId: atividades[1].id,
            quantidade: 12.399999618530273,
          },
        ],
        equipamentos: [
          { equipamentoId: equipamentos[0].id, quantidade: 1 },
          { equipamentoId: equipamentos[1].id, quantidade: 1 },
        ],
        users: [{ userId: users[0].id }, { userId: users[1].id }],
      },
      {
        nome: 'Sondagem Mista',
        condicoesTempo: 'normal',
        data: DateTime.fromISO('2021-02-11T19:54:33.170Z'),
        pluviometria: 0,
        status: 'andamento',
        atividades: [
          {
            horaFim: DateTime.fromISO('2021-02-11T20:55:33.278Z'),
            horaInicio: DateTime.fromISO('2021-02-11T19:55:33.278Z'),
            atividadeId: atividades[1].id,
            quantidade: 20,
          },
          {
            horaFim: DateTime.fromISO('2021-02-11T20:55:33.278Z'),
            horaInicio: DateTime.fromISO('2021-02-11T19:55:33.278Z'),
            atividadeId: atividades[2].id,
            quantidade: 15,
          },
        ],
        equipamentos: [
          { equipamentoId: equipamentos[2].id, quantidade: 1 },
          { equipamentoId: equipamentos[3].id, quantidade: 1 },
        ],
        users: [{ userId: users[3].id }, { userId: users[2].id }],
      },
    ]
  })

  group.after(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test('should AtividadeRdoUserService.build creates AtividadeRdoUsers for only one RDO', async (assert) => {
    try {
      const atividadeRdoUser = await AtividadeRdoUserService.build(data[0], rdos[0])

      assert.lengthOf(atividadeRdoUser, 2)
    } catch ({ message }) {}
  })

  test('should AtividadeRdoUserService.buildMany creates AtividadeRdoUsers for only many RDOS', async (assert) => {
    try {
      await AtividadeRdoUserService.buildMany(data, rdos)

      const atividadeRdoUsers = await AtividadeRdoUser.all()

      assert.lengthOf(atividadeRdoUsers, 4)
    } catch ({ message }) {}
  })
})
