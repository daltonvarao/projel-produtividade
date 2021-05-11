import Contrato from 'App/Models/Contrato'

declare module '@ioc:Adonis/Core/Request' {
  interface RequestContract {
    currentContrato?: Contrato
    contratoId: number
  }
}
