import test from 'japa'

import { DateTime } from 'luxon'
import {
  AtividadeFactory,
  ContratoFactory,
  EquipamentoFactory,
  FuroFactory,
  RdoFactory,
} from 'Database/factories'

import Database from '@ioc:Adonis/Lucid/Database'
import Atividade from 'App/Models/Atividade'
import Contrato from 'App/Models/Contrato'
import AtividadeEquipamentoService from 'App/Services/AtividadeEquipamentoService'
import Equipamento from 'App/Models/Equipamento'
import Furo from 'App/Models/Furo'

test.group('AtividadeEquipamentoService', async (group) => {
  let atividades: Atividade[]
  let contrato: Contrato
  let equipamentos: Equipamento[]
  let furos: Furo[]

  group.before(async () => {
    await Database.beginGlobalTransaction()

    contrato = await ContratoFactory.create()

    atividades = await AtividadeFactory.merge([
      {
        descricao: 'Almoço',
        unidadeMedida: 'unidades',
        tipo: 'parada',
        contratoId: contrato.id,
      },
      {
        descricao: 'Sondagem',
        unidadeMedida: 'metros',
        tipo: 'produtiva',
        contratoId: contrato.id,
      },
      {
        descricao: 'Ensaio',
        unidadeMedida: 'unidades',
        tipo: 'produtiva',
        contratoId: contrato.id,
      },
    ]).createMany(3)

    equipamentos = await EquipamentoFactory.merge([
      { contratoId: contrato.id, tag: 'PJL-001', descricao: 'Sonda Mach 700', sonda: true },
      { contratoId: contrato.id, tag: 'PJL-002', descricao: 'Sondeq', sonda: true },
      { contratoId: contrato.id, tag: 'PJL-003', descricao: 'Caminhao pipa', sonda: false },
    ]).createMany(3)

    furos = await FuroFactory.createMany(2)

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
        equipamentoId: equipamentos[0].id,
        contratoId: contrato.id,
        data: DateTime.fromISO('2021-02-15T08:00:00'),
      },
      {
        equipamentoId: equipamentos[1].id,
        contratoId: contrato.id,
        data: DateTime.fromISO('2021-02-27T08:00:00'),
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
            horaFim: DateTime.fromISO('2021-01-15T10:30:00'),
            quantidade: 1,
            furoId: furos[0].id,
          },
          {
            atividadeId: atividades[2].id,
            horaInicio: DateTime.fromISO('2021-01-31T10:00:00'),
            horaFim: DateTime.fromISO('2021-01-31T11:30:00'),
            quantidade: 1,
            furoId: furos[0].id,
          },
        ])
      })
      .createMany(6)

    await RdoFactory.merge([
      {
        equipamentoId: equipamentos[0].id,
        contratoId: contrato.id,
        data: DateTime.fromISO('2021-02-15T08:00:00'),
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
            horaFim: DateTime.fromISO('2021-01-15T10:30:00'),
            quantidade: 1,
            furoId: furos[1].id,
          },
          {
            atividadeId: atividades[2].id,
            horaInicio: DateTime.fromISO('2021-01-31T10:00:00'),
            horaFim: DateTime.fromISO('2021-01-31T11:30:00'),
            quantidade: 1,
            furoId: furos[0].id,
          },
        ])
      })
      .create()
  })

  group.after(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test('should AtividadeEquipamentoService.build return production for an specific equipment', async (assert) => {
    const initialDate = '2021-02-01'
    const finalDate = '2021-02-28'
    const equipamentoId = equipamentos[0].id

    const service = new AtividadeEquipamentoService(
      contrato.id,
      equipamentoId,
      initialDate,
      finalDate
    )
    const { atividadesEquipamento, totalAtividades, atividades } = await service.build()
    assert.lengthOf(atividadesEquipamento, 3)

    const firstDate = atividadesEquipamento[0]
    assert.lengthOf(firstDate, 3)
    assert.equal(firstDate[0].data, '01/02/2021')

    assert.lengthOf(totalAtividades, 3)
    assert.deepEqual(totalAtividades, [
      {
        atividade: atividades[0].descricao,
        horas: 4,
        quantidade: 0,
      },
      {
        atividade: atividades[1].descricao,
        horas: 6,
        quantidade: 4,
      },
      {
        atividade: atividades[2].descricao,
        horas: 6,
        quantidade: 4,
      },
    ])

    assert.lengthOf(atividades, 3)
    assert.deepEqual(atividades, [
      {
        descricao: atividades[0].descricao,
        unidade_medida: 'unidades',
        tipo: 'parada',
      },
      {
        descricao: atividades[1].descricao,
        unidade_medida: 'unidades',
        tipo: 'produtiva',
      },
      {
        descricao: atividades[2].descricao,
        unidade_medida: 'metros',
        tipo: 'produtiva',
      },
    ])
  })
})
