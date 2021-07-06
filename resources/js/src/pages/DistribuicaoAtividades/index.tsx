import React, { useEffect } from 'react'
import ReactDOM from 'react-dom'
import stc from 'string-to-color'

import {
  Pie,
  PieChart,
  Cell,
  Legend,
  Tooltip,
  Text,
  LabelList,
  ResponsiveContainer,
} from 'recharts'
import { Container, Row } from './styles'

interface BaseSummary {
  atividades: Array<{
    name: string
    totalTime: number
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
    <PieChart width={1000} height={450}>
      <Pie data={data} dataKey={dataKey} label>
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

const TotalTime: React.FC<{ totalTime: number }> = ({ totalTime }) => {
  return (
    <span>
      ({totalTime} {totalTime > 1 ? 'horas' : 'hora'})
    </span>
  )
}

const DistribuicaoAtividades: React.FC<DistribuicaoAtividadesProps> = ({ summary }) => {
  if (!summary) {
    return null
  }

  useEffect(() => {
    console.log(summary)
  }, [])

  return (
    <Container>
      {summary.totalTime > 0 && (
        <Row className="card">
          <h2>Distribuição de horas diarias - Tipos de Atividades</h2>
          <Chart data={summary.totalTimes} dataKey="value" labelKey="name" />
        </Row>
      )}

      {summary.produtivas.atividades.length > 0 && (
        <Row className="card">
          <h2>
            Distribuição de horas produtivas <TotalTime totalTime={summary.produtivas.totalTime} />
          </h2>

          <Chart data={summary.produtivas.atividades} dataKey="totalTime" labelKey="name" />
        </Row>
      )}

      {summary.improdutivas.atividades.length > 0 && (
        <Row className="card">
          <h2>
            Distribuição de horas improdutivas{' '}
            <TotalTime totalTime={summary.improdutivas.totalTime} />
          </h2>

          <Chart data={summary.improdutivas.atividades} dataKey="totalTime" labelKey="name" />
        </Row>
      )}

      {summary.paradas.atividades.length > 0 && (
        <Row className="card">
          <h2>
            Distribuição de horas paradas <TotalTime totalTime={summary.paradas.totalTime} />
          </h2>
          <Chart data={summary.paradas.atividades} dataKey="totalTime" labelKey="name" />
        </Row>
      )}
    </Container>
  )
}

const container = document.querySelector('#react-distribuicao-atividades')
if (container) {
  const summaryRaw = container.getAttribute('data-summary') || ''
  const summary = JSON.parse(summaryRaw)

  ReactDOM.render(<DistribuicaoAtividades summary={summary} />, container)
}
