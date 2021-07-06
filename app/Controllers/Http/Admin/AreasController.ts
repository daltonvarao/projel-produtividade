import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class AreasController {
  public async index({ view }: HttpContextContract) {
    return view.render('admin/areas/index')
  }
}
