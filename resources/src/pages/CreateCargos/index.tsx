import React, { useEffect, useReducer, useState } from 'react'
import ReactDOM from 'react-dom'
import Loader from '../../components/Loader'
import Switch from '../../components/Switch'
import Resource from '../../interfaces/Resource'
import { initialState, reducer, SwitchState } from './reducer'

interface CreateCargoPermissionsProps {
  resources: Resource[]
}

const CreateCargoPermissions: React.FC<CreateCargoPermissionsProps> = ({ resources }) => {
  const [values, setValues] = useState({
    create: false,
    read: false,
    update: false,
    delete: false,
  })

  const [state, dispatch] = useReducer(reducer, initialState)

  function onChange(op: keyof typeof values, newValue: boolean) {
    setValues((value) => {
      const v = { ...value }
      v[op] = newValue
      return v
    })

    let newState = Object.values(state)

    newState.map((s) => {
      s[op] = newValue
    })

    dispatch({ type: 'CHANGE_ALL', value: newState })
  }

  useEffect(() => {
    const newState: typeof initialState = []

    resources.map((_) => {
      const row: SwitchState = {
        read: false,
        create: false,
        update: false,
        delete: false,
      }

      newState.push(row)
    })

    dispatch({ type: 'CHANGE_ALL', value: newState })
  }, [])

  if (state.length < 1) {
    return <Loader />
  }

  return (
    <table className="table">
      <thead>
        <tr>
          <th className="text-left">Recurso</th>
          <th className="text-center">
            <span>Criar</span>
            <Switch
              id="create"
              value={values['create']}
              onChange={(value) => onChange('create', value)}
            />
          </th>
          <th className="text-center">
            <span>Ler</span>
            <Switch
              id="read"
              value={values['read']}
              onChange={(value) => onChange('read', value)}
            />
          </th>
          <th className="text-center">
            <span>Atualizar</span>
            <Switch
              id="update"
              value={values['update']}
              onChange={(value) => onChange('update', value)}
            />
          </th>
          <th className="text-center">
            <span>Deletar</span>
            <Switch
              id="delete"
              value={values['delete']}
              onChange={(value) => onChange('delete', value)}
            />
          </th>
        </tr>
      </thead>
      <tbody>
        {resources.map((resource, resourceIndex) => {
          return (
            <tr key={resourceIndex}>
              <td className="text-left">
                {resource.title}
                <input type="hidden" name={`name[${resourceIndex}]`} value={resource.name} />
              </td>
              {['create', 'read', 'update', 'delete'].map((action, actionIndex) => {
                const name = `${action}[${resourceIndex}]`
                const disabled = !resource.actions[actionIndex]

                return (
                  <td key={actionIndex} className="text-center">
                    <Switch
                      onChange={(value) => {
                        const newState = Object.values(state)
                        newState[resourceIndex][action] = value
                        dispatch({ type: 'CHANGE_ALL', value: newState })
                      }}
                      disabled={disabled}
                      name={name}
                      value={state[resourceIndex][action]}
                      id={name}
                    />
                  </td>
                )
              })}
            </tr>
          )
        })}
      </tbody>
    </table>
  )
}

const container = document.querySelector('#react-create-cargos')
if (container) {
  const rawResources = container.getAttribute('data-resources') || '[]'
  const resources = JSON.parse(rawResources) as Resource[]

  ReactDOM.render(<CreateCargoPermissions resources={resources} />, container)
}
