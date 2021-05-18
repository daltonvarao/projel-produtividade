import React, { useEffect, useState } from 'react'
import ReactDOM from 'react-dom'

// import { Container } from './styles';

interface Cargo {
  id: number
  titulo: string
}

interface CreateAtividadesProps {
  cargos: Cargo[]
}

const CreateAtividades: React.FC<CreateAtividadesProps> = ({ cargos }) => {
  const tipos = ['produtiva', 'improdutiva', 'parada']
  const unidadeMedidas = ['unidades', 'metros']

  const [tipo, setTipo] = useState('')

  return (
    <React.Fragment>
      <div className="form-group">
        <label htmlFor="tipo">Tipo</label>
        <select
          onChange={(ev) => setTipo(ev.target.value)}
          defaultValue={tipo}
          name="tipo"
          id="tipo"
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

        {/* @if(flashMessages.has(field))
          <span class="input-validation">
            {{ flashMessages.get(field) }}
          </span>
        @endif */}
      </div>

      {tipo === 'produtiva' ? (
        <React.Fragment>
          <div className="form-group">
            <label htmlFor="unidade_medida">Unidade de medida</label>
            <select name="unidade_medida" id="unidade_medida">
              <option value="">Selecione</option>
              {unidadeMedidas.map((unidade, index) => {
                return (
                  <option value={unidade} key={index}>
                    {unidade}
                  </option>
                )
              })}
            </select>

            {/* @if(flashMessages.has(field))
          <span class="input-validation">
            {{ flashMessages.get(field) }}
          </span>
        @endif */}
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
                        type="text"
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

  ReactDOM.render(<CreateAtividades cargos={cargos} />, container)
}
