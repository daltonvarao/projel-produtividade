import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class HelpsController {
  public async index({ view }: HttpContextContract) {
    return view.render('admin/help/index')
  }
}
