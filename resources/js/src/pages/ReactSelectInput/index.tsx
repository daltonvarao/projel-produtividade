import React from 'react'
import ReactDOM from 'react-dom'
import ReactSelectInput from '../../components/ReactSelectInput'

const containers = document.querySelectorAll('.react-select-input')

containers.forEach((container) => {
  const collectionRaw = unescape(container.getAttribute('collection') || '')
  const collection = JSON.parse(collectionRaw || '[]')

  const labelKey = container.getAttribute('labelkey') || ''
  const valueKey = container.getAttribute('valuekey') || ''
  const name = container.getAttribute('name') || ''
  const placeholder = container.getAttribute('placeholder') || ''
  const required = container.getAttribute('required') || ''
  const inputid = container.getAttribute('inputid') || ''
  const value = container.getAttribute('value') || ''

  ReactDOM.render(
    <ReactSelectInput
      collection={collection}
      labelKey={labelKey}
      valueKey={valueKey}
      defaultValue={value}
      required={Boolean(required)}
      placeholder={placeholder}
      name={name}
      inputId={inputid}
      onChange={() => {}}
    />,
    container
  )
})
