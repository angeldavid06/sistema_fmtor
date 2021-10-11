const btn_alert = document.getElementById('btn-alert')
const btn_confirm = document.getElementById('btn-confirm')

btn_alert.addEventListener('click', () => {
    open_alert('Título de prueba','Esta es una descripción de prueba')
})

function hola () {
    alert('Hola Mundo')
}

btn_confirm.addEventListener('click', () => {
    const titulo = '¿Estas seguro de realizar esta acción?'
    open_confirm(titulo, hola)
})