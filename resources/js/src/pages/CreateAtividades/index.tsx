import React, { useEffect, useState } from 'react'
import ReactDOM from 'react-dom'

interface Cargo {
  id: number
  titulo: string
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
  flashMessages: FlashMessages
}

const CreateAtividades: React.FC<CreateAtividadesProps> = ({ cargos, flashMessages }) => {
  const tipos = ['produtiva', 'improdutiva', 'parada']
  const unidadeMedidas = ['unidades', 'metros']

  const [tipo, setTipo] = useState('')

  useEffect(() => {
    if (flashMessages?.tipo) {
      setTipo(flashMessages.tipo)
    }
  }, [flashMessages])

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
              id="unidade_medida"
              className={flashMessages?.errors?.unidade_medida && 'invalid'}
              defaultValue={flashMessages?.unidade_medida}
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
                      <input type="hidden" value={cargo.id} name={`cargoId[${cargoIndex}]`} />
                    </td>
                    <td className="text-right">
                      <input
                        className="w-25"
                        type="number"
                        step="0.01"
                        defaultValue="0.0"
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

const container = document.querySelector('#react-create-atividade')

if (container) {
  const cargosRaw = container.getAttribute('data-cargos')
  const cargos = JSON.parse(cargosRaw ?? '[]')
  const flashMessagesRaw = container.getAttribute('data-flashmessages')
  const flashMessages = JSON.parse(flashMessagesRaw ?? '[]')

  ReactDOM.render(<CreateAtividades cargos={cargos} flashMessages={flashMessages} />, container)
}
