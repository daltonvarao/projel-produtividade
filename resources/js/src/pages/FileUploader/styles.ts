import styled from 'styled-components'
import colors from '../../styles/colors'

export const Container = styled.div`
  h4 {
    margin-bottom: 0.5rem;
    color: ${colors.primary};
  }
`

export const UploadContainer = styled.div`
  position: relative;
  height: 150px;
  margin-bottom: 1rem;
`

export const FileLabel = styled.label`
  padding: 1rem;
  border: 4px dashed rgba(0, 0, 0, 0.1);
  display: block;
  width: 100%;
  border-radius: 8px;
  color: rgba(0, 0, 0, 0.2);
  font-weight: bold;
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
`

export const PreviewContainer = styled.div`
  position: relative;
`

export const PreviewItem = styled.div`
  width: 100%;
  border-radius: 8px;
  display: grid;
  align-items: center;
  grid-template-columns: 1fr 7fr 4fr 1fr;
  gap: 0.5rem;
  padding: 1rem;
  border: 1px solid rgba(0, 0, 0, 0.1);
  color: #676767;
  font-size: 11px;

  :hover {
    background: rgba(0, 0, 0, 0.01);
  }

  button {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    padding: 0 !important;
  }

  @media screen and (min-width: 768px) {
    font-size: 14px;
  }
`

export const FileInput = styled.input.attrs(() => ({ type: 'file' }))`
  opacity: 0;
  position: absolute;
  height: 150px;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
`
