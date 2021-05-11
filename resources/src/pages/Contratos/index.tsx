import React, { useEffect, useReducer, useState } from 'react'
import ReactDOM from 'react-dom'

import Atividade from '../../interfaces/Atividade'
import Cargo from '../../interfaces/Cargo'
import Contrato from '../../interfaces/Contrato'
import {
  CardContent,
  InfoCard,
  Input,
  SaveButton,
  Table,
  TableCard,
  TableContainer,
} from './styles'

import { initialState, reducer, ContratoValorData } from './reducer'
import api from '../../services/api'
import Alert from '../../components/Alert'

interface ContratosProps {
  contrato: Contrato
  cargos: Cargo[]
  atividades: Atividade[]
}

const Contratos: React.FC<ContratosProps> = ({ contrato, atividades, cargos }) => {
  const [state, dispatch] = useReducer(reducer, initialState)
  const [alert, setAlert] = useState<{ message: string; type: 'success' | 'error' }>({
    message: '',
    type: 'success',
  })

  function flattenData(state: ContratoValorData[][]) {
    const newState: ContratoValorData[] = []

    Object.values(state).map((row) => {
      newState.push(...row)
    })

    return newState
  }

  async function handleSendData() {
    const data = flattenData(state)

    try {
      await api.post(`contratos/${contrato.id}/contrato-valores`, { data })

      setAlert({ message: 'Dados salvos', type: 'success' })
    } catch (error) {
      setAlert({ message: error.message, type: 'error' })
    }

    setTimeout(() => {
      location.reload()
    }, 2500)
  }

  async function buildGridData() {
    const data: ContratoValorData[][] = []

    cargos.map((c) => {
      const row: ContratoValorData[] = []

      atividades.map((a) => {
        const newCV: ContratoValorData = {
          atividadeId: a.id,
          cargoId: c.id,
          valorUnitario: 0,
          id: null,
        }

        contrato.contratoValores.map((cv) => {
          if (a.id === cv.atividade_id && c.id === cv.cargo_id) {
            newCV.valorUnitario = cv.valor_unitario
            newCV.id = cv.id
          }
        })

        row.push(newCV)
      })

      data.push(row)
    })

    dispatch({ type: 'BUILD_STATE', value: data })
  }

  useEffect(() => {
    buildGridData()
  }, [])

  if (!state[0]) {
    return <h1>Loading</h1>
  }

  return (
    <>
      <Alert.show duration={5000} message={alert.message} type={alert.type} />
      <InfoCard>
        <CardContent>
          <div>
            <h5>Descrição</h5>
            <h4>{contrato.descricao}</h4>
          </div>
          <div>
            <h5>Número</h5>
            <h4>{contrato.numero}</h4>
          </div>
          <div>
            <h5>Centro de custo</h5>
            <h4>{contrato.centro_custo}</h4>
          </div>
          <div></div>
        </CardContent>
      </InfoCard>

      <TableCard>
        <h3>Valores unitários Cargo x Atividade</h3>
        <TableContainer>
          <Table>
            <thead>
              <tr>
                <th>Cargo / Atividade</th>
                {cargos.map((cargo: Cargo, ci) => {
                  return <th key={ci}>{cargo.titulo}</th>
                })}
              </tr>
            </thead>
            <tbody>
              {atividades.map((atividade: Atividade, ai) => {
                return (
                  <tr key={ai}>
                    <th>{atividade.descricao}</th>
                    {cargos.map((cargo, ci) => {
                      return (
                        <td title={`${cargo.titulo} / ${atividade.descricao}`} key={ci}>
                          <Input
                            value={state[ci][ai].valorUnitario}
                            onChange={(ev) => {
                              const newState = Object.assign([], state) as ContratoValorData[][]
                              const newValue = ev.target.value

                              newState[ci][ai].valorUnitario = newValue

                              dispatch({ type: 'CHANGE_STATE', value: newState })
                            }}
                          />
                        </td>
                      )
                    })}
                  </tr>
                )
              })}
            </tbody>
          </Table>
        </TableContainer>

        <SaveButton onClick={handleSendData}>Salvar</SaveButton>
      </TableCard>
    </>
  )
}

const contratoContainer = document.querySelector('#react-contratos')

if (contratoContainer) {
  const rawContrato = contratoContainer.getAttribute('data-contrato') || ''
  const contrato: Contrato = JSON.parse(rawContrato)

  const rawAtividades = contratoContainer.getAttribute('data-atividades') || ''
  const atividades = JSON.parse(rawAtividades)

  const rawCargos = contratoContainer.getAttribute('data-cargos') || ''
  const cargos = JSON.parse(rawCargos)

  ReactDOM.render(
    <Contratos contrato={contrato} cargos={cargos} atividades={atividades} />,
    contratoContainer
  )
}
