const dato = {aux: 0}
const render_clientes = (json) => {
    const body = document.getElementsByClassName('body_clientes');
    body[0].innerHTML = '';  
    json.forEach(element => {
        if (element.Id_Clientes != 1) {
            body[0].innerHTML += '<tr>'+
                                    '<td style="padding: 5px;">'+
                                        '<div id="'+element.Id_Clientes+'" class="mas_opciones_tablas">'+
                                            '<div class="opcion">'+
                                                '<button data-opciones="'+element.Id_Clientes+'" class="mas btn btn-icon-self material-icons">more_vert</button>'+
                                            '</div>'+
                                            '<div class="opciones" id="opciones-'+element.Id_Clientes+'">'+
                                                '<button style="margin: 0px 5px 0px 0px;" class= "material-icons-outlined btn btn-icon-self btn-amarillo"  data-modal="modal-actualizar" data-edit="'+element.Id_Clientes+'"> mode_edit</button>'+
                                                '<button style="margin: 0px 5px;" class= "material-icons-outlined btn btn-icon-self btn-transparent">history</button>'+
                                                '<button style="margin: 0px 0px 0px 5px;" class= "material-icons-outlined btn btn-icon-self btn-rojo" data-eliminar="'+element.Id_Clientes+'">delete</button>'+
                                            '</div>'+
                                        '</div>'+
                                    '</td>'+
                                    '<td>'+element.Id_Clientes+'</td>'+
                                    '<td>'+element.Razon_social+'</td>'+
                                    '<td>'+element.Nombre+'</td>'+
                                    '<td>'+element.Telefono+'</td>'+
                                    '<td>'+element.Correo+'</td>'+
                                    '<td>'+element.Direccion+'</td>'+
                                  '</tr>';
        }
    });
}
  
const mostrarModal = (id) =>{
    const respues = fetchAPI('',url+'/ventas/clientes/obtener_per?aux='+id+'','');
    respues.then(json => {
        pintarModal(json);
    });
}

const Id_Clientes = document.getElementById('Id_Clientes_edit');
const Razon_social = document.getElementById('Razon_social_edit');
const Nombre = document.getElementById('Nombre_edit');
const Telefono  = document.getElementById('Telefono_edit');
const Correo  = document.getElementById('Correo_edit');
const Direccion  = document.getElementById('Direccion_edit');

const pintarModal = (json) => {
    json.forEach(element =>{
        Id_Clientes.value = element.Id_Clientes.trim();
        Razon_social.value = element.Razon_social.trim();
        Nombre.value = element.Nombre.trim();
        Telefono.value = element.Telefono.trim();
        Correo.value = element.Correo.trim();
        Direccion.value = element.Direccion.trim();
    })
}

const eliminarRegistro =()=>{
    const respuesta = fetchAPI('',url+'/ventas/clientes/eliminarCliente?dato='+dato.aux,'')
    respuesta.then(json => {
        obtener();
    })
};
  
const form = document.getElementById('form_reg_cliente');

form.addEventListener('submit', (evt) => {
    evt.preventDefault();
    const data = Object.fromEntries(
        new FormData(evt.target)
    )

    const validacion = validar(data)

    if (validacion) {
        open_confirm('¿Desea registrar a este cliente?',insertarCliente);
    }
})
  
const insertarCliente = () => {
    const respuesta = fetchAPI(form,url+'/ventas/clientes/NuevoCliente','POST')
    respuesta.then(json => {
        if (json == 1) {
            limpiar_form(form);
            open_alert('El registro ha sido actualizado correctamente', 'verde')
            obtener();
        } else {
            open_alert('Error al actualizar el registro','rojo')
        }
    })
} 
  
const formactualizar = document.getElementById('form_act_cliente');

formactualizar.addEventListener('submit', (evt) => {
    evt.preventDefault();
    const data = Object.fromEntries(
        new FormData(evt.target)
    )

    const validacion = validar(data)

    if (validacion) {
        open_confirm("¿Desea modificar a este cliente?", actualizar_Cliente);
    }
})

const actualizar_Cliente = () => {
    const respuesta = fetchAPI(formactualizar, url+'/ventas/clientes/actualizarCliente','POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('El registro ha sido actualizado correctamente', 'verde')
            obtener();
        } else {
            open_alert('Error al actualizar el registro','rojo')
        }
    })
}

document.addEventListener('click',evt =>{
    if (evt.target.dataset.edit){
        mostrarModal(evt.target.dataset.edit);
    } else if (evt.target.dataset.eliminar) {
        dato.aux = evt.target.dataset.eliminar;
        open_confirm('¿Estas seguro de eliminar este registro?',eliminarRegistro)
    }
})