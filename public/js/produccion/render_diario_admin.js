const form_control = document.getElementById('form-control-diario');
const form_actualizar = document.getElementById('form-control-actualizar');

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

form_control.addEventListener('submit', (evt)=> {
    evt.preventDefault();
    let aux = true;
    const inputs = form_control.getElementsByClassName('input')
    for (let i = 1; i < inputs.length; i++) {
        if (inputs[i].value == '') {
            inputs[i].classList.add('input-error');
            aux = false;
        } 
    }
    if (aux) {
        if (inputs[0].value == '') {
            open_confirm('¿Desea registrar esta información sin una O.P.?',registrar_sin_op)
        } else {
            registrar_control()
        }
    } else {
        open_alert('Debes llenar los campos correctamente','rojo')
    }
});

form_actualizar.addEventListener('submit', (evt) => {
    evt.preventDefault()
    let aux = true;
    const inputs = form_actualizar.getElementsByClassName('input')
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
})

const actualizar_registro = () => {
    const respuesta = fetchAPI(form_actualizar, url+'/produccion/control/actualizar','POST')
    respuesta.then(json => {
        if (json == 1) {
            obtener_registros_diarios()
            open_alert('El registro ha sido actualizado correctamente', 'verde')
        } else {
            open_alert('Error al actualizar el registro','rojo')
        }
    })
}

const registrar_control = () => {
    const respuesta = fetchAPI(form_control,url+'/produccion/control/insertar','POST')
    respuesta.then(json => {
        if (json == 1) {
            obtener_registros_diarios()
            open_alert('Registro añadido correctamente', 'verde')
        } else {
            open_alert('El registro no pudo ser realizado','rojo')
        }
    })
}

const render_registros_diarios = (json) => {
    const body = document.getElementById('body')
    json.forEach(el => {
        const tr = document.createElement('tr')
        if (el.Id_Folio != 1) {
            tr.innerHTML = '<td>'+el.turno+'</td>'+
                            '<td>'+el.Id_Folio+'</td>'+
                            '<td>'+el.Clientes+'</td>'+
                            '<td>'+el.kilos+'</td>'+
                            '<td>'+el.pzas+'</td>'+
                            '<td>'+el.Maquina+'</td>'+
                            '<td>'+el.descripcion+'</td>'+
                            '<td>'+el.observaciones+'</td>'+
                            '<td><button  data-modal="modal-actualizar" data-editar="'+el.id_registro_diario+'" class="material-icons btn btn-icon-self btn-naranja">edit</button></td>'+
                            '<td><button data-eliminar="'+el.id_registro_diario+'" class="material-icons btn btn-icon-self btn-rojo">delete</button></td>';
            body.appendChild(tr);
        } else {
            tr.innerHTML = '<td>'+el.turno+'</td>'+
                            '<td>SIN O.P.</td>'+
                            '<td></td>'+
                            '<td>'+el.kilos+'</td>'+
                            '<td>'+el.pzas+'</td>'+
                            '<td>'+el.Maquina+'</td>'+
                            '<td></td>'+
                            '<td>'+el.observaciones+'</td>'+
                            '<td><button  data-modal="modal-actualizar" data-editar="'+el.id_registro_diario+'" class="material-icons btn btn-icon-self btn-naranja">edit</button></td>'+
                            '<td><button data-eliminar="'+el.id_registro_diario+'" class="material-icons btn btn-icon-self btn-rojo">delete</button></td>';
            body.appendChild(tr);
        }
    });
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

function eliminar () {
    const respuesta = fetchAPI('',url+'/produccion/control/eliminar?dato='+data_aux.dato,'')
    respuesta.then(json => {
        if (json == 1) {
            obtener_registros_diarios()
            open_alert('Registro eliminado correctamente','verde')
        } else {
            open_alert('Ocurrio un error al intentar realizar la consulta','rojo')
        }
    })
}

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.eliminar) {
        data_aux.dato = evt.target.dataset.eliminar
        eliminar_registro()
    } else if (evt.target.dataset.editar) {
        obtener_registro(evt.target.dataset.editar)
    }
})