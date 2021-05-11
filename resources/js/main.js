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

// SWITCH2

// const switchs = document.querySelectorAll('.switch2')
// if (switchs) {
//   switchs.forEach((ss) => {
//     const btn = ss.querySelector('button')
//     const inp = ss.querySelector('input')

//     inp.onchange = function (ev) {
//       console.log(ev)
//     }

//     btn.addEventListener('click', function () {
//       inp.value = inp.value === 'false' ? 'true' : 'false'
//     })
//   })
// }
