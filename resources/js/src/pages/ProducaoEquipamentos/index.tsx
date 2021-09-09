import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import * as Fi from 'react-icons/fi'

import { CardContainer, Container, HeaderContainer, IconsContainer, Row, Col } from './styles'

import { Chart } from 'react-google-charts'
import Loader from '../../components/Loader'

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
          <DonutChart
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

interface DonutProps {
  data: { label: string; value: number | string }[]
}

const DonutChart: React.FC<DonutProps> = ({ data }) => {
  const dataChart = data.map(({ label, value }) => [String(label), value])

  return (
    <Chart
      chartType="PieChart"
      loader={<Loader />}
      data={[['Atividade', 'Total de horas'], ...dataChart]}
      options={{
        height: 400,
        legend: {
          position: 'bottom',
          alignment: 'center',
        },
        pieSliceText: 'value',
        pieHole: 0.6,
        chartArea: {
          width: 350,
          top: 10,
          left: 10,
          right: 10,
          bottom: 50,
        },
      }}
    />
  )
}

const ProducaoEquipamentos: React.FC<ProducaoEquipamentosProps> = ({ summary }) => {
  if (!summary) {
    return null
  }

  return (
    <Container>
      <Row>
        <Col className="card">
          <h3>Distribuição de horas diárias</h3>

          <DonutChart
            data={summary.totalTimes.map(({ name, value }) => ({ label: name, value }))}
          />
        </Col>

        <Card title="Horas produtivas" showQuantitativo data={summary.produtivas} />
      </Row>
      <Row>
        <Card title="Horas paradas" data={summary.paradas} />
        <Card title="Horas improdutivas" data={summary.improdutivas} />
      </Row>
    </Container>
  )
}

const container = document.querySelector('#react-producao-equipamentos')
if (container) {
  const summaryRaw = unescape(container.getAttribute('data-summary') || '')
  const summary = JSON.parse(summaryRaw || '[]')

  ReactDOM.render(<ProducaoEquipamentos summary={summary} />, container)
}
