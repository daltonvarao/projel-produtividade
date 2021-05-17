import Route from '@ioc:Adonis/Core/Route'

// public routes
Route.group(() => {
  Route.resource('auth', 'AuthController').only(['store'])
})
  .namespace('App/Controllers/Http/Api')
  .as('api')
  .prefix('api')

// protected routes
Route.group(() => {
  Route.resource('sync-version-is-outdated', 'ApiSyncVersionsController').only(['index'])
  Route.resource('sync-data', 'ApiSyncDataController').only(['index'])
  Route.resource('rdos', 'RdosController').only(['store'])
})
  .namespace('App/Controllers/Http/Api')
  .as('api')
  .prefix('api')
  .middleware(['auth:api', 'log'])
