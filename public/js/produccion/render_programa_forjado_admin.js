const form_ingresar = document.getElementById('op_programa')
const form_editar = document.getElementById('op_programa_editar')
const opciones = {dato: ''}

const obtener_registro = (id) => {
    const respuesta = fetchAPI('',url+'/produccion/op/obtener_registro?id='+id,'')
    respuesta.then(json => {
        document.getElementById('op_a').value = json[0].Id_Folio
        document.getElementById('fecha_entrega_a').value = json[0].Fecha_entrega
        document.getElementById('herramental_a').value = json[0].Herramental
        document.getElementById('no_maquina_a').value = json[0].no_maquina

    })
}

const editar_programa = () => {
    const respuesta = fetchAPI(form_editar,url+'/produccion/op/editar_programa','POST')
    respuesta.then(json => {
        if (json == 1) {
            limpiar_tablas()
            obtener_programa()
            open_alert('Actualización realizada correctamente','verde')
        } else {
            open_alert('Ocurrio un error al editar este registro','rojo')
        }
    })
}

form_editar.addEventListener('submit', (evt) => {
    evt.preventDefault();
    const inputs = form_editar.getElementsByClassName('input')
    let aux = true
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].classList.remove('input-error');
    }
    for (let i = 0; i < inputs.length; i++) {
        if (inputs[i].value == '') {
            inputs[i].classList.add('input-error');
            aux = false;
        }
    }

    if(aux) {
        editar_programa();
    } else {
        open_alert('Debes llenar todos los campos','rojo')
    }
})

const insertar_programa = () => {
    const respuesta = fetchAPI(form_ingresar,url+'/produccion/op/insertar_programa','POST')
    respuesta.then(json => {
        if (json == 1) {
            limpiar_tablas()
            obtener_programa()
            open_alert('Asignación correcta','verde')
        } else {
            open_alert('Ocurrio un error al asignar la O.P.','rojo')
        }
    })
}

form_ingresar.addEventListener('submit', (evt) => {
    evt.preventDefault();
    const inputs = form_ingresar.getElementsByClassName('input')
    let aux = true
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].classList.remove('input-error');
    }
    for (let i = 0; i < inputs.length; i++) {
        if (inputs[i].value == '') {
            inputs[i].classList.add('input-error');
            aux = false;
        }
    }

    if(aux) {
        insertar_programa();
    } else {
        open_alert('Debes llenar todos los campos','rojo')
    }
})

const render_programa = (registros,maquina) => {
    const body = document.getElementById('body_maquina_'+maquina);
    body.innerHTML += '<tr>'+
                            '<td style=" padding: 5px;"><button class="btn btn-icon-self btn-amarillo material-icons" data-modal="modal-programa_editar" data-editar="'+registros.Id_Programa_Forjado+'">edit</button></td>'+
                            '<td style=" padding: 5px;"><button class="btn btn-icon-self btn-rojo material-icons" data-eliminar="'+registros.Id_Programa_Forjado+'">delete</button></td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.calibre+'</td>'+
                            '<td class="txt-right '+registros.producto_desc+'">'+new Intl.NumberFormat('es-MX').format((registros.factor*registros.cantidad_elaborar))+'</td>'+
                            '<td class="txt-right '+registros.producto_desc+'">'+registros.factor+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.Id_Folio+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.Fecha+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.Clientes+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.medida+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.descripcion+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.acabados+'</td>'+
                            '<td class="txt-right '+registros.producto_desc+'">'+registros.cantidad_elaborar+'</td>'+
                            '<td class="txt-right '+registros.producto_desc+'">$ '+registros.precio_millar+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.Fecha_entrega+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.Herramental+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.tratamiento+'</td>'+
                            '<td class="txt-right '+registros.producto_desc+'">$ '+new Intl.NumberFormat('es-MX').format(registros.TOTAL)+'</td>'+
                        '</tr>'
}

function eliminar_registro () {
    const respuesta = fetchAPI('',url+'/produccion/op/eliminar_programa?id='+opciones.dato,'')
    respuesta.then(json => {
        if (json == 1) {
            limpiar_tablas()
            obtener_programa()
            open_alert('Registro eliminado correctamente','verde')
        } else {
            open_alert('El registro no pudo eliminarse','rojo')
        }
    })
}

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.editar) {
        const input = document.getElementById('registro')
        input.value = evt.target.dataset.editar
        obtener_registro(evt.target.dataset.editar)
    } else if (evt.target.dataset.eliminar) {
        opciones.dato = evt.target.dataset.eliminar
        open_confirm('¿Desea eliminar este registro?',eliminar_registro)
    }
})