const render_incidencias = (json) => {
    const body = document.getElementsByClassName('body_incidencia');
    body[0].innerHTML = '';  
    json.forEach(element => {
        body[0].innerHTML += '<tr>'+
                                '<td>'+element.id_incidencias+'</td>'+
                                '<td>'+element.usuario+'</td>'+
                                '<td>'+element.tipo_incidencia+'</td>'+
                                '<td>'+element.inicio_in+'</td>'+
                                '<td>'+element.fin_in+'</td>'+
                                '<td><button class= "material-icons btn btn-icon-self"  data-modal="modal-actualizar" data-edit="'+element.id_incidencias+'"> mode_edit</button></td>'+
                                '<td><button class= "material-icons btn btn-icon-self" onclick="eliminarRegistro('+element.id_incidencias+')">delete</button></td>'
                              +'</tr>';
      });
  }

  const obtener = ( ) =>{
    const respuesta = fetchAPI('',url+'/checador/nuevo/obtener','')
    respuesta.then(json => {
        render_incidencias(json);
    })
};

(function (){
    obtener();
})()