import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import stc from 'string-to-color'
import * as Fi from 'react-icons/fi'

import { CardContainer, Container, HeaderContainer, IconsContainer, Row } from './styles'
import { Doughnut } from 'react-chartjs-2'
import ChartDataLabels from 'chartjs-plugin-datalabels'

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

interface ProducaoEquipamentosProps {
  summary?: Summary
}

const Card: React.FC<{ data: BaseSummary; title: string; showQuantitativo?: boolean }> = ({
  data,
  title,
  showQuantitativo = false,
}) => {
  const [viewMode, setViewMode] = useState<'chart' | 'list'>('list')

  function toggleViewMode() {
    setViewMode((state) => (state === 'chart' ? 'list' : 'chart'))
  }

  if (!data.atividades.length) return null

  return (
    <CardContainer>
      <HeaderContainer>
        <h3>
          {title} {viewMode === 'chart' && ' - Total: ' + String(data.totalTime).concat(' horas')}
        </h3>
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
          <DoughnutChart
            data={data.atividades.map(({ name, totalTime }) => ({ label: name, value: totalTime }))}
          />
        </div>
      ) : (
        <table className="table">
          <thead>
            <tr>
              <th className="text-left">Atividades</th>
              <th className="text-md-right">Tempo total</th>
              {showQuantitativo && <th className="text-md-right">Quantitativo</th>}
              {showQuantitativo && <th className="text-md-right">Quantitativo médio por hora</th>}
            </tr>
          </thead>

          <tbody>
            {data.atividades.map((atividade) => (
              <tr key={atividade.atividade.descricao}>
                <td className="text-md-left">{atividade.name}</td>
                <td className="text-md-right">{atividade.totalTime.toFixed(2).concat('h')}</td>
                {showQuantitativo && (
                  <td className="text-md-right">
                    {atividade.atividade.tipo === 'produtiva'
                      ? atividade.atividade.unidade_medida === 'metros'
                        ? atividade.quantidade.toFixed(2).concat('m')
                        : String(atividade.quantidade).concat(' un')
                      : '-'}
                  </td>
                )}
                {showQuantitativo && (
                  <td className="text-md-right">
                    {(atividade.quantidade / atividade.totalTime).toFixed(2)}
                    {atividade.atividade.unidade_medida === 'metros' ? ' m/h' : ' un/h'}
                  </td>
                )}
              </tr>
            ))}
            <tr>
              <td className="text-md-left text-bold text-primary">Total</td>
              <td className="text-md-right">{data.totalTime}</td>
              {showQuantitativo && (
                <React.Fragment>
                  <td className="text-md-right"> - </td>
                  <td className="text-md-right"> - </td>
                </React.Fragment>
              )}
            </tr>
          </tbody>
        </table>
      )}
    </CardContainer>
  )
}

interface DoughnutProps {
  data: { label: string; value: number | string }[]
}

const DoughnutChart: React.FC<DoughnutProps> = ({ data }) => {
  const labels = data.map(({ label }) => label)
  const values = data.map(({ value }) => value)
  const bgColors = labels.map((label) => stc(label).concat('4e'))
  const bdColors = labels.map((label) => stc(label))

  return (
    <Doughnut
      width={450}
      data={{
        datasets: [
          {
            data: values,
            backgroundColor: bgColors,
            borderColor: bdColors,
            borderWidth: 1,
            datalabels: {
              anchor: 'center',
              color: bdColors,
              font: {
                weight: 'bold',
                size: 14,
                family: 'Poppins',
              },
              formatter: (value) => {
                return `${value}h`
              },
            },
          },
        ],
        labels: labels,
      }}
      options={{
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              textAlign: 'left',
            },
          },
        },
      }}
      plugins={[ChartDataLabels]}
    />
  )
}

const ProducaoEquipamentos: React.FC<ProducaoEquipamentosProps> = ({ summary }) => {
  if (!summary) {
    return null
  }

  return (
    <Container>
      <div
        style={{
          display: 'flex',
          gap: '1rem',
        }}
      >
        <Row className="card">
          <h3>Distribuição de horas diárias</h3>

          <DoughnutChart
            data={summary.totalTimes.map(({ name, value }) => ({ label: name, value }))}
          />
        </Row>

        <Card title="Horas produtivas" showQuantitativo data={summary.produtivas} />
      </div>
      <div
        style={{
          display: 'flex',
          gap: '1rem',
          marginTop: '1rem',
        }}
      >
        <Card title="Horas paradas" data={summary.paradas} />
        <Card title="Horas improdutivas" data={summary.improdutivas} />
      </div>
    </Container>
  )
}

const container = document.querySelector('#react-producao-equipamentos')
if (container) {
  const summaryRaw = unescape(container.getAttribute('data-summary') || '')
  const summary = JSON.parse(summaryRaw || '[]')

  ReactDOM.render(<ProducaoEquipamentos summary={summary} />, container)
}
