const render_tarjeta = (json) => {
    const body = document.getElementsByClassName('body_tarjeta');
    body[0].innerHTML = '';  
    json.forEach(element => {
        body[0].innerHTML += '<tr>'+
                                '<td>'+element.Id_Folio+'</td>'+
                                '<td>'+element.Codigo+'</td>'+
                                '<td>'+element.Tratamiento+'</td>'+
                                '<td>'+element.Bote+'</td>'+
                                '<td>'+element.Descripcion+'</td>'+
                                '<td>'+element.Medida+'</td>'+
                                '<td>'+element.Acabado+'</td>'+
                                '<td>'+element.Dibujo+'</td>'+
                                '<td>'+element.Razon_social+'</td>'+
                                '<td>'+element.Salida+'</td>'+
                                '<td>'+element.Fecha+'</td>'+
                                '<td>'+element.Material+'</td>'+
                                '<td><button class= "material-icons btn btn-icon-self" data-modal="modal-actualizar" data-edit="'+element.Id_Folio+'"> app_registration</button></td>'+
                                '<td><button class= "material-icons btn btn-icon-self" data-imprime="'+element.Id_Folio+'">account_tree</button>'
                                +'<tr>';
  
    });
  }

  const mostrarModal = (id) =>{
    const respues = fetchAPI('',url+'/ventas/tarjeta/obtener_per?aux='+id+'','');
    respues.then(json => {
        pintarModal(json);
    });
  }
  
  const Bote             = document.getElementById('Bote_edit');
  const Id_Folio= document.getElementById('id_folio_edit');

   const pintarModal = (json) => {
    json.forEach(element => {
      Bote.value             = element.Bote;
      Id_Folio.value= element.Id_Folio;
    })
  }

//
  const obtener = () =>{
    const respuesta = fetchAPI('',url+'/ventas/tarjeta/obtener','')
    respuesta.then(json => {
        render_tarjeta(json);
    })
};
  //pdf tarjeta
  const pdfs = (id) => {
    printPage(url+'/ventas/tarjeta/pdftarjeta?atributo=Id_Folio&value='+id)
  }
  
  document.addEventListener('click',(evt)=>{
    
    if (evt.target.dataset.imprime){
      pdfs(evt.target.dataset.imprime)
    } 
  });

  document.addEventListener('click',evt =>{
    if(evt.target.dataset.edit){
        mostrarModal(evt.target.dataset.edit);
    }else{
        if(evt.target.dataset.delete){
            
        }
    }
    
  })

  const btn_buscar=document.getElementById('clave')
btn_buscar.addEventListener('click',()=>{
    const input=document.getElementById('id_tarjeta');
    if(input.value==''){
        obtener();
    }
    else{
      obtener_clave_tarjeta(input.value)
    }
    
})

const obtener_clave_tarjeta = (clave) => {
    const respuesta = fetchAPI('',url+'/ventas/tarjeta/buscar?clave='+clave,'');
    respuesta.then(json => {
        render_tarjeta(json)
    })
}

  const formactualizar = document.getElementById('form_act_tarjeta');

  formactualizar.addEventListener('submit', (evt) => {
    evt.preventDefault();
    actualizar_tarjeta();
  })
  
  const actualizar_tarjeta = () => {
    const respuesta = fetchAPI(formactualizar, url+'/ventas/tarjeta/actualizarTarjeta','POST')
    respuesta.then(json => {
        console.log(json);
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
  