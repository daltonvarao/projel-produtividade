import test from 'japa'
import api from 'supertest'
import Database from '@ioc:Adonis/Lucid/Database'
import { ApiSyncVersionFactory, UserFactory } from 'Database/factories'

const BASE_URL = `http://${process.env.HOST}:${process.env.PORT}/api`

test.group('Api ApiSyncVersionController', (group) => {
  group.before(async () => {
    await Database.beginGlobalTransaction()
  })

  group.after(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test('should POST in /api/sync-version-is-outdated return error if dont find an record', async (assert) => {
    const user = await UserFactory.with('cargo').create()

    const { body } = await api(BASE_URL).post('/auth').set('Accept', 'application/json').send({
      cpf: user.cpf,
      password: '123456',
    })

    const response = await api(BASE_URL)
      .get('/sync-version-is-outdated')
      .set('Accept', 'application/json')
      .set('Authorization', `Bearer ${body.token}`)
      .query({
        sync_version_id: 1,
      })

    assert.equal(response.status, 404)
    assert.property(response.body, 'errors')
  })

  test('should POST in /api/sync-version-is-outdated return error with empty form data', async (assert) => {
    const user = await UserFactory.with('cargo').create()

    const { body } = await api(BASE_URL).post('/auth').set('Accept', 'application/json').send({
      cpf: user.cpf,
      password: '123456',
    })

    const response = await api(BASE_URL)
      .get('/sync-version-is-outdated')
      .set('Accept', 'application/json')
      .set('Authorization', `Bearer ${body.token}`)

    assert.equal(response.status, 422)
    assert.property(response.body, 'errors')
  })

  test('should GET in /api/sync-version-is-outdated return last ApiSyncVersion', async (assert) => {
    const user = await UserFactory.with('cargo').create()

    const apiSyncVersions = await ApiSyncVersionFactory.createMany(5)
    const apiSyncVersion = apiSyncVersions[4]

    const { body } = await api(BASE_URL).post('/auth').set('Accept', 'application/json').send({
      cpf: user.cpf,
      password: '123456',
    })

    const response = await api(BASE_URL)
      .get('/sync-version-is-outdated')
      .set('Accept', 'application/json')
      .set('Authorization', `Bearer ${body.token}`)
      .query({
        sync_version_id: apiSyncVersion.id,
      })

    assert.equal(response.status, 200)
    assert.propertyVal(response.body, 'outdated', false)
  })
})
