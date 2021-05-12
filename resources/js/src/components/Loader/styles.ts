import styled from 'styled-components'
import colors from '../../styles/colors'

export const Container = styled.div`
  margin: 1rem auto;
  display: flex;
  justify-content: center;
`

export const Spin = styled.div`
  width: 40px;
  height: 40px;
  border: 5px solid #f0f0fd;
  border-radius: 50%;
  border-left-color: ${colors.success};
  animation: spin 0.8s alternate infinite;

  @keyframes spin {
    from {
      transform: rotate(0deg);
    }

    to {
      transform: rotate(360deg);
    }
  }
`
