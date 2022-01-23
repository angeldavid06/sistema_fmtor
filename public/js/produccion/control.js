const data_aux = {
    dato: ""
}

const quitar_clase = (form) => {
    const inputs = form.getElementsByClassName('input-error');
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].classList.remove('input-error');
    }
}

const generar_control_produccion = (valor) => {
    if (valor != '') {
        printPage(url+'/produccion/control/pdf_control?valor='+valor);
        op_control.classList.remove('input-error')
    } else {
        open_alert('No ha introducido la Orden de Producción','naranja')
        op_control.classList.add('input-error')
    }
}

const generar_control_vacio = (valor) => {
    if (valor != '') {
        printPage(url+'/produccion/control/pdf_control_vacio?valor='+valor);
        op_control.classList.remove('input-error')
    } else {
        open_alert('No ha introducido la Orden de Producción','naranja')
        op_control.classList.add('input-error')
    }
}

const obtener_estados = () => {
    const respuesta = fetchAPI('',url+'/produccion/control/estados','')
    respuesta.then(json => {
        render_botones_estados(json)
    })
}

const generar_reporte_diario = (fecha,turno,estado) => {
    printPage(url+'/produccion/control/pdf_reporte_diario?fecha='+fecha+'&turno='+turno+'&estado='+estado);
}

document.addEventListener('DOMContentLoaded', () => {
    obtener_estados()
})

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.opcion) {
        if (evt.target.dataset.eliminar) {
            data_aux.dato = evt.target.dataset.eliminar
            eliminar_registro()
        } else if (evt.target.dataset.edit) {
            obtener_registro(evt.target.dataset.edit)
        }
    } else if (evt.target.dataset.impresion) {
        if (evt.target.dataset.impresion == 'control') {
            generar_control_produccion(document.getElementById('op_control').value)
        } else if (evt.target.dataset.impresion == 'control_vacio') {
            generar_control_vacio(document.getElementById('op_control').value)
        }
    } else if (evt.target.dataset.terminar) {
        const input = document.getElementById('op_control');
        if (input.value != '') {
            terminar_orden(input.value);
            op_control.classList.remove('input-error')
        } else {
            open_alert('No ha introducido la Orden de Producción','rojo')
            op_control.classList.add('input-error')
        }
    }
})