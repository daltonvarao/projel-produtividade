import styled from 'styled-components'
import colors from '../../styles/colors'

export const Container = styled.div`
  width: 100%;
  position: relative;
`

export const InputContainer = styled.div`
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
`

export const ActionItem = styled.button`
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0 5px;
  color: ${(props) =>
    props.className?.includes('clear-selection') ? colors.error : 'rgba(32, 132, 255, 1)'};
  background: transparent;
  border-radius: 0;

  transform: ${(props) => (props.className?.includes('open') ? 'rotate(180deg)' : 'none')};
  transition: transform 0.2s linear;

  border-right: ${(props) =>
    props.className?.includes('clear-selection') ? '1px solid #bbb4' : 0};
`

export const ActionsContainer = styled.div`
  position: absolute;
  display: flex;
  align-items: center;
  right: 6px;
`

export const SelectInput = styled.input`
  width: 100%;
  font-size: 15px;
`

export const SelectList = styled.div`
  position: absolute;
  z-index: 500 !important;
  background: ${colors.white};
  margin-top: 0.5rem;
  /* width: 100%; */
  left: 0;
  right: 0;
  border: 1px solid rgba(204, 204, 204, 0.5);
  border-radius: 5px;
  box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.07);
  max-height: 250px;
  overflow-y: auto;
`

export const SelectItem = styled.div`
  padding: 0.5rem 0.75rem;
  font-size: 14px;

  background: ${(props) => (props.className?.includes('selected') ? 'rgba(32, 132, 255, 1)' : '')};
  color: ${(props) => (props.className?.includes('selected') ? '#fff' : '')};

  :hover {
    background: rgba(32, 132, 255, 0.2);
    cursor: pointer;
  }
`
