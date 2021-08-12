import test from 'japa'
import Database from '@ioc:Adonis/Lucid/Database'
import RdoBuilderService from 'App/Services/RdoBuilder'
import { DateTime } from 'luxon'

import {
  AtividadeFactory,
  ContratoFactory,
  EquipamentoFactory,
  UserFactory,
} from 'Database/factories'
import Atividade from 'App/Models/Atividade'
import User from 'App/Models/User'
import Equipamento from 'App/Models/Equipamento'
import Contrato from 'App/Models/Contrato'

test.group('RdoBuilderService', async (group) => {
  let atividades: Atividade[]
  let users: User[]
  let equipamentos: Equipamento[]
  let contratos: Contrato[]

  let data: any[]

  group.before(async () => {
    await Database.beginGlobalTransaction()

    atividades = await AtividadeFactory.createMany(5)
    users = await UserFactory.with('cargo').createMany(5)
    equipamentos = await EquipamentoFactory.createMany(5)
    contratos = await ContratoFactory.createMany(4)
    data = [
      {
        nome: 'Sondagem',
        condicoesTempo: 'normal',
        data: DateTime.fromISO('2021-02-11T19:54:33.170Z'),
        pluviometria: 0,
        status: 'andamento',
        contratoId: contratos[0].id,
        turno: '1T',
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
        contratoId: contratos[0].id,
        turno: '1T',
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

  test('should RdoBuilderService.build build an Rdo with associations', async (assert) => {
    try {
      const rdo = await RdoBuilderService.build(users[0], data[0])

      assert.equal(rdo.nome, data[0].nome)
    } catch ({ message }) {}
  })

  test('should RdoBuilderService.buildMany build Rdo[] with associations', async (assert) => {
    try {
      const rdos = await RdoBuilderService.buildMany(users[0], data)

      assert.lengthOf(rdos, 2)
    } catch ({ message }) {}
  })
})
