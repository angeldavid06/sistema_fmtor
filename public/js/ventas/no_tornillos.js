const cantidad = document.getElementById('Cantidad_Tornillos');
const cantidad = document.getElementById('tornillos');

cantidad.addEventListener('keyup', () => {
    if (cantidad.value <= 0) {
        open_alert('Es necesario incluir por lo menos un tornillo','naranja')
        cantidad.value = 1
    } else {
        
    }
})