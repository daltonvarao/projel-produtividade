import test from 'japa'
import Database from '@ioc:Adonis/Lucid/Database'
import SyncServiceData from 'App/Services/SyncServiceData'
import {
  ApiSyncVersionFactory,
  AtividadeFactory,
  ContratoFactory,
  EquipamentoFactory,
  UserFactory,
} from 'Database/factories'

test.group('SyncServiceData', async (group) => {
  group.before(async () => {
    await Database.beginGlobalTransaction()
  })

  group.after(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test('should SyncServiceData throws an error if not found ApiSyncVersion', async (assert) => {
    const service = new SyncServiceData()
    const contrato = await ContratoFactory.create()

    try {
      await service.build(contrato.id)
    } catch ({ message }) {
      assert.equal(message, 'ApiSyncVersion not found.')
    }
  })

  test('should SyncServiceData build data to send to app', async (assert) => {
    const apiSyncVersion = await ApiSyncVersionFactory.create()

    await UserFactory.with('cargo').createMany(5)
    await EquipamentoFactory.createMany(5)
    await AtividadeFactory.createMany(5)
    const contrato = await ContratoFactory.create()

    const service = new SyncServiceData()

    try {
      const data = await service.build(contrato.id)

      assert.property(data, 'equipamentos')
      assert.instanceOf(data.equipamentos, Array)
      assert.lengthOf(data.equipamentos, 5)

      assert.property(data, 'atividades')
      assert.instanceOf(data.atividades, Array)
      assert.lengthOf(data.atividades, 5)

      assert.property(data, 'users')
      assert.instanceOf(data.users, Array)
      assert.lengthOf(data.users, 5)

      assert.propertyVal(data, 'sync_version_id', apiSyncVersion.id)
    } catch ({ message }) {}
  })
})
