import test from 'japa'
import Database from '@ioc:Adonis/Lucid/Database'

import Atividade from 'App/Models/Atividade'
import User from 'App/Models/User'
import Equipamento from 'App/Models/Equipamento'
import Rdo from 'App/Models/Rdo'

import {
  AtividadeFactory,
  CargoFactory,
  ContratoFactory,
  EquipamentoFactory,
  EstruturaFactory,
  FuroFactory,
  UserFactory,
} from 'Database/factories'
import { api } from '../../utils'
import Contrato from 'App/Models/Contrato'
import Estrutura from 'App/Models/Estrutura'
import Furo from 'App/Models/Furo'

test.group('Api RdosController', (group) => {
  let token: string
  let atividades: Atividade[]
  let equipamentos: Equipamento[]
  let estruturas: Estrutura[]
  let furos: Furo[]
  let users: User[]
  let user: User
  let contratos: Contrato[]

  group.before(async () => {
    await Database.beginGlobalTransaction()
    await CargoFactory.createMany(5)

    atividades = await AtividadeFactory.createMany(5)
    users = await UserFactory.with('cargo').createMany(4)
    equipamentos = await EquipamentoFactory.createMany(5)
    estruturas = await EstruturaFactory.createMany(5)
    furos = await FuroFactory.createMany(4, (factory) =>
      factory.merge({
        estruturaId: estruturas[0].id,
      })
    )
    contratos = await ContratoFactory.createMany(3)

    user = await UserFactory.with('cargo')
      .merge({
        nome: 'Dalton Felipe',
        cpf: '03935644280',
      })
      .create()

    const response = await api.post('/auth').set('Accept', 'application/json').send({
      cpf: user.cpf,
      password: '123456',
    })

    token = response.body.token
  })

  group.after(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test('should POST in /rdos without data receive an error message', async () => {
    await api
      .post(`/rdos`)
      .set('Accept', 'application/json')
      .set('Authorization', `Bearer ${token}`)
      .expect(422)
  })

  test('should POST in /rdos be able to create Rdos', async (assert) => {
    const data = [
      {
        nome: 'Sondagem',
        condicoesTempo: 'bom',
        data: '2021-02-11T19:54:33.170Z',
        pluviometria: 0,
        status: 'andamento',
        contratoId: contratos[0].id,
        equipamentoId: equipamentos[0].id,
        estruturaId: estruturas[0].id,
        atividades: [
          {
            atividadeId: atividades[0].id,
            horaFim: '2021-02-11T20:55:33.278Z',
            horaInicio: '2021-02-11T19:54:33.278Z',
            quantidade: 10,
            quantidadeInicial: 0,
            quantidadeFinal: 10,
            furoNome: furos[0].nome,
          },
          {
            atividadeId: atividades[1].id,
            horaFim: '2021-02-11T21:05:20.915Z',
            horaInicio: '2021-02-11T20:04:20.915Z',
            quantidade: 10,
            quantidadeFinal: 10,
            quantidadeInicial: 0,
            furoNome: 'Novo furo',
          },
        ],
        equipamentos: [
          { equipamentoId: equipamentos[0].id, quantidade: 1 },
          { equipamentoId: equipamentos[1].id, quantidade: 1 },
        ],
        users: [{ userId: users[0].id }, { userId: users[1].id }],
      },
    ]

    await api
      .post(`/rdos`)
      .send({
        data,
      })
      .set('Accept', 'application/json')
      .set('Authorization', `Bearer ${token}`)
      .expect(200)

    const rdos = await Rdo.query()
      .preload('rdoAtividades')
      .preload('rdoUsers')
      .preload('rdoEquipamentos')

    assert.lengthOf(rdos, 1)

    const rdo = rdos[0]

    assert.lengthOf(rdo.rdoAtividades, 2)
    assert.lengthOf(rdo.rdoUsers, 2)
    assert.lengthOf(rdo.rdoEquipamentos, 2)

    await user.load('rdos')

    assert.lengthOf(user.rdos, 1)

    assert.lengthOf(furos, 4)

    furos = await Furo.all()

    assert.lengthOf(furos, 5)
  })
})
