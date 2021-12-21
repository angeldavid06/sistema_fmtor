const form_control = document.getElementById('form-control');
const form_actualizar = document.getElementById('form-control-actualizar');
const data_aux = {
    dato: ""
}

const quitar_clase = (form) => {
    const inputs = form.getElementsByClassName('input-error');
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].classList.remove('input-error');
    }
}

form_control.addEventListener('submit', (evt)=> {
    evt.preventDefault();
    let aux = true;
    quitar_clase(form_control);
    const inputs = form_control.getElementsByClassName('input')
    try {
        for (let i = 0; i < inputs.length; i++) {
            if (inputs[i].value == '') {
                inputs[i].classList.add('input-error');
                aux = false;
            } 
        }
        if (aux) {
            registrar_control()
        } else {
            open_alert('Debes llenar los campos correctamente','rojo')
        }
    } catch (error) {
        open_alert('Debes seleccionar alguna etapa antes de enviar el formulario','rojo')
    }
});

form_actualizar.addEventListener('submit', (evt) => {
    evt.preventDefault()
    let aux = true;
    quitar_clase(form_actualizar);
    const inputs = form_actualizar.getElementsByClassName('input')
    try {
        for (let i = 0; i < inputs.length; i++) {
            if (inputs[i].value == '') {
                inputs[i].classList.add('input-error');
                aux = false;
            } 
        }
        if (aux) {
            actualizar_registro()
        } else {
            open_alert('Debes llenar los campos correctamente','rojo')
        }
    } catch (error) {
        open_alert('Debes seleccionar alguna etapa antes de enviar el formulario','rojo')
    }
})

const btn_form_control = document.getElementById('btn-form-control');

btn_form_control.addEventListener('click', () => {
    const estado = document.getElementsByClassName('active')
    const op_control = document.getElementById('op_control')
    
    const op = document.getElementById('op')
    const input = document.getElementById('estado')
    
    op.value = op_control.value
    input.value = estado[0].dataset.id
});

const registrar_control = () => {
    const respuesta = fetchAPI(form_control,url+'/produccion/control/insertar','POST')
    respuesta.then(json => {
        if (json == '1') {
            open_alert('Registro añadido correctamente', 'verde')
            const estado = document.getElementsByClassName('active')
            obtener_control(estado[0].dataset.estado)
        } else {
            open_alert('Registro no exitoso','rojo')
        }
    })
}

function eliminar () {
    const respuesta = fetchAPI('',url+'/produccion/control/eliminar?dato='+data_aux.dato,'')
    respuesta.then(json => {
        if (json == 1) {
            const estado = document.getElementsByClassName('active')
            obtener_control(estado[0].dataset.estado)
            open_alert('Registro eliminado correctamente','verde')
        } else {
            open_alert('Ocurrio un error al intentar realizar la consulta','rojo')
        }
    })
}

const eliminar_registro = () => {
    open_confirm('¿Estas seguro de realizar esta opción?', eliminar)
}

const cargar_registro = (json) => {
    const estado = document.getElementById('a_estado')
    const op = document.getElementById('a_op')
    const no_maquina = document.getElementById('a_no_maquina')
    const no_botes = document.getElementById('a_no_botes')
    const fecha = document.getElementById('a_fecha')
    const pzas = document.getElementById('a_pzas')
    const kg = document.getElementById('a_kg')
    const turno = document.getElementById('a_turno')
    const observaciones = document.getElementById('a_observaciones')

    json.forEach(el => {
        estado.value = el.id_estados_1
        op.value = el.id_registro_diario
        no_maquina.value = el.no_maquina
        fecha.value = el.fecha.split(' ')[0]
        no_botes.value = el.botes
        pzas.value = el.pzas
        kg.value = el.kilos
        turno.value = el.turno

        const obs = observaciones.getElementsByTagName('option')
        for (let i = 0; i < obs.length; i++) {
            if (obs[i].value == el.observaciones) {
                obs[i].setAttribute('selected','')
            }
        }
    })
}

const obtener_registro = (id) => {
    const respuesta = fetchAPI('',url+'/produccion/control/obtener_registro?registro='+id, '')
    respuesta.then(json => {
        cargar_registro(json)
    })
}

const actualizar_registro = () => {
    const respuesta = fetchAPI(form_actualizar, url+'/produccion/control/actualizar','POST')
    respuesta.then(json => {
        if (json == 1) {
            const estado = document.getElementsByClassName('active')
            open_alert('El registro ha sido actualizado correctamente', 'verde')
            obtener_control(estado[0].dataset.estado)
        } else {
            open_alert('Error al actualizar el registro','rojo')
        }
    })
}

const generar_PDF = (valor) => {
    if (valor != '') {
        printPage(url+'/produccion/control/pdf_control?valor='+valor);
    } else {
        open_alert('No ha introducido la orden de producción','naranja')
    }
}

const render_botones_estados = (json) => {
    const botones = document.getElementsByClassName("botones")
    json.forEach(el => {
        if (el.estados != 'CANCELADO' && el.estados != 'TERMINADO') {
            botones[0].innerHTML += '<button class="btn btn-transparent boton_estado" data-estado="v_'+el.estados.toLowerCase()+'" data-titulo="'+el.estados+'" data-id="'+el.id_estados+'">'+el.estados+'</button>'
        }
        
        if (el.estados == 'TERMINADO') {
            botones[0].innerHTML += '<button class="btn" data-terminar="terminar">'+el.estados+'</button>'
        }
    })
}

const obtener_estados = () => {
    const respuesta = fetchAPI('',url+'/produccion/control/estados','')
    respuesta.then(json => {
        render_botones_estados(json)
    })
}

const terminar_orden = (orden) => {
    const respuesta = fetchAPI('',url+'/produccion/op/terminar?orden='+orden,'')
    respuesta.then(json => {
        console.log(json);
        if (json) {
            open_alert('Orden de Producción terminada','verde');
        }
    })
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
        generar_PDF(document.getElementById('op_control').value)
    } else if (evt.target.dataset.terminar) {
        const input = document.getElementById('op_control');
        if (input.value != '') {
            terminar_orden(input.value);
        } else {
            open_alert('No ha introducido la orden de producción','rojo')
        }
    }
})