const quitar_filas = (t_body) => {
    while(t_body.firstChild){
        t_body.removefirstChild(t_body.firstChild)
    }
}

const render_incidenciasEdit = (json) => {
    const t_body= document.getElementsByClassName('body_incidencia')
    json.forEach(element => {
        const tr = document.createElement('tr')
        tr.classList.add('tr')
        tr.innerHTML += '<td>'+element.id_incidencias+'</td>'+
                        '<td>'+element.id_empleados+'</td>'+
                        '<td>'+element.tipo_incidencia+'</td>'+
                        '<td>'+element.inicio_in+'</td>'+
                        '<td>'+element.fin_in+'</td>'+
                        '<td><button class= "material-icons btn btn-icon-self"  data-modal="modal-actualizar" data-edit="'+element.id_incidencias+'"> mode_edit</button></td>'+
                        '<td><button class= "material-icons btn btn-icon-self" onclick="eliminarRegistro('+element.id_incidencias+')">delete</button></td>';

        t_body[0].appendChild(tr)
    });
}


  const obtenerIn = ( ) =>{
    const respuesta = fetchAPI('',url+'/checador/incidenciasController/obtenerIn','')
    respuesta.then(json => {
        render_incidenciasEdit(json);
        })
};  

 
  const render_empleados = (json) => {
      const select = document.getElementById('id_empleado');
      select.innerHTML = '';
      json.forEach(element => {
          select.innerHTML += '<option value="' +element.id_empleados+'">'+ element.nombre+ ' '+element.apellidoP+ ' '+element.apellidoM +'</option>'

      })
  };

  const buscarEmpleado = () =>{
    const respuesta = fetchAPI('',url+'/checador/incidenciasController/buscarEmpleado','')
    respuesta.then(json => {
        render_empleados(json)
        })
    };


const form = document.getElementById('form_reg_incidencias');

form.addEventListener('submit', (evt) => {
    evt.preventDefault();
    insertarIncidencias();
   // nuevoRegistro();
}) 

const insertarIncidencias = () => {
  const respuesta = fetchAPI(form,url+'/checador/incidenciasController/NuevaIncidencia','POST')
  respuesta.then(json => {
      obtenerIn()
      console.log(json);
  })
} 

const form_actualizar = document.getElementById('form_actualizar');
 
form_actualizar.addEventListener('submit', (evt) => {
    evt.preventDefault();
    actualizarIncidencia();
});

const actualizarIncidencia = () => {
    const respuesta = fetchAPI(form_actualizar, url+'/checador/incidenciasModel/actualizarIncidencia','POST')
    respuesta.then(json => {
        console.log(json);
        if (json == 1) {
            open_alert('El registro ha sido actualizado correctamente', 'verde')
            obtenerIn();
        } else {
            open_alert('Error al actualizar el registro','rojo')
        }
    })
}

const eliminarRegistro = (id) => {
    const respuesta = fetchAPI(form,url+'/checador/incidenciasController/eliminar?id='+id,'POST')
    respuesta.then(json => {
        obtenerIn();
        console.log(json);
    })  
};

 /* (function (){
      obtener();
      buscarEmpleado();
      obtenerIn();
  })() */

  document.addEventListener('DOMContentLoaded', () => {
    obtenerIn();
  
    buscarEmpleado();
});
