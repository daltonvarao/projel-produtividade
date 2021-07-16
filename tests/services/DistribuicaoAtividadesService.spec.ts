import test from 'japa'

import { DateTime } from 'luxon'
import {
  AtividadeFactory,
  ContratoFactory,
  EquipamentoFactory,
  RdoFactory,
} from 'Database/factories'

import Database from '@ioc:Adonis/Lucid/Database'
import Atividade from 'App/Models/Atividade'
import Contrato from 'App/Models/Contrato'
import DistribuicaoAtividadesService from 'App/Services/DistribuicaoAtividadesService'
import Equipamento from 'App/Models/Equipamento'

test.group('DistribuicaoAtividadesService', async (group) => {
  let atividades: Atividade[]
  let contrato: Contrato
  let equipamentos: Equipamento[]

  group.before(async () => {
    await Database.beginGlobalTransaction()

    contrato = await ContratoFactory.create()

    atividades = await AtividadeFactory.merge([
      { tipo: 'improdutiva', descricao: 'Almoço', contratoId: contrato.id },
      { tipo: 'produtiva', descricao: 'Sondagem', contratoId: contrato.id },
      { tipo: 'produtiva', descricao: 'Ensaio', contratoId: contrato.id },
    ]).createMany(3)

    equipamentos = await EquipamentoFactory.merge([
      { contratoId: contrato.id, tag: 'PJL-001', descricao: 'Sonda Mach 700', sonda: true },
      { contratoId: contrato.id, tag: 'PJL-002', descricao: 'Sondeq', sonda: true },
      { contratoId: contrato.id, tag: 'PJL-003', descricao: 'Caminhao pipa', sonda: false },
    ]).createMany(3)

    await RdoFactory.merge([
      {
        equipamentoId: equipamentos[0].id,
        contratoId: contrato.id,
        data: DateTime.fromISO('2021-01-01T08:00:00'),
      },
      {
        equipamentoId: equipamentos[0].id,
        contratoId: contrato.id,
        data: DateTime.fromISO('2021-02-01T08:00:00'),
      },
      {
        equipamentoId: equipamentos[0].id,
        contratoId: contrato.id,
        data: DateTime.fromISO('2021-02-15T08:00:00'),
      },
      {
        equipamentoId: equipamentos[1].id,
        contratoId: contrato.id,
        data: DateTime.fromISO('2021-02-28T08:00:00'),
      },
      {
        equipamentoId: equipamentos[1].id,
        contratoId: contrato.id,
        data: DateTime.fromISO('2021-03-31T08:00:00'),
      },
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
          },
          {
            atividadeId: atividades[2].id,
            horaInicio: DateTime.fromISO('2021-01-31T10:00:00'),
            horaFim: DateTime.fromISO('2021-01-31T11:00:00'),
          },
        ])
      })
      .createMany(5)
  })

  group.after(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test('should AtividadesImprodutivasService.build returns a summary by tipo atividade', async (assert) => {
    const initialDate = '2021-02-01'
    const finalDate = '2021-02-28'

    const service = new DistribuicaoAtividadesService(contrato.id, initialDate, finalDate)
    const summary = await service.build()

    // produtivas
    assert.lengthOf(summary.produtivas.atividades, 2)
    assert.equal(summary.produtivas.atividades[0].totalTime, 3)
    assert.equal(summary.produtivas.totalTime, 6)

    // improdutivas
    assert.lengthOf(summary.improdutivas.atividades, 1)
    assert.equal(summary.improdutivas.atividades[0].totalTime, 3)
    assert.equal(summary.improdutivas.totalTime, 3)

    // paradas
    assert.lengthOf(summary.paradas.atividades, 0)
    assert.equal(summary.paradas.totalTime, 0)

    // summary
    assert.lengthOf(summary.totalTimes, 3)
  })

  test('should AtividadesImprodutivasService.build returns a list of atividades for specific equipamento when equipamentoId is defined', async (assert) => {
    const initialDate = '2021-02-01'
    const finalDate = '2021-02-28'
    const equipamentoId = equipamentos[0].id

    const service = new DistribuicaoAtividadesService(
      contrato.id,
      initialDate,
      finalDate,
      equipamentoId
    )
    const summary = await service.build()

    // produtivas
    assert.lengthOf(summary.produtivas.atividades, 2)
    assert.equal(summary.produtivas.atividades[0].totalTime, 2)
    assert.equal(summary.produtivas.totalTime, 4)

    // improdutivas
    assert.lengthOf(summary.improdutivas.atividades, 1)
    assert.equal(summary.improdutivas.atividades[0].totalTime, 2)
    assert.equal(summary.improdutivas.totalTime, 2)

    // paradas
    assert.lengthOf(summary.paradas.atividades, 0)
    assert.equal(summary.paradas.totalTime, 0)

    // summary
    assert.lengthOf(summary.totalTimes, 3)
  })
})
