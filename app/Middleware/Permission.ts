import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import CargoPermission from 'App/Models/CargoPermission'

export default class Permission {
  protected _filterRouteName(name: string) {
    let newName = name.split('.index')[0]
    newName = newName.split('.show')[0]
    newName = newName.split('.create')[0]
    newName = newName.split('.store')[0]
    newName = newName.split('.edit')[0]
    newName = newName.split('.update')[0]
    newName = newName.split('.destroy')[0]

    return newName
  }

  protected checkPermission(permission: CargoPermission, method: string) {
    if (method === 'GET') {
      if (!permission.can_read) {
        return false
      }
    }

    if (method === 'POST') {
      if (!permission.can_create) {
        return false
      }
    }

    if (method === 'PUT') {
      if (!permission.can_update) {
        return false
      }
    }

    if (method === 'DELETE') {
      if (!permission.can_delete) {
        return false
      }
    }

    return true
  }

  public async handle(
    { auth, route, request, session, response }: HttpContextContract,
    next: () => Promise<void>
  ) {
    const user = auth.user

    if (!user) {
      return await next()
    }

    const name = this._filterRouteName(route?.name || '')
    const permission = await CargoPermission.query().where({ name, cargoId: user.cargoId }).first()

    if (!permission) {
      return await next()
    }

    const method = request.method()

    const hasPermission = this.checkPermission(permission, method)

    if (!hasPermission) {
      session.flash('error', 'Você não possui permissão para acessar este recurso')

      return response.redirect().back()
    }

    await next()
  }
}
