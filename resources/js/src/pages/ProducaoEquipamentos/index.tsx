import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import { Pie, PieChart, Cell, Legend, Tooltip } from 'recharts'
import stc from 'string-to-color'

import * as Fi from 'react-icons/fi'
import { HeaderContainer, IconsContainer } from './styles'

interface ChartProps {
  data: any[]
  dataKey: string
  labelKey: string
}

const Chart: React.FC<ChartProps> = ({ data, dataKey, labelKey }) => {
  const colors = data.map((entry: any) => stc(entry[labelKey]))

  return (
    <PieChart width={1000} height={450}>
      <Pie data={data} dataKey={dataKey} label nameKey={labelKey}>
        {data.map((_: any, index: number) => {
          return <Cell key={index} fill={colors[index]} />
        })}
      </Pie>
      <Tooltip
        formatter={(value: number) => {
          if (value <= 1) {
            return String(value.toFixed(2)).concat(' hora')
          }
          return String(value.toFixed(2)).concat(' horas')
        }}
      />
      <Legend />
    </PieChart>
  )
}

interface Atividade {
  tipo: 'produtiva' | 'improdutiva' | 'parada'
  descricao: string
}

interface ProducaoEquipamentosProps {
  atividades: {
    summary: Array<{
      quantidade: number
      totalTime: number
      atividade: Atividade
      label: string
    }>
    atividades: Atividade[]
  }
}

const ProducaoEquipamentos: React.FC<ProducaoEquipamentosProps> = ({ atividades }) => {
  const [viewMode, setViewMode] = useState<'chart' | 'list'>('list')

  function toggleViewMode() {
    setViewMode((state) => (state === 'chart' ? 'list' : 'chart'))
  }

  return (
    <div className="table-container">
      <HeaderContainer>
        <h2>{viewMode === 'chart' ? 'Gráfico (Quantitativo em horas)' : 'Lista'}</h2>
        <IconsContainer>
          {viewMode === 'chart' ? (
            <button onClick={toggleViewMode} title="Visualizar lista" className="btn-link">
              <Fi.FiList size={24} />
            </button>
          ) : (
            <button onClick={toggleViewMode} title="Visualizar gráficos" className="btn-link">
              <Fi.FiPieChart size={24} />
            </button>
          )}
        </IconsContainer>
      </HeaderContainer>

      {viewMode === 'chart' ? (
        <div>
          <Chart data={atividades.summary} dataKey="totalTime" labelKey="label" />
        </div>
      ) : (
        <table>
          <thead>
            <tr>
              <th className="text-left">Atividades</th>
              <th className="text-md-right">Quantitativo (h / m / un)</th>
            </tr>
          </thead>

          <tbody>
            {atividades.summary.map((summary) => (
              <tr>
                <td className="text-md-left">{summary.atividade.descricao}</td>
                <td className="text-md-right">
                  {summary.atividade.tipo === 'produtiva'
                    ? summary.quantidade.toFixed(2).concat('m')
                    : summary.totalTime.toFixed(2).concat('h')}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  )
}

const container = document.querySelector('#react-producao-equipamentos')

if (container) {
  const atividades = JSON.parse(container.getAttribute('data-atividades') || '[]')

  ReactDOM.render(<ProducaoEquipamentos atividades={atividades} />, container)
}
