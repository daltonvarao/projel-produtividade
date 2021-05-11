export interface SwitchState {
  read: boolean
  create: boolean
  update: boolean
  delete: boolean
  name?: string
  id?: number
}

export const initialState: SwitchState[] = []

export interface Action {
  type: 'CHANGE_ALL'
  value: SwitchState[]
}

export const reducer = (state: SwitchState[], { type, value }: Action) => {
  switch (type) {
    case 'CHANGE_ALL':
      return { ...value }

    default:
      return state
  }
}
