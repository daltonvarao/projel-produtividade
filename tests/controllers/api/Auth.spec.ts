import test from 'japa'
import Database from '@ioc:Adonis/Lucid/Database'
import { UserFactory } from 'Database/factories'

import { api } from '../../utils'
import User from 'App/Models/User'

test.group('Api AuthController', (group) => {
  let user: User
  group.before(async () => {
    await Database.beginGlobalTransaction()
    user = await UserFactory.with('cargo')
      .merge({
        nome: 'Dalton Felipe',
      })
      .create()
  })

  group.after(async () => {
    await Database.rollbackGlobalTransaction()
  })

  test('should POST in /api/auth return an error without credentials', async (assert) => {
    const response = await api.post('/auth').set('Accept', 'application/json')

    assert.equal(response.status, 422)
    assert.property(response.body, 'errors')
  })

  test('should POST in /api/auth return an error with invalid credentials', async (assert) => {
    const response = await api
      .post('/auth')
      .send({
        cpf: '03935644281',
        password: '123456',
      })
      .set('Accept', 'application/json')

    assert.equal(response.status, 400)
    assert.property(response.body, 'errors')
  })

  test('should POST in /api/auth with valid credentials able to authenticate an user', async (assert) => {
    const response = await api
      .post('/auth')
      .send({
        cpf: user.cpf,
        password: '123456',
      })
      .set('Accept', 'application/json')

    assert.equal(response.status, 200)
    assert.property(response.body, 'token')
    assert.propertyVal(response.body, 'userId', user.id)
  })
})
