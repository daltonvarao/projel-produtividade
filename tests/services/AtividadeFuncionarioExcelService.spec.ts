import test from 'japa'

import { DateTime } from 'luxon'
import {
  AtividadeFactory,
  CargoFactory,
  ContratoFactory,
  FuroFactory,
  RdoFactory,
  UserFactory,
} from 'Database/factories'

import Database from '@ioc:Adonis/Lucid/Database'
import Atividade from 'App/Models/Atividade'
import Contrato from 'App/Models/Contrato'
import AtividadeFuncionarioExcelService from 'App/Services/AtividadeFuncionarioExcelService'
import User from 'App/Models/User'
import Cargo from 'App/Models/Cargo'
import Furo from 'App/Models/Furo'
import AtividadeFuncionarioService from 'App/Services/AtividadeFuncionarioService'

test.group('AtividadeFuncionarioService', async (group) => {
  let atividades: Atividade[]
  let contrato: Contrato
  let cargos: Cargo[]
  let users: User[]
  let furos: Furo[]

  group.beforeEach(async () => {
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

    // 22/03
    await RdoFactory.merge([
      { contratoId: contrato.id, data: DateTime.fromISO('2021-03-22T08:00:00') },
    ])
      .with('rdoAtividades', 1, (ra) => {
        ra.merge([
          {
            atividadeId: atividades[1].id,
            horaInicio: DateTime.fromISO('2021-04-08T09:00:00'),
            horaFim: DateTime.fromISO('2021-04-08T10:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furos[1].id,
          },
        ])
      })
      .with('rdoUsers', 2, (ru) => {
        ru.merge([{ userId: users[0].id }, { userId: users[1].id }])
      })
      .create()

    // 22/03 e 08/04
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
      .with('rdoUsers', 2, (ru) => {
        ru.merge([{ userId: users[0].id }, { userId: users[1].id }])
      })
      .createMany(4)

    await RdoFactory.merge([
      { contratoId: contrato.id, data: DateTime.fromISO('2021-03-22T08:00:00') },
    ])
      .with('rdoAtividades', 1, (ra) => {
        ra.merge([
          {
            atividadeId: atividades[3].id,
            horaInicio: DateTime.fromISO('2021-04-08T09:00:00'),
            horaFim: DateTime.fromISO('2021-04-08T10:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furos[0].id,
          },
        ])
      })
      .with('rdoUsers', 2, (ru) => {
        ru.merge([{ userId: users[0].id }, { userId: users[1].id }])
      })
      .create()

    // 20/04
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
            furoId: furos[1].id,
          },
          {
            atividadeId: atividades[1].id,
            horaInicio: DateTime.fromISO('2021-04-08T09:00:00'),
            horaFim: DateTime.fromISO('2021-04-08T10:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furos[1].id,
          },
          {
            atividadeId: atividades[3].id,
            horaInicio: DateTime.fromISO('2021-04-15T10:00:00'),
            horaFim: DateTime.fromISO('2021-04-15T11:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furos[1].id,
          },
        ])
      })
      .with('rdoUsers', 2, (ru) => {
        ru.merge([{ userId: users[0].id }, { userId: users[1].id }])
      })
      .create()

    // 20/04
    await RdoFactory.merge([
      { contratoId: contrato.id, data: DateTime.fromISO('2021-04-20T08:00:00') },
    ])
      .with('rdoAtividades', 1, (ra) => {
        ra.merge([
          {
            atividadeId: atividades[1].id,
            horaInicio: DateTime.fromISO('2021-04-08T09:00:00'),
            horaFim: DateTime.fromISO('2021-04-08T10:00:00'),
            quantidadeInicial: 0,
            quantidadeFinal: 1,
            quantidade: 1,
            furoId: furos[0].id,
          },
        ])
      })
      .with('rdoUsers', 2, (ru) => {
        ru.merge([{ userId: users[0].id }, { userId: users[1].id }])
      })
      .create()
  })

  group.afterEach(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test('should excel service return a workbook', async (assert) => {
    const initialDate = '2021-03-21'
    const finalDate = '2021-04-21'
    const userId = users[0].id
    const contractId = contrato.id

    const service = new AtividadeFuncionarioService(contractId, userId, initialDate, finalDate)

    const atividadesFuncionario = await service.build()

    const excelService = new AtividadeFuncionarioExcelService(
      userId,
      initialDate,
      finalDate,
      atividadesFuncionario
    )

    const workbook = await excelService.build()
    const ws = workbook.getWorksheet('Produção Funcionário')

    const cell = ws.getCell('B1')
    const userName = cell.value

    assert.isTrue(cell.isMerged)
    assert.equal(userName, users[0].nome.toUpperCase())
  })
})
