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
import AtividadeFuncionarioService from 'App/Services/AtividadeFuncionarioService'
import User from 'App/Models/User'
import Cargo from 'App/Models/Cargo'
import Furo from 'App/Models/Furo'

test.group('AtividadeFuncionarioService', async (group) => {
  let atividades: Atividade[]
  let contrato: Contrato
  let cargos: Cargo[]
  let users: User[]
  let furos: Furo[]

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
        { tipo: 'produtiva', descricao: 'Sondagem Destrutiva', contratoId: contrato.id },
        { tipo: 'produtiva', descricao: 'Ensaio infiltracao', contratoId: contrato.id },
        { tipo: 'produtiva', descricao: 'Ensaio Denison', contratoId: contrato.id },
      ])
      .createMany(4)

    users = await UserFactory.merge([
      { contratoId: contrato.id, cargoId: cargos[0].id },
      { contratoId: contrato.id, cargoId: cargos[1].id },
      { contratoId: contrato.id, cargoId: cargos[2].id },
    ]).createMany(3)

    furos = await FuroFactory.merge([
      { contratoId: contrato.id, nome: 'PJ-SG2' },
      { contratoId: contrato.id, nome: 'PJ-SG3' },
    ]).createMany(2)

    await RdoFactory.merge([
      { contratoId: contrato.id, data: DateTime.fromISO('2021-03-15T08:00:00') },
      { contratoId: contrato.id, data: DateTime.fromISO('2021-03-22T08:00:00') },
      { contratoId: contrato.id, data: DateTime.fromISO('2021-04-08T08:00:00') },
      { contratoId: contrato.id, data: DateTime.fromISO('2021-04-27T08:00:00') },
    ])
      .with('rdoAtividades', 3, (ra) => {
        ra.merge([
          {
            atividadeId: atividades[0].id,
            horaInicio: DateTime.fromISO('2021-03-21T08:00:00'),
            horaFim: DateTime.fromISO('2021-03-21T09:00:00'),
          },
          {
            atividadeId: atividades[1].id,
            horaInicio: DateTime.fromISO('2021-04-08T09:00:00'),
            horaFim: DateTime.fromISO('2021-04-08T10:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furos[0].id,
          },
          {
            atividadeId: atividades[2].id,
            horaInicio: DateTime.fromISO('2021-04-15T10:00:00'),
            horaFim: DateTime.fromISO('2021-04-15T11:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furos[0].id,
          },
        ])
      })
      .with('rdoUsers', 1, (ru) => {
        ru.merge([{ userId: users[0].id }])
      })
      .createMany(4)

    await RdoFactory.merge([
      { contratoId: contrato.id, data: DateTime.fromISO('2021-04-20T08:00:00') },
    ])
      .with('rdoAtividades', 4, (ra) => {
        ra.merge([
          {
            atividadeId: atividades[0].id,
            horaInicio: DateTime.fromISO('2021-03-21T08:00:00'),
            horaFim: DateTime.fromISO('2021-03-21T09:00:00'),
          },
          {
            atividadeId: atividades[1].id,
            horaInicio: DateTime.fromISO('2021-04-08T09:00:00'),
            horaFim: DateTime.fromISO('2021-04-08T10:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furos[0].id,
          },
          {
            atividadeId: atividades[3].id,
            horaInicio: DateTime.fromISO('2021-04-15T10:00:00'),
            horaFim: DateTime.fromISO('2021-04-15T11:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furos[0].id,
          },
        ])
      })
      .with('rdoUsers', 1, (ru) => {
        ru.merge([{ userId: users[0].id }, { userId: users[1].id }])
      })
      .create()
  })

  group.after(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test('should service return a list of atividades, days and totals', async (assert) => {
    const initialDate = '2021-03-21'
    const finalDate = '2021-04-21'
    const userId = users[0].id
    const contractId = contrato.id

    const service = new AtividadeFuncionarioService(contractId, userId, initialDate, finalDate)
    const serviceBuild = await service.build()

    const { days: atividadesFuncionarios, totals } = serviceBuild

    // array of days, each day has [x: string] thats represents an atividade descricao
    assert.lengthOf(atividadesFuncionarios, 3)

    assert.propertyVal(atividadesFuncionarios[0], 'day', '2021-03-22')
    assert.property(atividadesFuncionarios[0], 'atividades')

    assert.propertyVal(
      atividadesFuncionarios[0].atividades[atividades[2].descricao],
      'quantidade',
      1
    )

    assert.propertyVal(
      atividadesFuncionarios[0].atividades[atividades[2].descricao],
      'furo',
      furos[0].nome
    )

    assert.propertyVal(atividadesFuncionarios[1], 'day', '2021-04-08')

    assert.propertyVal(atividadesFuncionarios[2], 'day', '2021-04-20')
    assert.propertyVal(
      atividadesFuncionarios[2].atividades[atividades[3].descricao],
      'quantidade',
      1
    )

    assert.propertyVal(totals, atividades[1].descricao, 3)
    assert.propertyVal(totals, atividades[2].descricao, 2)
    assert.propertyVal(totals, atividades[3].descricao, 1)
  })

  test('should AtividadeFuncionarioService.build returns only production of non invalid furos', async (assert) => {
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
            // almoco
            atividadeId: atividades[0].id,
            horaInicio: DateTime.fromISO('2021-01-01T08:00:00'),
            horaFim: DateTime.fromISO('2021-01-01T09:00:00'),
          },
          {
            // sondagem
            atividadeId: atividades[1].id,
            horaInicio: DateTime.fromISO('2021-01-15T09:00:00'),
            horaFim: DateTime.fromISO('2021-01-15T10:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furoInvalido.id,
          },
          {
            // ensaio
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

    // 3 dias
    // 2022-03-01
    //    ensaio -> qtd: 1, total: 1, valid, list
    //    sondag -> qtd: 1, total: 1, valid, list

    // 2022-03-15
    //    ensaio -> qtd: 1, total: 1, valid, list
    //    sondag -> qtd: 1, total: 1, invalid, not list

    // 2022-03-31
    //    ensaio -> qtd: 1, total: 1, valid, list
    //    sondag -> qtd: 1, total: 1, valid, list

    // totals
    // ensaio: 3
    // sondag: 2

    const service = new AtividadeFuncionarioService(
      contrato.id,
      users[0].id,
      initialDate,
      finalDate
    )
    const serviceBuild = await service.build()

    const { days, totals } = serviceBuild

    // atividades[0] = { tipo: 'improdutiva', descricao: 'Almoço' },
    // atividades[1] = { tipo: 'produtiva',   descricao: 'Sondagem Destrutiva' },
    // atividades[2] = { tipo: 'produtiva',   descricao: 'Ensaio infiltracao' },

    assert.lengthOf(days, 3)

    // 2022-03-01
    assert.propertyVal(days[0], 'day', '2022-03-01')
    assert.property(days[0], 'atividades')
    // sondag
    assert.propertyVal(days[0].atividades[atividades[1].descricao], 'quantidade', 1)
    assert.propertyVal(days[0].atividades[atividades[1].descricao], 'furo', furoValido.nome)
    // ensaio
    assert.propertyVal(days[0].atividades[atividades[2].descricao], 'quantidade', 1)
    assert.propertyVal(days[0].atividades[atividades[2].descricao], 'furo', furoValido.nome)

    // 2022-03-15
    assert.propertyVal(days[1], 'day', '2022-03-15')
    assert.property(days[1], 'atividades')
    // sondag
    assert.notProperty(days[1].atividades, atividades[1].descricao)
    // ensaio
    assert.propertyVal(days[1].atividades[atividades[2].descricao], 'quantidade', 1)
    assert.propertyVal(days[1].atividades[atividades[2].descricao], 'furo', furoValido.nome)
    assert.property(days[1].atividades, atividades[2].descricao)

    // 2022-03-31
    assert.property(days[1], 'atividades')
    assert.propertyVal(days[2], 'day', '2022-03-31')
    // sondag
    assert.propertyVal(days[2].atividades[atividades[1].descricao], 'quantidade', 1)
    assert.propertyVal(days[2].atividades[atividades[1].descricao], 'furo', furoValido.nome)
    // ensaio
    assert.propertyVal(days[2].atividades[atividades[2].descricao], 'quantidade', 1)
    assert.propertyVal(days[2].atividades[atividades[2].descricao], 'furo', furoValido.nome)

    // total per atividade
    // sondag
    assert.propertyVal(totals, atividades[1].descricao, 2)
    // ensaio
    assert.propertyVal(totals, atividades[2].descricao, 3)
  })
})
