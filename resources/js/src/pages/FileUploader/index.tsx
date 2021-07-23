import React, { createRef, useState } from 'react'
import ReactDOM from 'react-dom'
import { FaAndroid } from 'react-icons/fa'
import { FiX } from 'react-icons/fi'

import {
  Container,
  FileInput,
  FileLabel,
  PreviewContainer,
  PreviewItem,
  UploadContainer,
} from './styles'

const FileUploader: React.FC = () => {
  const [file, setFile] = useState<File>()
  const lastModifiedInputRef = createRef<HTMLInputElement>()
  const fileInputRef = createRef<HTMLInputElement>()

  function bytesToMb(bytes: number) {
    return (bytes / 1000000).toFixed(1)
  }

  function handleFileUpload(ev: React.ChangeEvent<HTMLInputElement>) {
    if (!ev.target.files) return
    if (!fileInputRef.current) return

    const [inputFile] = Array.from(ev.target.files)

    const [, ext] = inputFile.name.split('.')

    if (ext !== 'apk') {
      ev.target.value = ''
      return
    }

    setFile(inputFile)

    if (lastModifiedInputRef.current) {
      lastModifiedInputRef.current.value = String(inputFile.lastModified)
    }
  }

  function handleRemoveFile() {
    setFile(undefined)

    if (lastModifiedInputRef.current) {
      lastModifiedInputRef.current.value = ''
    }

    if (fileInputRef.current) {
      fileInputRef.current.value = ''
    }
  }

  return (
    <Container>
      <h4>Arquivo</h4>
      <UploadContainer hidden={Boolean(file)}>
        <FileLabel htmlFor="app">
          Clique ou solte um arquivo aqui para fazer upload. <br /> Apenas arquivos .apk são
          permitidos
        </FileLabel>
        <FileInput
          ref={fileInputRef}
          name="app"
          accept=".apk"
          onChange={handleFileUpload}
          id="app"
        />
        <input ref={lastModifiedInputRef} type="hidden" name="lastModified" />
      </UploadContainer>
      {file && (
        <PreviewContainer>
          <PreviewItem>
            <FaAndroid size={30} color="lightgreen" />
            <span>{file.name}</span>
            <span>{bytesToMb(file.size)} mb</span>
            <button onClick={handleRemoveFile} type="button">
              <FiX size={18} color="#df666e" />
            </button>
          </PreviewItem>
        </PreviewContainer>
      )}
    </Container>
  )
}

const container = document.querySelector('#react-file-uploader')

if (container) ReactDOM.render(<FileUploader />, container)
