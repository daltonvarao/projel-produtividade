import React from 'react'

interface SelectProps {
  data: any[]
  valueKey: string
  labelKey: string
  placeholder: string
  selected: string | number
  name?: string
  onChange: (ev: React.ChangeEvent<HTMLSelectElement>) => void
}

const Select: React.FC<SelectProps> = ({
  data,
  labelKey,
  valueKey,
  selected,
  placeholder,
  name,
  onChange,
}) => {
  return (
    <select value={selected} name={name} onChange={onChange}>
      <option defaultChecked>{placeholder || 'Selecione...'}</option>

      {data.map((option, index) => (
        <option key={index} value={option[valueKey]}>
          {option[labelKey]}
        </option>
      ))}
    </select>
  )
}

export default Select
