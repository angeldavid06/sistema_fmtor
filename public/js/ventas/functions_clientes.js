const dato = {aux: 0}
const render_clientes = (json) => {
    const body = document.getElementsByClassName('body_clientes');
    body[0].innerHTML = '';  
    json.forEach(element => {
        if (element.Id_Clientes != 1) {
            body[0].innerHTML += '<tr>'+
                                    '<td>'+element.Id_Clientes+'</td>'+
                                    '<td>'+element.Razon_social+'</td>'+
                                    '<td>'+element.Nombre+'</td>'+
                                    '<td>'+element.Telefono+'</td>'+
                                    '<td>'+element.Correo+'</td>'+
                                    '<td>'+element.Direccion+'</td>'+
                                    '<td><button class= "material-icons btn btn-icon-self btn-amarillo"  data-modal="modal-actualizar" data-edit="'+element.Id_Clientes+'"> mode_edit</button>'+
                                    '<td><button class= "material-icons btn btn-icon-self btn-rojo" data-eliminar="'+element.Id_Clientes+'">delete</button>'
                                  +'</tr>';
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
        Id_Clientes.value = element.Id_Clientes;
        Razon_social.value = element.Razon_social;
        Nombre.value = element.Nombre;
        Telefono.value = element.Telefono;
        Correo.value = element.Correo;
        Direccion.value=element.Direccion;
    })
}

const Id_Clientes_r = document.getElementById('Id_Clientes');
const Razon_social_r = document.getElementById('Razon_social');
const Nombre_r = document.getElementById('Nombre');
const Telefono_r = document.getElementById('Telefono');
const Correo_r = document.getElementById('Correo');
const Direccion_r = document.getElementById('Direccion');
  
const nuevoRegistro = () => {
    Id_Clientes_r.value ='';
    Razon_social_r.value ='';
    Nombre_r.value ='';
    Telefono_r.value ='';
    Correo_r.value = '';
    Direccion_r.value ='';
}
  
document.addEventListener('click',evt =>{
    if (evt.target.dataset.edit){
        mostrarModal(evt.target.dataset.edit);
    } else if (evt.target.dataset.eliminar) {
        dato.aux = evt.target.dataset.eliminar;
        open_confirm('¿Estas seguro de eliminar este registro?',eliminarRegistro)
    }
})
 
const obtener = () =>{
    const respuesta = fetchAPI('',url+'/ventas/clientes/obtener','')
    respuesta.then(json => {
        render_clientes(json);
    })
    
};
  
const eliminarRegistro =()=>{
    const respuesta = fetchAPI('',url+'/ventas/clientes/eliminarCliente?dato='+dato.aux,'')
    respuesta.then(json => {
        obtener();
    })
};
  
const form = document.getElementById('form_reg_cliente');

form.addEventListener('submit', (evt) => {
    evt.preventDefault();
    insertarCliente();
    nuevoRegistro();
})
  
const insertarCliente = () => {
    const respuesta = fetchAPI(form,url+'/ventas/clientes/NuevoCliente','POST')
    respuesta.then(json => {
        if (json == 1) {
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
    actualizar_Cliente();
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

(function (){
    obtener();
})()