import styled from 'styled-components'

export const Container = styled.div``

export const Row = styled.div`
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
  padding: 2rem;
`

export const CardContainer = styled.div`
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;

  margin: 0 auto;
  margin-top: 1rem;
  background: var(--white);
  border-radius: 8px;
  padding: 2rem 2rem;
  /* box-shadow: 0 0 35px 0 var(--shadow-color); */
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
