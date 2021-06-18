import test from 'japa'

import { DateTime } from 'luxon'
import { AtividadeFactory, ContratoFactory, RdoFactory } from 'Database/factories'

import Database from '@ioc:Adonis/Lucid/Database'
import Atividade from 'App/Models/Atividade'
import Rdo from 'App/Models/Rdo'
import Contrato from 'App/Models/Contrato'
import DistribuicaoAtividadesService from 'App/Services/DistribuicaoAtividadesService'

test.group('AtividadeRdoUserService', async (group) => {
  let atividades: Atividade[]
  let rdos: Rdo[]
  let contrato: Contrato

  group.before(async () => {
    await Database.beginGlobalTransaction()

    contrato = await ContratoFactory.create()

    atividades = await AtividadeFactory.merge([
      { tipo: 'improdutiva', descricao: 'Almoço', contratoId: contrato.id },
      { tipo: 'produtiva', descricao: 'Sondagem', contratoId: contrato.id },
      { tipo: 'produtiva', descricao: 'Ensaio', contratoId: contrato.id },
    ]).createMany(3)

    rdos = await RdoFactory.merge([
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
          },
          {
            atividadeId: atividades[2].id,
            horaInicio: DateTime.fromISO('2021-01-31T10:00:00'),
            horaFim: DateTime.fromISO('2021-01-31T11:00:00'),
          },
        ])
      })
      .createMany(3)
  })

  group.after(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test.only('should AtividadesImprodutivasService.build returns a list of atividades.tipo = "improdutivas" in period', async (assert) => {
    const initialDate = '2021-01-01'
    const finalDate = '2021-01-31'

    const service = new DistribuicaoAtividadesService(contrato.id, initialDate, finalDate)
    const atividades = await service.build()

    assert.lengthOf(atividades.produtivas, 2)
    assert.lengthOf(atividades.produtivas[0].rdoAtividades, 3)

    assert.lengthOf(atividades.improdutivas, 1)
    assert.lengthOf(atividades.improdutivas[0].rdoAtividades, 3)

    assert.lengthOf(atividades.paradas, 0)
  })
})
