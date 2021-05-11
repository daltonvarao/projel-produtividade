import test from 'japa'
import api from 'supertest'
import {
  ApiSyncVersionFactory,
  AtividadeFactory,
  EquipamentoFactory,
  UserFactory,
} from 'Database/factories'
import Database from '@ioc:Adonis/Lucid/Database'

const BASE_URL = `http://${process.env.HOST}:${process.env.PORT}/api`

test.group('Api ApiSyncDataController', (group) => {
  let token: string

  group.before(async () => {
    await Database.beginGlobalTransaction()

    const user = await UserFactory.with('cargo').create()

    const { body } = await api(BASE_URL)
      .post('/auth')
      .send({
        cpf: user.cpf,
        password: '123456',
      })
      .set('Accept', 'application/json')

    token = body.token
  })

  group.after(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test('should GET in /api/sync-data receive an error if not found ApySyncVersion', async () => {
    await api(BASE_URL)
      .get('/sync-data')
      .set('Accept', 'application/json')
      .set('Authorization', `Bearer ${token}`)
      .expect(404)
  })

  test('should GET in /api/sync-data receive data to sync app', async (assert) => {
    await ApiSyncVersionFactory.create()

    await UserFactory.with('cargo').createMany(4)
    await EquipamentoFactory.createMany(5)
    await AtividadeFactory.createMany(5)

    const { body: data } = await api(BASE_URL)
      .get('/sync-data')
      .set('Accept', 'application/json')
      .set('Authorization', `Bearer ${token}`)

    assert.property(data, 'equipamentos')
    assert.instanceOf(data.equipamentos, Array)
    assert.lengthOf(data.equipamentos, 5)

    assert.property(data, 'atividades')
    assert.instanceOf(data.atividades, Array)
    assert.lengthOf(data.atividades, 5)

    assert.property(data, 'users')
    assert.instanceOf(data.users, Array)
    assert.lengthOf(data.users, 5)

    assert.property(data, 'cargos')
    assert.instanceOf(data.cargos, Array)
    assert.lengthOf(data.cargos, 5)
  })
})
