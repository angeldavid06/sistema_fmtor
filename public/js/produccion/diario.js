const data_aux = {
    dato: ""
}

const limpiar_tabla = () => {
    const body = document.getElementById('body')
    while (body.firstChild) {
        body.removeChild(body.firstChild)
    }
}

const obtener_registros_diarios = () => {
    limpiar_tabla()
    const respuesta = fetchAPI('',url+'/produccion/diario/obtener_registros_diarios?fecha='+fecha.value+'&estado='+select.value,'')
    respuesta.then(json => {
        render_registros_diarios(json)
    })
}

const select = document.getElementById('select_estado')
const fecha = document.getElementById('fecha_reporte')
const fecha_insert = document.getElementById('fecha')

const colocar_fecha = () => {
    const fecha_actual = new Date();
    const local = fecha_actual.toLocaleDateString();
    let aux = local.split("/")[2]

    if (parseInt(local.split("/")[1]) < 10){
        aux += "-0" + parseInt(local.split("/")[1]) + '-';
    } else{
        aux += parseInt(local.split("/")[1]) + '-';
    }

    if (parseInt(local.split("/")[0]) < 10) {
        aux += "0" + parseInt(local.split("/")[0]);
    } else {
        aux += parseInt(local.split("/")[0]);
    }
    fecha_insert.value = aux;
    fecha.value = aux;
}

select.addEventListener('change', () => {
    if (select.value != '' && fecha.value != '') {
        obtener_registros_diarios()
    }
})

fecha.addEventListener('change', () => {
    if (select.value != '' && fecha.value != '') {
        obtener_registros_diarios()
    }
})

const render_estados = (json) => {
    json.forEach(el => {
        if (el.estados != 'CANCELADO' && el.estados != 'TERMINADO') {
            select.innerHTML += '<option value="'+el.estados+'">'+el.estados+'</option>'
        }
    })
}

const obtener_estados = () => {
    const respuesta = fetchAPI('',url+'/produccion/control/estados','')
    respuesta.then(json => {
        render_estados(json)
    })
}

const eliminar_registro = () => {
    open_confirm('¿Estas seguro de eliminar este registro?', eliminar)
}

document.addEventListener('DOMContentLoaded', () => {
    obtener_estados()
    colocar_fecha()
})