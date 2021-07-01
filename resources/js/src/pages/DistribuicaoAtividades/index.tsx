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
import { Row } from './styles'

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
    <ResponsiveContainer width={1000} height={450}>
      <PieChart>
        <Pie
          data={data}
          dataKey={dataKey}
          labelLine={false}
          label={({ cx, cy, midAngle, innerRadius, outerRadius, percent, index }) => {
            const RADIAN = Math.PI / 180

            const radius = innerRadius + (outerRadius - innerRadius) * 0.5
            const x = cx + radius * Math.cos(-midAngle * RADIAN)
            const y = cy + radius * Math.sin(-midAngle * RADIAN)

            if (data[index][dataKey] < 1) {
              return null
            }

            return (
              <g>
                <text x={x} y={y} fill="white" textAnchor="middle" dominantBaseline="central">
                  {`${(percent * 100).toFixed(0)}%`}
                </text>
                <text x={x} y={y + 20} fill="white" textAnchor="middle" dominantBaseline="central">
                  {`${data[index][dataKey].toFixed(1)} ${
                    data[index][dataKey] > 1 ? 'horas' : 'hora'
                  } `}
                </text>
              </g>
            )
          }}
        >
          {data.map((_: any, index: number) => {
            return <Cell key={index} fill={colors[index]} />
          })}
        </Pie>
        <Legend layout="vertical" align="right" verticalAlign="middle" iconType="circle" />
        <Tooltip
          formatter={(value: number) => {
            if (value <= 1) {
              return String(value.toFixed(1)).concat(' hora')
            }
            return String(value.toFixed(1)).concat(' horas')
          }}
        />
      </PieChart>
    </ResponsiveContainer>
  )
}

const DistribuicaoAtividades: React.FC<DistribuicaoAtividadesProps> = ({ summary }) => {
  if (!summary) {
    return null
  }

  useEffect(() => {
    console.log(summary)
  }, [summary])

  return (
    <div className="card" style={{ padding: '2rem' }}>
      <Row>
        <h2>Distribuição de horas diarias - Tipos de Atividades</h2>
        <Chart data={summary.totalTimes} dataKey="value" labelKey="name" />
      </Row>
      {summary.produtivas.atividades.length > 0 && (
        <Row>
          <h2>Distribuição de horas diarias - Produtivas</h2>

          <Chart data={summary.produtivas.atividades} dataKey="totalTime" labelKey="name" />
        </Row>
      )}
      {summary.improdutivas.atividades.length > 0 && (
        <Row>
          <h2>Distribuição de horas diarias - Improdutivas</h2>

          <Chart data={summary.improdutivas.atividades} dataKey="totalTime" labelKey="name" />
        </Row>
      )}

      {summary.paradas.atividades.length > 0 && (
        <Row>
          <h2>Distribuição de horas diarias - Paradas</h2>
          <Chart data={summary.paradas.atividades} dataKey="totalTime" labelKey="name" />
        </Row>
      )}
    </div>
  )
}

const container = document.querySelector('#react-distribuicao-atividades')
if (container) {
  const summaryRaw = container.getAttribute('data-summary') || ''
  const summary = JSON.parse(summaryRaw)

  ReactDOM.render(<DistribuicaoAtividades summary={summary} />, container)
}
