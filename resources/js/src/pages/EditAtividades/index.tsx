import React, { useEffect, useState } from 'react'
import ReactDOM from 'react-dom'
import Loader from '../../components/Loader'

interface Cargo {
  id: number
  titulo: string
}

interface Atividade {
  id: number
  descricao: string
  tipo: string
  unidade_medida: string
  atividadeCargoValores: {
    id: number
    cargo_id: number
    atividade_id: number
    valor_unitario: number
    cargo: {
      id: number
      titulo: string
    }
  }[]
}

interface CreateAtividadeForm {
  descricao?: string
  tipo?: string
  unidade_medida?: string
  cargoId?: number[]
  valorUnitario?: number[]
}

interface FlashMessages extends CreateAtividadeForm {
  errors?: CreateAtividadeForm
}

interface CreateAtividadesProps {
  cargos: Cargo[]
  atividade: Atividade
  flashMessages: FlashMessages
}

const EditAtividades: React.FC<CreateAtividadesProps> = ({ atividade, flashMessages, cargos }) => {
  const tipos = ['produtiva', 'improdutiva', 'parada']
  const unidadeMedidas = ['unidades', 'metros']

  const [tipo, setTipo] = useState('')

  useEffect(() => {
    if (flashMessages?.tipo) {
      setTipo(flashMessages.tipo)
    } else {
      setTipo(atividade.tipo)
    }
  }, [atividade.tipo, flashMessages])

  if (!(atividade && cargos)) {
    return <Loader />
  }

  return (
    <React.Fragment>
      <div className="form-group">
        <label htmlFor="tipo">Tipo</label>
        <select
          onChange={(ev) => setTipo(ev.target.value)}
          value={tipo}
          name="tipo"
          id="tipo"
          className={flashMessages?.errors?.tipo && 'invalid'}
        >
          <option value="">Selecione</option>
          {tipos.map((tipo, index) => {
            return (
              <option value={tipo} key={index}>
                {tipo}
              </option>
            )
          })}
        </select>

        {flashMessages?.errors?.tipo && (
          <span className="input-validation">{flashMessages.errors.tipo}</span>
        )}
      </div>

      {tipo === 'produtiva' ? (
        <React.Fragment>
          <div className="form-group">
            <label htmlFor="unidade_medida">Unidade de medida</label>
            <select
              name="unidade_medida"
              defaultValue={flashMessages?.unidade_medida ?? atividade.unidade_medida}
              id="unidade_medida"
              className={flashMessages?.errors?.unidade_medida && 'invalid'}
            >
              <option value="">Selecione</option>
              {unidadeMedidas.map((unidade, index) => {
                return (
                  <option value={unidade} key={index}>
                    {unidade}
                  </option>
                )
              })}
            </select>

            {flashMessages?.errors?.unidade_medida && (
              <span className="input-validation">{flashMessages.errors.unidade_medida}</span>
            )}
          </div>

          <h2>Valor unitário por cargo</h2>

          <table className="table">
            <thead>
              <tr>
                <th className="text-left">Cargo</th>
                <th className="text-right">Valor Unitário</th>
              </tr>
            </thead>

            <tbody>
              {cargos.map((cargo, cargoIndex) => {
                return (
                  <tr key={cargoIndex}>
                    <td className="text-left">
                      {cargo.titulo}
                      <input
                        type="hidden"
                        defaultValue="false"
                        name={`atividadeCargoId[${cargoIndex}]`}
                      />
                      <input type="hidden" value={cargo.id} name={`cargoId[${cargoIndex}]`} />
                    </td>
                    <td className="text-right">
                      <input
                        className="w-25"
                        type="number"
                        defaultValue={
                          atividade.atividadeCargoValores[cargoIndex]?.valor_unitario ?? '0.0'
                        }
                        name={`valorUnitario[${cargoIndex}]`}
                      />
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </React.Fragment>
      ) : null}
    </React.Fragment>
  )
}

const container = document.querySelector('#react-edit-atividade')

if (container) {
  const cargosRaw = container.getAttribute('data-cargos')
  const cargos = JSON.parse(cargosRaw ?? '[]')
  const atividadeRaw = container.getAttribute('data-atividade')
  const atividade = JSON.parse(atividadeRaw ?? '[]')
  const flashMessagesRaw = container.getAttribute('data-flashmessages')
  const flashMessages = JSON.parse(flashMessagesRaw ?? '[]')

  ReactDOM.render(
    <EditAtividades cargos={cargos} atividade={atividade} flashMessages={flashMessages} />,
    container
  )
}
