import styled from 'styled-components'

export const Container = styled.div``

export const Row = styled.div`
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
  padding: 2rem;
  max-width: 420px;
  height: fit-content;

  h3 {
    text-align: center;
  }
`

export const CardContainer = styled.div`
  display: flex;
  flex-direction: column;
  width: 100%;

  height: fit-content;
  margin: 0 auto;
  background: var(--white);
  border-radius: 8px;
  padding: 1rem;
  box-shadow: var(--card-shadow);
`
export const HeaderContainer = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  margin-bottom: 1.5rem;
`
export const IconsContainer = styled.div`
  display: flex;

  button {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  button:hover {
    cursor: pointer;
    opacity: 0.8;
  }
`
