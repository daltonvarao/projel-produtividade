import React, { useEffect, useState } from 'react'
import ReactDOM from 'react-dom'
import ReactSelectInput from '../../components/ReactSelectInput'

interface Atividade {
  descricao: string
  tipo: 'parada' | 'produtiva' | 'improdutiva'
  unidade_medida: 'metros' | 'unidades'
  id: number
}

interface Furo {
  nome: string
  id: number
}

interface CreateRdoAtividadesProps {
  atividades: Atividade[]
  furos: Furo[]
}

const CreateRdoAtividades: React.FC<CreateRdoAtividadesProps> = ({ atividades, furos }) => {
  const [quantidadeInicial, setQuantidadeInicial] = useState('0')
  const [quantidadeFinal, setQuantidadeFinal] = useState('0')
  const [quantidade, setQuantidade] = useState('0')
  const [atividade, setAtividade] = useState<Atividade>()
  const [furo, setFuro] = useState<Furo>()

  useEffect(() => {
    const result = Number(quantidadeFinal) - Number(quantidadeInicial)
    setQuantidade(String(result))
  }, [quantidadeInicial, quantidadeFinal])

  return (
    <React.Fragment>
      <div className="form-group">
        <label htmlFor="atividade">Atividade</label>
        <ReactSelectInput
          collection={atividades}
          labelKey={'descricao'}
          valueKey="id"
          inputId="atividade"
          placeholder="Selecione uma atividade"
          value={atividade}
          onChange={(value: Atividade) => {
            setAtividade(value)
          }}
          name="atividadeId"
        />
      </div>

      {atividade?.tipo === 'produtiva' && (
        <div className="form-group">
          <label htmlFor="furo">Furos</label>
          <ReactSelectInput
            collection={furos}
            labelKey="nome"
            valueKey="id"
            inputId="furo"
            placeholder="Selecione um furo"
            value={furo}
            onChange={(value: Furo) => {
              setFuro(value)
            }}
            name="furoId"
          />
        </div>
      )}

      <div className="form-group-inline">
        {atividade?.tipo === 'produtiva' && atividade.unidade_medida === 'metros' ? (
          <>
            <div className="form-group">
              <label htmlFor="quantidade-inicial">Quantidade Inicial</label>
              <input
                type="number"
                name="quantidadeInicial"
                id="quantidade-inicial"
                value={quantidadeInicial}
                onChange={(ev) => setQuantidadeInicial(ev.target.value)}
              />
            </div>

            <div className="form-group">
              <label htmlFor="quantidade-final">Quantidade Final</label>
              <input
                type="number"
                name="quantidadeFinal"
                value={quantidadeFinal}
                id="quantidade-final"
                onChange={(ev) => setQuantidadeFinal(ev.target.value)}
              />
            </div>
          </>
        ) : null}

        {atividade?.tipo === 'produtiva' && (
          <div className="form-group">
            <label htmlFor="quantidade">
              {atividade.unidade_medida === 'metros' ? 'Quantidade Total' : 'Quantidade'}
            </label>
            <input
              value={quantidade}
              type="number"
              name="quantidade"
              id="quantidade"
              onChange={(ev) => setQuantidade(ev.target.value)}
              readOnly={atividade?.unidade_medida === 'metros'}
            />
          </div>
        )}
      </div>
    </React.Fragment>
  )
}

const container = document.querySelector('#create-rdo-atividades')

if (container) {
  const atividadesRaw = unescape(container.getAttribute('data-atividades') || '')
  const atividades: Atividade[] = JSON.parse(atividadesRaw || '[]')

  const furosRaw = container.getAttribute('data-furos')
  const furos: Furo[] = JSON.parse(furosRaw || '[]')

  ReactDOM.render(<CreateRdoAtividades furos={furos} atividades={atividades} />, container)
}
