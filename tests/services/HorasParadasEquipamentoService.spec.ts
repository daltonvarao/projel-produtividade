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
import HorasParadasEquipamentoService from 'App/Services/HorasParadasEquipamentoService'
import Equipamento from 'App/Models/Equipamento'

test.group('HorasParadasEquipamentoService', async (group) => {
  let atividades: Atividade[]
  let contrato: Contrato
  let equipamentos: Equipamento[]

  group.before(async () => {
    await Database.beginGlobalTransaction()

    contrato = await ContratoFactory.create()

    atividades = await AtividadeFactory.merge([
      { tipo: 'parada', descricao: 'Aguardando Frente', contratoId: contrato.id },
      { tipo: 'parada', descricao: 'Manutenção Preventiva', contratoId: contrato.id },
      { tipo: 'produtiva', descricao: 'Sondagem', contratoId: contrato.id },
    ]).createMany(3)

    equipamentos = await EquipamentoFactory.merge([
      { contratoId: contrato.id, tag: 'PJL-001', descricao: 'Sonda Mach 700', sonda: true },
      { contratoId: contrato.id, tag: 'PJL-002', descricao: 'Sondeq', sonda: true },
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

  test.only('should HorasParadasEquipamento.build returns a list of atividades paradas', async (assert) => {
    const initialDate = '2021-02-01'
    const finalDate = '2021-02-28'
    const equipamentoId = equipamentos[0].id
    const contratoId = contrato.id

    const service = new HorasParadasEquipamentoService(
      contratoId,
      equipamentoId,
      initialDate,
      finalDate
    )
    const horasParadas = await service.build()

    assert.lengthOf(horasParadas, 4)
    assert.deepEqual(horasParadas[0], {
      equipamento: equipamentos[0].tag,
      hora_inicio: '08:00:00',
      hora_fim: '09:00:00',
      atividade: atividades[0].descricao,
      data: '01/02/2021',
      horas: 1,
    })
  })
})
