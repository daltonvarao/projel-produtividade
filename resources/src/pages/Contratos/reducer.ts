export interface ContratoValorData {
  atividadeId: number
  cargoId: number
  valorUnitario: string | number
  id: number | null
}

interface Action {
  type: 'CHANGE_STATE' | 'BUILD_STATE'
  value: ContratoValorData[][]
}

export const initialState: ContratoValorData[][] = []

export function reducer(_, action: Action): ContratoValorData[][] {
  switch (action.type) {
    case 'CHANGE_STATE':
      return { ...action.value }

    case 'BUILD_STATE':
      return { ...action.value }
  }
}
