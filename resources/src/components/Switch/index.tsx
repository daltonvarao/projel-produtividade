import React from 'react'

import { Container, Input, Button } from './styles'

interface SwitchProps {
  name?: string
  id?: string
  value: boolean
  disabled?: boolean
  onChange: (value: boolean) => void
}

const Switch: React.FC<SwitchProps> = ({ disabled = false, name, id, value, onChange }) => {
  return (
    <Container>
      <Input type="hidden" name={name} id={id} value={Number(value)} />
      <Button
        onClick={() => onChange(!value)}
        className={value && !disabled ? 'checked' : ''}
        disabled={disabled}
        type="button"
      />
    </Container>
  )
}

export default Switch
