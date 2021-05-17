import Route from '@ioc:Adonis/Core/Route'

Route.resource('sessions', 'SessionsController')
  .middleware({
    index: 'log',
  })
  .only(['index', 'store'])
  .as('sessions')

Route.delete('sessions', 'SessionsController.destroy')
  .as('admin.sessions.destroy')
  .middleware(['auth', 'log'])
