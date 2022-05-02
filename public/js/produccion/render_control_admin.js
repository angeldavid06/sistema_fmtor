const form_control = document.getElementById('form-control');
const form_actualizar = document.getElementById('form-control-actualizar');

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
            for (let i = 0; i < inputs.length; i++) {
                inputs[i].classList.remove('input-error');
            }
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
            for (let i = 0; i < inputs.length; i++) {
                inputs[i].classList.remove('input-error');
            }
        } else {
            open_alert('Debes llenar los campos correctamente','rojo')
        }
    } catch (error) {
        open_alert('Debes seleccionar alguna etapa antes de enviar el formulario','rojo')
    }
})

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
            const estado = document.getElementsByClassName('active_estado')
            open_alert('El registro ha sido actualizado correctamente', 'verde')
            obtener_control(estado[0].dataset.estado)
        } else {
            open_alert('Error al actualizar el registro','rojo')
        }
    })
}

const terminar_orden = () => {
    const respuesta = fetchAPI('',url+'/produccion/op/terminar?orden='+data_aux.dato,'')
    respuesta.then(json => {
        if (json) {
            open_alert('Orden de Producción terminada','verde');
        } else {
            open_alert('No se pudo terminar la Orden de Producción', 'naranja')
        }
    })
}


const registrar_control = () => {
    const respuesta = fetchAPI(form_control,url+'/produccion/control/insertar','POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('Registro añadido correctamente', 'verde')
            const estado = document.getElementsByClassName('active_estado')
            if (estado.length > 0) {
                obtener_control(estado[0].dataset.estado)
            }
        } else {
            open_alert('El registro no pudo ser realizado','rojo')
        }
    })
}

const registrar_sin_op = () => {
    const respuesta = fetchAPI(form_control,url+'/produccion/control/insertar_sin_op', 'POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('Registro añadido correctamente','verde')
        } else {
            open_alert('El registro no pudo ser realizado','rojo')
        }
    })
}

function eliminar () {
    const respuesta = fetchAPI('',url+'/produccion/control/eliminar?dato='+data_aux.dato,'')
    respuesta.then(json => {
        if (json == 1) {
            const estado = document.getElementsByClassName('active_estado')
            obtener_control(estado[0].dataset.estado)
            open_alert('Registro eliminado correctamente','verde')
        } else {
            open_alert('Ocurrio un error al intentar realizar la consulta','rojo')
        }
    })
}

const eliminar_registro = () => {
    open_confirm('¿Estas seguro de eliminar este registro?', eliminar)
}

const cargar_registro = (json) => {
    const op = document.getElementById('a_op')
    const no_maquina = document.getElementById('a_no_maquina')
    const no_botes = document.getElementById('a_no_botes')
    const fecha = document.getElementById('a_fecha')
    const pzas = document.getElementById('a_pzas')
    const kg = document.getElementById('a_kg')
    const turno = document.getElementById('a_turno')
    const observaciones = document.getElementById('a_observaciones')

    json.forEach(el => {
        op.value = el.id_registro_diario
        no_maquina.value = el.no_maquina
        fecha.value = el.fecha.split(' ')[0]
        no_botes.value = el.bote
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

const render_control = (vista,json) => {
    totales.total_kg = 0.0;
    totales.total_pzas = 0;
    const body = document.getElementsByClassName('body')

    quitar_filas(vista)

    if (json.length == 0) {
        body[0].innerHTML += '<tr>'+
                                '<td colspan="7">No existe ningún registro</td>'+
                            '</tr>';
    } else {
        json.forEach(el => {
            body[0].innerHTML += '<tr>'+
                                    '<td>'+
                                        '<div id="'+el.id_registro_diario+'" class="mas_opciones_tablas">'+
                                            '<div class="opcion">'+
                                                '<button data-opciones="'+el.id_registro_diario+'"  class="mas btn btn-icon-self material-icons">more_vert</button>'+
                                            '</div>'+
                                            '<div class="opciones" id="opciones-'+el.id_registro_diario+'">'+
                                                '<button style="margin: 0px 5px 0px 0px;" class="btn btn-icon-self btn-rojo material-icons" data-opcion="cerrar" data-eliminar='+el.id_registro_diario+'>delete</button>'+
                                                '<button style="margin: 0px 0px 0px 5px;" class="btn btn-icon-self btn-amarillo material-icons" data-modal="modal-actualizar" data-opcion="actualizar"  data-edit="'+el.id_registro_diario+'">edit</button>'+
                                            '</div>'+
                                        '</div>'+
                                    '</td>'+
                                    '<td>'+el.bote+'</td>'+
                                    '<td>'+el.fecha+'</td>'+
                                    '<td>'+el.observaciones+'</td>'+
                                    '<td class="txt-right">'+new Intl.NumberFormat('es-MX').format(el.pzas)+'</td>'+
                                    '<td class="txt-right">'+new Intl.NumberFormat('es-MX').format(el.kilos)+'</td>'+
                                    '<td class="txt-right">'+el.no_maquina+'</td>'+
                                '</tr>';
            totales.total_kg += parseFloat(el.kilos)
            totales.total_pzas  += parseInt(el.pzas)
        });
    }


    const total_kilogramos = document.getElementsByClassName('total_kg')
    const total_acumuladas = document.getElementsByClassName('total_acumuladas')

    total_kilogramos[0].innerHTML = 'Total k.g.: <br>' + new Intl.NumberFormat('es-MX').format(totales.total_kg)
    total_acumuladas[0].innerHTML = 'Pzas. Acumuladas: <br>' + new Intl.NumberFormat('es-MX').format(totales.total_pzas)
}

const btn_form_control = document.getElementById('btn-form-control');

btn_form_control.addEventListener('click', () => {
    const estado = document.getElementsByClassName('active_estado')
    const op_control = document.getElementById('op_control')
    
    const op = document.getElementById('op')
    const input = document.getElementById('estado')
    
    op.value = op_control.value
    input.value = estado[0].dataset.id
});

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

const form_diario = document.getElementById('form-reporte-diario')

form_diario.addEventListener('submit', (evt) => {
    evt.preventDefault();
    
    const fecha = document.getElementById('diario_fecha')
    const turno = document.getElementById('diario_turno')
    const estado = document.getElementById('diario_estado')
    
    fecha.classList.remove('input-error')
    turno.classList.remove('input-error')
    estado.classList.remove('input-error')
    
    if (fecha.value != '') {
        if (turno.value != '') {
            if (estado.value != '') {
                fecha.classList.remove('input-error')
                turno.classList.remove('input-error')
                estado.classList.remove('input-error')
                generar_reporte_diario(fecha.value,turno.value,estado.value)
            } else {
                estado.classList.add('input-error')
                open_alert('No ha seleccionado el estado de producción','rojo')
            }
        } else {
            turno.classList.add('input-error')
            open_alert('No ha introducido el turno de producción','rojo')
        }
    } else {
        fecha.classList.add('input-error')
        open_alert('No ha seleccionado la fecha','rojo')
    }
})