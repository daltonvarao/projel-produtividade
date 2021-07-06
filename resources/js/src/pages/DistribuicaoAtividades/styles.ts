import styled from 'styled-components'

export const Container = styled.div`
  div.card + div.card {
    margin-top: 1rem;
  }
`

export const Row = styled.div`
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
  padding: 2rem;
`
