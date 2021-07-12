import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import stc from 'string-to-color'
import { Pie, PieChart, Cell, Legend, Tooltip } from 'recharts'
import * as Fi from 'react-icons/fi'

import { CardContainer, Container, HeaderContainer, IconsContainer, Row } from './styles'

interface Atividade {
  descricao: string
  tipo: string
  unidade_medida: string
}

interface BaseSummary {
  atividades: Array<{
    name: string
    totalTime: number
    quantidade: number
    atividade: Atividade
  }>
  totalTime: number
}

interface Summary {
  produtivas: BaseSummary
  improdutivas: BaseSummary
  paradas: BaseSummary
  totalTime: number
  totalTimes: Array<{
    name: string
    value: number
  }>
}

interface DistribuicaoAtividadesProps {
  summary?: Summary
}

interface ChartProps {
  data: any[]
  dataKey: string
  labelKey: string
}

const Chart: React.FC<ChartProps> = ({ data, dataKey, labelKey }) => {
  const colors = data.map((entry: any) => stc(entry[labelKey]))

  return (
    <PieChart width={600} height={450}>
      <Pie data={data} dataKey={dataKey} label innerRadius="55%">
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

const Card: React.FC<{ data: BaseSummary; title: string }> = ({ data, title }) => {
  const [viewMode, setViewMode] = useState<'chart' | 'list'>('list')

  function toggleViewMode() {
    setViewMode((state) => (state === 'chart' ? 'list' : 'chart'))
  }

  if (!data.atividades.length) return null

  return (
    <CardContainer>
      <HeaderContainer>
        <h2>
          {title} {viewMode === 'chart' && ' - Total: ' + String(data.totalTime).concat(' horas')}
        </h2>
        <IconsContainer>
          {viewMode === 'chart' ? (
            <button onClick={toggleViewMode} title="Visualizar lista" className="btn-link">
              <Fi.FiList size={24} />
            </button>
          ) : (
            <button onClick={toggleViewMode} title="Visualizar gráfico" className="btn-link">
              <Fi.FiPieChart size={24} />
            </button>
          )}
        </IconsContainer>
      </HeaderContainer>

      {viewMode === 'chart' ? (
        <div>
          <Chart data={data.atividades} dataKey="totalTime" labelKey="name" />
        </div>
      ) : (
        <table className="table">
          <thead>
            <tr>
              <th className="text-left">Atividades</th>
              <th className="text-md-right">Tempo total</th>
              <th className="text-md-right">Quantitativo (m / un)</th>
            </tr>
          </thead>

          <tbody>
            {data.atividades.map((atividade) => (
              <tr>
                <td className="text-md-left">{atividade.name}</td>
                <td className="text-md-right">{atividade.totalTime.toFixed(2).concat('h')}</td>
                <td className="text-md-right">
                  {atividade.atividade.tipo === 'produtiva'
                    ? atividade.atividade.unidade_medida === 'metros'
                      ? atividade.quantidade.toFixed(2).concat('m')
                      : String(atividade.quantidade).concat(' un')
                    : '-'}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </CardContainer>
  )
}

const DistribuicaoAtividades: React.FC<DistribuicaoAtividadesProps> = ({ summary }) => {
  if (!summary) {
    return null
  }

  return (
    <Container>
      {summary.totalTime > 0 && (
        <Row className="card">
          <h2>Distribuição de horas diarias - Tipos de Atividades</h2>
          <Chart data={summary.totalTimes} dataKey="value" labelKey="name" />
        </Row>
      )}

      <Card title="Distribuição de horas produtivas" data={summary.produtivas} />
      <Card title="Distribuição de horas improdutivas" data={summary.improdutivas} />
      <Card title="Distribuição de horas paradas" data={summary.paradas} />
    </Container>
  )
}

const container = document.querySelector('#react-distribuicao-atividades')
if (container) {
  const summaryRaw = container.getAttribute('data-summary') || ''
  const summary = JSON.parse(summaryRaw)

  ReactDOM.render(<DistribuicaoAtividades summary={summary} />, container)
}
