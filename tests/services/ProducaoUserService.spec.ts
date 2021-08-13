import test from 'japa'

import { DateTime } from 'luxon'
import {
  AtividadeFactory,
  CargoFactory,
  ContratoFactory,
  EstruturaFactory,
  FuroFactory,
  RdoFactory,
  UserFactory,
} from 'Database/factories'

import Database from '@ioc:Adonis/Lucid/Database'
import Atividade from 'App/Models/Atividade'
import Contrato from 'App/Models/Contrato'
import ProducaoUserService from 'App/Services/ProducaoUserService'
import User from 'App/Models/User'
import Cargo from 'App/Models/Cargo'

test.group('ProducaoUserService', async (group) => {
  let atividades: Atividade[]
  let contrato: Contrato
  let cargos: Cargo[]
  let users: User[]

  group.before(async () => {
    await Database.beginGlobalTransaction()

    contrato = await ContratoFactory.create()

    cargos = await CargoFactory.merge([
      { contratoId: contrato.id, titulo: 'Sondador' },
      { contratoId: contrato.id, titulo: 'Motorista' },
      { contratoId: contrato.id, titulo: 'Aux. Sondagem' },
    ]).createMany(3)

    atividades = await AtividadeFactory.with('atividadeCargoValores', 3, (factory) => {
      factory.merge([
        { cargoId: cargos[0].id, valorUnitario: 2 },
        { cargoId: cargos[1].id, valorUnitario: 2 },
        { cargoId: cargos[2].id, valorUnitario: 2 },
      ])
    })
      .merge([
        { tipo: 'improdutiva', descricao: 'Almoço', contratoId: contrato.id },
        { tipo: 'produtiva', descricao: 'Sondagem', contratoId: contrato.id },
        { tipo: 'produtiva', descricao: 'Ensaio', contratoId: contrato.id },
      ])
      .createMany(3)

    users = await UserFactory.merge([
      { contratoId: contrato.id, cargoId: cargos[0].id },
      { contratoId: contrato.id, cargoId: cargos[1].id },
      { contratoId: contrato.id, cargoId: cargos[2].id },
    ]).createMany(3)

    const estrutura = await EstruturaFactory.merge({ contratoId: contrato.id }).create()

    const furoValido = await FuroFactory.merge({
      nome: 'Furo Valido',
      estruturaId: estrutura.id,
      invalid: false,
      contratoId: contrato.id,
    }).create()

    await RdoFactory.merge([
      { contratoId: contrato.id, data: DateTime.fromISO('2021-01-01T08:00:00') },
      { contratoId: contrato.id, data: DateTime.fromISO('2021-01-15T08:00:00') },
      { contratoId: contrato.id, data: DateTime.fromISO('2021-01-31T08:00:00') },
    ])
      .with('rdoAtividades', 3, (ra) => {
        ra.merge([
          {
            atividadeId: atividades[0].id,
            horaInicio: DateTime.fromISO('2021-01-01T08:00:00'),
            horaFim: DateTime.fromISO('2021-01-01T09:00:00'),
          },
          {
            atividadeId: atividades[1].id,
            horaInicio: DateTime.fromISO('2021-01-15T09:00:00'),
            horaFim: DateTime.fromISO('2021-01-15T10:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furoValido.id,
          },
          {
            atividadeId: atividades[2].id,
            horaInicio: DateTime.fromISO('2021-01-31T10:00:00'),
            horaFim: DateTime.fromISO('2021-01-31T11:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furoValido.id,
          },
        ])
      })
      .with('rdoUsers', 3, (ru) => {
        ru.merge([{ userId: users[0].id }, { userId: users[1].id }, { userId: users[2].id }])
      })
      .createMany(3)
  })

  group.after(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test('should ProducaoUserService.build returns a list of users with their production in period', async (assert) => {
    const initialDate = '2021-01-01'
    const finalDate = '2021-01-31'

    const service = new ProducaoUserService(contrato.id, initialDate, finalDate)
    const producaoUsers = await service.build()

    assert.lengthOf(producaoUsers.users, 3)
    assert.equal(producaoUsers.users[0].valor, 12)
    assert.equal(producaoUsers.users[1].valor, 12)
    assert.equal(producaoUsers.users[2].valor, 12)
    assert.equal(producaoUsers.valorTotal, 36)
  })

  test('should ProducaoUserService.build returns a unique user with their production in period when userId is provided', async (assert) => {
    const initialDate = '2021-01-01'
    const finalDate = '2021-01-31'

    const service = new ProducaoUserService(contrato.id, initialDate, finalDate, users[1].id)
    const producaoUsers = await service.build()

    assert.lengthOf(producaoUsers.users, 1)
    assert.equal(producaoUsers.users[0].valor, 12)
    assert.equal(producaoUsers.valorTotal, 12)
  })

  test('should ProducaoUserService.build returns only production of non invalid furos', async (assert) => {
    const initialDate = '2022-03-01'
    const finalDate = '2022-03-31'

    const estrutura = await EstruturaFactory.merge({ contratoId: contrato.id }).create()

    const [furoValido, furoInvalido] = await FuroFactory.merge([
      {
        nome: 'Furo Valido',
        estruturaId: estrutura.id,
        invalid: false,
        contratoId: contrato.id,
      },
      {
        nome: 'Furo Invalido',
        estruturaId: estrutura.id,
        invalid: true,
        contratoId: contrato.id,
      },
    ]).createMany(2)

    await RdoFactory.merge([
      { contratoId: contrato.id, data: DateTime.fromISO('2022-02-15T08:00:00') },
      { contratoId: contrato.id, data: DateTime.fromISO('2022-03-01T08:00:00') },
      { contratoId: contrato.id, data: DateTime.fromISO('2022-03-31T08:00:00') },
      { contratoId: contrato.id, data: DateTime.fromISO('2022-04-01T08:00:00') },
    ])
      .with('rdoAtividades', 3, (ra) => {
        ra.merge([
          {
            atividadeId: atividades[0].id,
            horaInicio: DateTime.fromISO('2021-01-01T08:00:00'),
            horaFim: DateTime.fromISO('2021-01-01T09:00:00'),
          },
          {
            atividadeId: atividades[1].id,
            horaInicio: DateTime.fromISO('2021-01-15T09:00:00'),
            horaFim: DateTime.fromISO('2021-01-15T10:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furoValido.id,
          },
          {
            atividadeId: atividades[2].id,
            horaInicio: DateTime.fromISO('2021-01-31T10:00:00'),
            horaFim: DateTime.fromISO('2021-01-31T11:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furoValido.id,
          },
        ])
      })
      .with('rdoUsers', 3, (ru) => {
        ru.merge([{ userId: users[0].id }, { userId: users[1].id }, { userId: users[2].id }])
      })
      .createMany(4)

    await RdoFactory.merge([
      { contratoId: contrato.id, data: DateTime.fromISO('2022-03-15T08:00:00') },
    ])
      .with('rdoAtividades', 3, (ra) => {
        ra.merge([
          {
            atividadeId: atividades[0].id,
            horaInicio: DateTime.fromISO('2021-01-01T08:00:00'),
            horaFim: DateTime.fromISO('2021-01-01T09:00:00'),
          },
          {
            atividadeId: atividades[1].id,
            horaInicio: DateTime.fromISO('2021-01-15T09:00:00'),
            horaFim: DateTime.fromISO('2021-01-15T10:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furoInvalido.id,
          },
          {
            atividadeId: atividades[2].id,
            horaInicio: DateTime.fromISO('2021-01-31T10:00:00'),
            horaFim: DateTime.fromISO('2021-01-31T11:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furoValido.id,
          },
        ])
      })
      .with('rdoUsers', 3, (ru) => {
        ru.merge([{ userId: users[0].id }, { userId: users[1].id }, { userId: users[2].id }])
      })
      .create()

    const service = new ProducaoUserService(contrato.id, initialDate, finalDate)
    const producaoUsers = await service.build()

    assert.lengthOf(producaoUsers.users, 3)
    assert.equal(producaoUsers.users[0].valor, 10)
    assert.equal(producaoUsers.valorTotal, 30)
  })
})
