import styled from 'styled-components'

export const HeaderContainer = styled.div`
  display: flex;
  justify-content: space-between;
  padding: 0.75rem 0;
  align-items: center;
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
