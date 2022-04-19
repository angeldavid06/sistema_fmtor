const form_control = document.getElementById('form-control-diario');
const form_actualizar = document.getElementById("form-control-diario-editar");

const registrar_sin_op = () => {
    const respuesta = fetchAPI(form_control,url+'/produccion/control/insertar_sin_op', 'POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('Registro añadido correctamente','verde')
            obtener_registros_diarios();
        } else {
            open_alert('El registro no pudo ser realizado','rojo')
        }
    })
}

form_control.addEventListener('submit', (evt)=> {
    evt.preventDefault();
    let aux = true;
    const inputs = form_control.getElementsByClassName('input')
    for (let i = 0; i < inputs.length; i++) {
        if (inputs[i].value == '' && i != 4) {
            inputs[i].classList.add('input-error');
            aux = false;
        } 
    }
    if (aux) {
        if (inputs[4].value == '') {
            open_confirm('¿Desea registrar esta información sin una O.P.?',registrar_sin_op)
        } else {
            registrar_control()
        }
        for (let i = 0; i < inputs.length; i++) {
            inputs[i].classList.remove('input-error');
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
        for (let i = 0; i < inputs.length; i++) {
            inputs[i].classList.remove('input-error');
        }
    } else {
        open_alert('Debes llenar los campos correctamente','rojo')
    }
})

const select_estado = document.getElementsByClassName('select-estado')
select_estado[0].addEventListener('change', () => {
    const maquina = document.getElementsByClassName('no_maquina_sp')
    if (select_estado[0].value == 6) {
        maquina[0].setAttribute('disabled','')
        maquina[0].value = 0
    } else {
        maquina[0].removeAttribute('disabled','')
    }
})

const actualizar_registro = () => {
    const respuesta = fetchAPI(form_actualizar, url+'/produccion/control/actualizar_e','POST')
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
    if (json.length == 0) {
        const tr = document.createElement("tr");
        tr.innerHTML =
              "<td colspan='10' class='txt-center'>No hay ningún registro</td>";
            body.appendChild(tr);
    } else {
        json.forEach(el => {
            const tr = document.createElement('tr')
            if (el.Id_Folio != 1) {
                tr.innerHTML =
                    '<td>'+
                        '<div id="'+el.id_registro_diario+'" class="mas_opciones_tablas">'+
                            '<div class="opcion">'+
                                '<button data-opciones="'+el.id_registro_diario+'"  class="mas btn btn-icon-self material-icons">more_vert</button>'+
                            '</div>'+
                            '<div class="opciones" id="opciones-'+el.id_registro_diario+'">'+
                                '<button style="margin: 0px 5px 0px 0px;" data-modal="modal-editar-diario" data-editar="' +el.id_registro_diario +'" class="material-icons btn btn-icon-self btn-amarillo">edit</button>' +
                                '<button style="margin: 0px 0px 0px 5px;" data-eliminar="' +el.id_registro_diario +'" class="material-icons btn btn-icon-self btn-rojo">delete</button>'+
                            '</div>'+
                        '</div>'+
                    '</td>'+
                    "<td>" +el.turno +"</td>" +
                    "<td>" +el.Id_Folio +"</td>" +
                    "<td>" +el.Clientes +"</td>" +
                    "<td>" +el.kilos +"</td>" +
                    "<td>" +el.pzas +"</td>" +
                    "<td>" +el.Maquina +"</td>" +
                    "<td>" +el.descripcion +"</td>" +
                    "<td>" +el.observaciones +"</td>";
                body.appendChild(tr);
            } else {
                tr.innerHTML = '<td>'+
                                    '<div id="'+el.id_registro_diario+'" class="mas_opciones_tablas">'+
                                        '<div class="opcion">'+
                                            '<button data-opciones="'+el.id_registro_diario+'"  class="mas btn btn-transparent btn-icon-self material-icons">more_vert</button>'+
                                        '</div>'+
                                        '<div class="opciones" id="opciones-'+el.id_registro_diario+'">'+
                                            '<button style="margin: 0px 5px 0px 0px;" data-modal="modal-actualizar" data-editar="'+el.id_registro_diario+'" class="material-icons btn btn-icon-self btn-amarillo">edit</button>'+
                                            '<button style="margin: 0px 0px 0px 5px;" data-eliminar="'+el.id_registro_diario+'" class="material-icons btn btn-icon-self btn-rojo">delete</button>'+
                                        '</div>'+
                                    '</div>'+
                                '</td>'+
                                '<td>'+el.turno+'</td>'+
                                '<td>SIN O.P.</td>'+
                                '<td></td>'+
                                '<td>'+el.kilos+'</td>'+
                                '<td>'+el.pzas+'</td>'+
                                '<td>'+el.Maquina+'</td>'+
                                '<td></td>'+
                                '<td>'+el.observaciones+'</td>'
                body.appendChild(tr);
            }
        });
    }
}

const cargar_registro = (json) => {
    const registro = document.getElementById('registro')
    const op = document.getElementById('op_d')
    const no_maquina = document.getElementById('no_maquina_d')
    const no_botes = document.getElementById('no_botes_d')
    const fecha = document.getElementById('fecha_d')
    const pzas = document.getElementById('pzas_d')
    const kg = document.getElementById('kg_d')
    const turno = document.getElementById('turno_d')
    const observaciones = document.getElementById('observaciones_d')

    json.forEach(el => {
        registro.value = el.id_registro_diario
        op.value = el.Id_Produccion_FK_1
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
        const estado = document
          .getElementById("estado_d")
          .getElementsByTagName("option");
        for (let i = 0; i < estado.length; i++) {
            if (estado[i].value == el.Id_estado_1) {
                estado[i].setAttribute("selected", "");
            }
        }
    })
}

const obtener_registro = (id) => {
    const respuesta = fetchAPI('',url+'/produccion/control/obtener_registro_diario?registro='+id, '')
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