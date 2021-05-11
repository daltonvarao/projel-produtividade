import styled from 'styled-components'
import colors from '../../styles/colors'

export const Container = styled.div`
  h2 {
    margin-bottom: 1rem;
  }
`

export const InfoCard = styled.div`
  padding: 2rem;
  box-shadow: 0 0 15px 0 rgba(154, 161, 171, 0.15);
  background: #fff;

  border-radius: 8px;
  margin-bottom: 1rem;

  h5 {
    color: ${colors.primary};
  }

  h4 {
    color: ${colors.dark};
  }
`

export const CardContent = styled.div`
  display: flex;
  justify-content: space-between;
`

export const TableCard = styled.div`
  padding: 2rem;
  box-shadow: 0 0 15px 0 rgba(154, 161, 171, 0.15);
  background: #fff;
  border-radius: 8px;

  h3 {
    margin-bottom: 2rem;
  }
`

export const TableContainer = styled.div`
  overflow-x: scroll;
  overflow-y: scroll;
  max-height: 65vh;

  ::-webkit-scrollbar {
    width: 5px;
    height: 5px;
  }

  ::-webkit-scrollbar-track {
    background: #f1f1f1;
  }

  ::-webkit-scrollbar-thumb {
    background: ${colors.success};
  }

  ::-webkit-scrollbar-thumb:hover {
    background: ${colors.successLight};
  }
`

export const Table = styled.table`
  border-spacing: 0;
  position: relative;

  tr {
    height: 50px;
  }

  tr:hover {
    background: rgba(0, 0, 0, 0.04);
  }

  td {
    text-align: center;
    width: 100px;
    border-top: 1px solid #bbb4;
    padding: 0.5rem;
    border-right: 1px solid #bbb4;
  }

  tr:first-child td {
    border-top: 0;
  }

  thead th {
    position: sticky;
    top: 0;
    z-index: 25;
    padding: 0 0.25rem;
    background: #fff;
    border-bottom: 1px solid #bbb4;
    border-right: 1px solid #bbb4;
  }

  thead th:first-child {
    position: sticky;
    top: 0;
    left: 0;
    border-right: 1px solid #bbb4;
    z-index: 30;
  }

  tbody th {
    border-top: 1px solid #bbb4;
    padding: 0.25rem 0.5rem;
    border-right: 1px solid #bbb4;
    position: sticky;
    left: 0;
    z-index: 20;
    background: #fff;
    max-width: 120px;
  }

  tbody tr:first-child th {
    border-top: 0;
  }

  th {
    font-size: 12px;
    color: ${colors.primary};
  }
`

export const Input = styled.input`
  width: 75px;
`
export const SaveButton = styled.button`
  margin-top: 1rem;
  background: ${colors.success};
  color: #fff;
`
