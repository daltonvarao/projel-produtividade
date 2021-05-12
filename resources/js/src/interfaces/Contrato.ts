import ContratoValor from './ContratoValor'

export default interface Contrato {
  id: number
  centro_custo: string
  descricao: string
  numero: string
  created_at: string
  updated_at: string
  contratoValores: ContratoValor[]
}
