const form_proveedor_ingresar = document.getElementById("form_reg_proveedor");
const form_proveedor_actualizar = document.getElementById("form_act_proveedor");
const auxiliar = {dato: 0}

form_proveedor_ingresar.addEventListener('submit', (evt) => {
    evt.preventDefault()
    insertar()
})

form_proveedor_actualizar.addEventListener('submit', (evt) => {
    evt.preventDefault()
    actualizar()
})

const insertar = () => {
    const respuesta = fetchAPI(form_proveedor_ingresar,url+'/ventas/proveedores/insertar','POST')
    respuesta.then(json => {
        if (json == 1) {
            obtener_proveedores()
            open_alert('El registro fue realizado con exito','verde')
        } else {
            open_alert('El registro no pudo ser realizado', 'rojo')
        }
    })
}

const actualizar = () => {
    const respuesta = fetchAPI(form_proveedor_actualizar,url+'/ventas/proveedores/actualizar','POST')
    respuesta.then(json => {
        if (json == 1) {
            obtener_proveedores();
            open_alert('Registro modificado correctamente','verde')
        } else {
            open_alert('El registro no pudo ser modificado','rojo')
        }
    })
}

const eliminar_proveedor = () => {
    const respuesta = fetchAPI('',url+'/ventas/proveedores/eliminar?id='+auxiliar.dato,'')
    respuesta.then(json => {
        if (json == 1) {
            obtener_proveedores();
            open_alert('Registro eliminado correctamente','verde')
        } else {
            open_alert('El registro no pudo ser eliminado','naranja')
        }
    })
}

const render_proveedores = (json) => {
    const body = document.getElementById('body_proveedores')
    body.innerHTML = ''
    json.forEach(el => {
        body.innerHTML += '<tr>'+
                            '<td>'+
                                '<div id="'+el.Proveedor+'" class="mas_opciones_tablas">'+
                                    '<div class="opcion">'+
                                        '<button data-opciones="'+el.Proveedor+'"  class="mas btn btn-transparent btn-icon-self material-icons">more_vert</button>'+
                                    '</div>'+
                                    '<div class="opciones" id="opciones-'+el.Proveedor+'">'+
                                        '<button style="margin: 0px 5px 0px 0px;" data-modal="modal-actualizar" data-editar="'+el.Id_Proveedor+'" class="btn btn-icon-self btn-amarillo material-icons-outlined">edit</button>'+    
                                        '<button style="margin: 0px 0px 0px 5px;" data-eliminar="'+el.Id_Proveedor+'" class="btn btn-icon-self btn-rojo material-icons-outlined">delete</button>'+    
                                    '</div>'+
                                '</div>'+
                            '</td>'+
                            // '<td>'+el.Id_Proveedor +'</td>'+    
                            '<td>'+el.Proveedor +'</td>'+    
                            '<td>'+el.Direccion +'</td>'+    
                            '<td>'+el.Ciudad +'</td>'+    
                            '<td>'+el.Telefono +'</td>'+    
                            '<td>'+el.Correo +'</td>'+    
                        '</tr>';
    });
}

const colocar_proveedor = (json) => {
    json.forEach(el => {
        document.getElementById('Id_Proveedor').value = el.Id_Proveedor
        document.getElementById('Proveedor_m').value = el.Proveedor
        document.getElementById('Direccion_m').value = el.Direccion
        document.getElementById('Ciudad_m').value = el.Ciudad
        document.getElementById('Telefono_m').value = el.Telefono
        document.getElementById("Correo_m").value = el.Correo;
    })
}

const buscar_proveedor = (id) => {
    const respuesta = fetchAPI('',url+'/ventas/proveedores/obtener_proveedor?id='+id,'')
    respuesta.then(json => {
        colocar_proveedor(json)
    })
}

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.eliminar) {
        auxiliar.dato = evt.target.dataset.eliminar
        open_confirm('¿Desea eliminar este registro?', eliminar_proveedor)
    } else if (evt.target.dataset.editar) {
        buscar_proveedor(evt.target.dataset.editar);
    }
})