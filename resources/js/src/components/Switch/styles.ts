import styled from 'styled-components'

export const Container = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
`

export const Input = styled.input``

export const Button = styled.button`
  position: relative;
  width: 50px !important;
  height: 20px;
  background: var(--light) !important;
  display: block;
  border-radius: 10px;
  border: 1px solid #bbb4;

  ::after {
    content: '';
    position: absolute;
    width: 20px;
    top: 4px;
    left: 5px;
    height: 10px;
    background: #8fa7b2;

    display: block;
    border-radius: 10px;
    transition: left 0.2s;
  }

  :disabled::after {
    background: #d3dde2;
  }
`
