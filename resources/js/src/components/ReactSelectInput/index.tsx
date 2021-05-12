import React, { useEffect, useState } from 'react'
import * as Feather from 'react-icons/fi'

import {
  Container,
  SelectInput,
  InputContainer,
  SelectItem,
  SelectList,
  ActionsContainer,
  ActionItem,
} from './styles'
import Loader from '../Loader'

interface ReactSelectInputProps {
  collection: any[]
  labelKey: string
  valueKey: string
  value?: any
  name?: string
  placeholder?: string
  disabled?: boolean
  defaultValue?: string
  readOnly?: boolean
  required?: boolean
  inputId?: string
  onChange: (value: any) => void
}

const ReactSelectInput: React.FC<ReactSelectInputProps> = ({
  collection,
  labelKey,
  value,
  valueKey,
  name,
  readOnly,
  disabled,
  placeholder,
  required,
  defaultValue,
  inputId,
  onChange,
}) => {
  const [isFocused, setIsFocused] = useState(false)
  const [listCollection, setListCollection] = useState<any[]>()
  const [inputValue, setInputValue] = useState('')
  const [hiddenValue, setHiddenValue] = useState('')
  const [isFiltering, setIsFiltering] = useState(false)

  useEffect(() => {
    let newCollection = Object.values(collection)

    if (isFiltering) {
      newCollection = newCollection.filter((item) =>
        item[labelKey].toLowerCase().includes(inputValue.toLowerCase())
      )
    }

    setListCollection(newCollection)
  }, [collection, inputValue, isFiltering])

  useEffect(() => {
    setInputValue(value ? value[labelKey] : '')
  }, [value])

  useEffect(() => {
    if (collection && defaultValue) {
      setHiddenValue(defaultValue ?? '')

      const selected = collection.filter((item) => {
        return item[valueKey] === Number(defaultValue)
      })

      if (selected.length) {
        setInputValue(selected[0][labelKey])
      }
    }
  }, [defaultValue, collection])

  useEffect(() => {
    window.addEventListener('click', function (ev) {
      const target = ev.target as Element
      if (!target.className.includes) return

      if (isFocused) {
        if (!target.className.includes('focusable-item')) {
          setIsFocused(false)
        }
      }
    })
  }, [isFocused])

  if (!listCollection) {
    return <Loader />
  }

  function handleClear() {
    setInputValue('')
    setHiddenValue('')
    onChange('')
  }

  function openSelector() {
    setIsFocused(true)
  }

  function closeSelector() {
    setIsFocused(false)
  }

  return (
    <Container>
      <InputContainer>
        <input type="hidden" name={name} value={hiddenValue} />
        <SelectInput
          id={inputId}
          readOnly={readOnly}
          disabled={disabled}
          onFocus={() => setIsFocused(true)}
          placeholder={placeholder || 'Selecione um item'}
          value={inputValue}
          onChange={(ev) => {
            setIsFiltering(true)
            setInputValue(ev.target.value)
          }}
          className="focusable-item"
          required={required}
          autoComplete="off"
          autoCapitalize="off"
          autoCorrect="off"
        />
        <ActionsContainer>
          <ActionItem
            title="Limpar seleção"
            className="clear-selection"
            onClick={handleClear}
            type="button"
          >
            <Feather.FiX size={20} />
          </ActionItem>

          <ActionItem
            className={`focus-list ${isFocused ? 'open' : ''}`}
            onClick={isFocused ? closeSelector : openSelector}
            title={isFocused ? 'Ocultar opções' : 'Mostrar opções'}
            type="button"
          >
            <Feather.FiChevronDown size={21} />
          </ActionItem>
        </ActionsContainer>
      </InputContainer>

      {isFocused && (
        <SelectList>
          {listCollection.map((item) => {
            return (
              <SelectItem
                onClick={() => {
                  onChange(item)
                  setInputValue(item[labelKey])
                  setHiddenValue(item[valueKey])
                  setIsFocused(false)
                  setIsFiltering(false)
                }}
                className={`focusable-item ${
                  value
                    ? value[valueKey] === item[valueKey]
                      ? 'selected'
                      : ''
                    : Number(defaultValue) === item[valueKey]
                    ? 'selected'
                    : ''
                }`}
                key={item[valueKey]}
              >
                {item[labelKey]}
              </SelectItem>
            )
          })}
        </SelectList>
      )}
    </Container>
  )
}

export default ReactSelectInput
