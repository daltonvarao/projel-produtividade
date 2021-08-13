// active link
const navigationLinks = document.querySelectorAll('.navigation a')

if (navigationLinks) {
  navigationLinks.forEach((link) => {
    const linkHref = link.getAttribute('href')

    if (location.pathname.includes(linkHref)) {
      link.classList.add('active')
    }
  })
}

// active areas card-link
const areasLinks = document.querySelectorAll('.card-link')
if (areasLinks) {
  areasLinks.forEach((link) => {
    const linkHref = link.getAttribute('href')

    if (location.pathname.includes(linkHref)) {
      link.classList.add('active')
    }
  })
}

const showMenu = document.querySelector('.show-menu')
const sidebar = document.querySelector('.sidebar')

if (showMenu) {
  showMenu.addEventListener('click', function () {
    sidebar.classList.add('show')
  })
}

const closeMenu = document.querySelector('.close-menu')
if (closeMenu) {
  closeMenu.addEventListener('click', function () {
    sidebar.classList.remove('show')
  })
}

// confirms if client actually wants to remove item
const deleteForms = document.querySelectorAll('.delete-form')

if (deleteForms) {
  deleteForms.forEach((deleteForm) => {
    const deleteButton = deleteForm.querySelector('button')

    deleteButton.addEventListener('click', function () {
      if (window.confirm('Você deseja realmente apagar este item?')) {
        deleteForm.submit()
      }
    })
  })
}

const showMoneyMasks = document.querySelectorAll('.show-money-mask')

showMoneyMasks.forEach((el) => {
  el.innerHTML = Number(el.innerHTML).toLocaleString('pt-BR', {
    currency: 'BRL',
    style: 'currency',
  })
})

/* MODAL */

const showModals = document.querySelectorAll('.show-modal')

showModals.forEach((showModal) => {
  const modalId = showModal.getAttribute('data-target')
  const modal = document.getElementById(modalId)
  const closeModals = document.querySelectorAll('.close-modal')

  closeModals.forEach((closeModal) => {
    closeModal.addEventListener('click', function () {
      modal.classList.remove('show-modal')
      document.body.classList.remove('modal-open')
    })
  })

  showModal.addEventListener('click', function () {
    modal.classList.add('show-modal')
    document.body.classList.add('modal-open')
  })

  window.addEventListener('click', function (ev) {
    if (!document.body.className.includes('modal-open')) return
    if (!ev.target.className.includes) return

    if (ev.target.className.includes('modal-container')) {
      modal.classList.remove('show-modal')
      document.body.classList.remove('modal-open')
    }
  })
})

// add mask in cpf fields
export function cpf(cpfNumber) {
  let newcpf = cpfUnmask(cpfNumber)

  if (newcpf.length > 9 && newcpf.length <= 11) {
    newcpf = newcpf.replace(/(\d{3})(\d{3})(\d{3})(\d)/, '$1.$2.$3-$4')
  }

  if (newcpf.length > 6 && newcpf.length <= 9) {
    newcpf = newcpf.replace(/(\d{3})(\d{3})(\d)/, '$1.$2.$3')
  }

  if (newcpf.length <= 6) {
    newcpf = newcpf.replace(/(\d{3})(\d)/, '$1.$2')
  }

  return newcpf
}

export function cpfUnmask(cpfNumber) {
  let newcpf = cpfNumber.replace(/\D/g, '')

  return newcpf
}

const cpfField = document.querySelector('#cpf')

if (cpfField) {
  cpfField.value = cpf(cpfField.value)

  cpfField.addEventListener('input', function (ev) {
    this.value = cpf(ev.target.value)
  })
}

// tooltips
const tooltipTriggers = document.querySelectorAll('[data-tooltip]')

if (tooltipTriggers) {
  tooltipTriggers.forEach((trigger) => {
    const tooltip = document.createElement('span')
    tooltip.style.opacity = '0'
    tooltip.classList.add('tooltip')

    const tooltipData = trigger.getAttribute('data-tooltip')
    const tooltipPlace = trigger.getAttribute('data-tooltip-place')

    trigger.onmouseover = () => {
      trigger.classList.add('relative')
      tooltip.innerHTML = tooltipData
      trigger.appendChild(tooltip)

      switch (tooltipPlace) {
        case 'top':
          tooltip.style.top = `${-tooltip.clientHeight - 7}px`
          tooltip.style.left = `${trigger.clientWidth / 2 - tooltip.clientWidth / 2}px`
          tooltip.classList.add('top')
          break
        case 'bottom':
          tooltip.style.bottom = `${-tooltip.clientHeight - 7}px`
          tooltip.style.left = `${trigger.clientWidth / 2 - tooltip.clientWidth / 2}px`
          tooltip.classList.add('bottom')
          break
        case 'right':
          tooltip.classList.add('right')
          tooltip.style.top = `${trigger.clientHeight / 2 - tooltip.clientHeight / 2}px`
          tooltip.style.right = `${-tooltip.clientWidth - 7}px`
          break
        case 'left':
        default:
          tooltip.classList.add('left')
          tooltip.style.top = `${trigger.clientHeight / 2 - tooltip.clientHeight / 2}px`
          tooltip.style.left = `${-tooltip.clientWidth - 7}px`
          break
      }

      tooltip.style.opacity = '1'
    }

    trigger.onmouseleave = () => {
      trigger.removeChild(tooltip)
      trigger.classList.remove('relative')
    }
  })
}

// Dropdown
const dropdownTriggers = document.querySelectorAll('[data-toggle]')

if (dropdownTriggers) {
  dropdownTriggers.forEach((trigger) => {
    if (trigger.getAttribute('data-toggle') !== 'dropdown') return

    const target = document.getElementById(trigger.getAttribute('data-target'))

    trigger.addEventListener('click', () => {
      target.classList.toggle('show')
    })
  })
}

// Data confirm
const confirmTriggers = document.querySelectorAll('[data-confirm]')

if (confirmTriggers) {
  confirmTriggers.forEach((trigger) => {
    trigger.addEventListener('click', function (ev) {
      ev.preventDefault()

      if (!confirm(trigger.getAttribute('data-confirm'))) return

      trigger.submit()
    })
  })
}

// const printButton = document.getElementById('print_report')
// const table = document.querySelector('.data-table')

// if (printButton) {
//   printButton.addEventListener('click', function () {
//     const winPrint = window.open('', '_blank', '')

//     winPrint.document.head.appendChild(document.querySelector('head').cloneNode(true))
//     winPrint.document.body.appendChild(table.cloneNode(true))
//     winPrint.document.close()

//     winPrint.focus()
//     winPrint.print()

//     setTimeout(() => {
//       winPrint.close()
//     }, 1)
//   })
// }
