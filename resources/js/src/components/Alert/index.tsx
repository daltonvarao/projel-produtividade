import React, { useEffect, useState } from 'react'
import { Container } from './styles'

interface AlertProps {
  message: string
  duration: number
  type: 'success' | 'error'
}

export default class Alert {
  public static show({ message, duration, type }: AlertProps) {
    const [show, setShow] = useState(true)

    useEffect(() => {
      setTimeout(() => {
        setShow(false)
      }, duration)
    }, [])

    useEffect(() => {
      setShow(true)

      setTimeout(() => {
        setShow(false)
      }, duration)
    }, [message])

    if (!show || !message) {
      return null
    }

    return (
      <Container duration={duration} type={type}>
        {message}
      </Container>
    )
  }
}
