import styled from 'styled-components'
import colors from '../../styles/colors'

interface ContainerProps {
  type: 'error' | 'success'
  duration: number
}

export const Container = styled.div<ContainerProps>`
  position: fixed;
  top: 1rem;
  background: ${(props) => colors[props.type]};
  color: #fff;
  padding: 1rem;
  border-radius: 4px;
  z-index: 100;
  width: 300px;
  animation: slide 0.5s ease-in forwards,
    slide 0.5s ease-out ${(props) => props.duration - 500}ms reverse forwards;

  ::after {
    content: '';
    position: absolute;
    width: 100%;
    height: 5px;
    bottom: 0;
    left: 0;
    background: ${(props) => (props.type === 'error' ? colors.errorLight : colors.successLight)};
    border-bottom-left-radius: 4px;
    border-bottom-right-radius: 4px;
    animation: resize linear forwards;
    animation-duration: ${(props) => props.duration}ms;
  }

  @keyframes resize {
    from {
      width: 100%;
    }
    to {
      width: 0%;
    }
  }

  @keyframes slide {
    from {
      right: -300px;
    }

    to {
      right: 1rem;
    }
  }
`
