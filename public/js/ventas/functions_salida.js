const render_salida = (json) => {
  const body = document.getElementsByClassName('body_salida');
  body[0].innerHTML = '';  
  json.forEach(element => {
    if (element.Salida != 0) {
      body[0].innerHTML += '<tr>'+
                              '<td>'+element.Salida+'</td>'+
                              '<td>'+element.Razon_social+'</td>'+
                              '<td>'+element.Fecha+'</td>'+
                              '<td>'+element.Cantidad_millares+'</td>'+
                              '<td>'+element.Codigo+'</td>'+
                              '<td>'+element.Pedido_pza+'</td>'+
                              '<td>'+element.Medida+'</td>'+
                              '<td>'+element.Descripcion+'</td>'+
                              '<td>'+element.Acabado+'</td>'+
                              '<td>'+element.Precio_millar+'</td>'+
                              '<td>'+element.Factura+'</td>'+
                              '<td>'+element.Dibujo+'</td>'+
                              '<td>'+element.Material+'</td>'+
                              '<td>'+element.Id_Folio+'</td>'+
                              '<td>'+element.Fecha_entrega+'</td>'+                
                              '<td><button class= "material-icons btn btn-amarillo btn-icon-self" data-modal="modal-actualizar" data-edit="'+element.Id_Folio+'"> mode_edit</button></td>'+
                              '<td><button class= "material-icons btn btn-icon-self" data-impresion="'+element.Id_Folio+'">warehouse</button>'
                              
                              ;
    }

  });
}
const mostrarModal = (id) =>{
  const respues = fetchAPI('',url+'/ventas/salida/obtener_per?aux='+id+'','');
  respues.then(json => {
      pintarModal(json);
  });
}

const Salida            = document.getElementById('Salida_edit');
const Id_Clientes_2     = document.getElementById('Id_Clientes_2_edit');
const Fecha             = document.getElementById('Fecha_edit');
const Cantidad_millares = document.getElementById('Cantidad_millares_edit');
const Codigo            = document.getElementById('Codigo_edit');
const Pedido_pza        = document.getElementById('Pedido_pza_edit');
const Medida            = document.getElementById('Medida_edit');
const Descripcion       = document.getElementById('Descripcion_edit');
const Acabado           = document.getElementById('Acabado_edit');
const Precio_millar     = document.getElementById('Precio_millar_edit');
const Factura           = document.getElementById('Factura_edit');
const Dibujo            = document.getElementById('Dibujo_edit');
const Material          = document.getElementById('Material_edit');
const Id_Folio          = document.getElementById('Id_Folio_edit');
const Fecha_entrega     = document.getElementById('Fecha_entrega_edit');


console.log(Salida);
console.log(Id_Clientes_2);
console.log(Fecha);
console.log(Cantidad_millares);
console.log(Codigo);
console.log(Pedido_pza);
console.log(Medida);
console.log(Descripcion);
console.log(Acabado);
console.log(Precio_millar);
console.log(Factura);
console.log(Dibujo);
console.log(Material);
console.log(Id_Folio);
console.log(Fecha_entrega);


 const pintarModal = (json) => {
  json.forEach(element =>{
    console.log(element);

   //
   Salida.value            = element.Salida;
   Id_Clientes_2.value     = element.Id_Clientes_2;
   Fecha.value             = element.Fecha;
   Cantidad_millares.value = element.Cantidad_millares;
   Codigo.value            = element.Codigo;
   Pedido_pza.value        = element.Pedido_pza;
   Medida.value            = element.Medida;
   Descripcion.value       = element.Descripcion;
   Acabado.value           = element.Acabado;
   Precio_millar.value     = element.Precio_millar;
   Factura.value           = element.Factura;
   Dibujo.value            = element.Dibujo;
   Material.value          = element.Material;
   Id_Folio.value          = element.Id_Folio;
  Fecha_entrega.value      = element.Fecha_entrega;
    
   
  })
}
const Salida_r            = document.getElementById('Salida');
const Id_Clientes_2_r     = document.getElementById('Id_Clientes_2');
const Fecha_r             = document.getElementById('Fecha');
const Cantidad_millares_r = document.getElementById('Cantidad_millares');
const Codigo_r            = document.getElementById('Codigo');
const Pedido_pza_r        = document.getElementById('Pedido_pza');
const Medida_r            = document.getElementById('Medida');
const Descripcion_r       = document.getElementById('Descripcion');
const Acabado_r           = document.getElementById('Acabado');
const Precio_millar_r     = document.getElementById('Precio_millar');
const Factura_r           = document.getElementById('Factura');
const Dibujo_r            = document.getElementById('Dibujo');
const Material_r          = document.getElementById('Material');
const Id_Folio_r          = document.getElementById('Id_Folio');
const Fecha_entrega_r     = document.getElementById('Fecha_entrega');


const nuevoRegistro = () => {
Salida_r.value            = '';
Id_Clientes_2_r.value     = '';
Fecha_r.value             = '';
Cantidad_millares_r.value = '';
Codigo_r.value            = '';
Pedido_pza_r.value        = '';
Medida_r.value            = '';
Descripcion_r.value       = '';
Acabado_r.value           = '';
Precio_millar_r.value     = '';
Factura_r.value           = '';
Dibujo_r.value            = '';
Material_r.value          = '';
Id_Folio_r.value          = '';
Fecha_entrega_r.value     = '';





}

//posible copia de busqueda 
document.addEventListener('click', evt => {
  if (evt.target.dataset.edit) {
      console.log(evt.target.dataset.edit);
      mostrarModal(evt.target.dataset.edit);
  }
 

})
//buscar
const btn_buscar=document.getElementById('clave')
btn_buscar.addEventListener('click',()=>{
  const input=document.getElementById('id_folio')
  if(input.value==''){
      obtener();
  }
  else{
      obtener_clave_reporte(input.value)
  }
  
})

const obtener_clave_reporte = (clave) => {
  const respuesta = fetchAPI('',url+'/ventas/salida/buscar?clave='+clave,'');
  respuesta.then(json => {
      render_salida(json)
  })
}
//vista
const obtener = () =>{
  const respuesta = fetchAPI('',url+'/ventas/salida/obtener','')
  respuesta.then(json => {
      render_salida(json);
  })
  
};
//eliminar
const eliminarRegistro =(id)=>{
  const respuesta = fetchAPI('',url+'/ventas/salida/eliminarSalida?dato='+id,'')
  respuesta.then(json => {
      obtener();
  })
  
};
//ingresar
const form = document.getElementById('form_reg_salida');

form.addEventListener('submit', (evt) => {
  evt.preventDefault();
  insertarSalida();
  nuevoRegistro();
})

const insertarSalida = () => {
const respuesta = fetchAPI(form,url+'/ventas/salida/NuevaSalida','POST')
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

const formactualizar = document.getElementById('form_act_salida');
//actualiza

formactualizar.addEventListener('submit', (evt) => {
  evt.preventDefault();
  actualizar_Salida();
})

const actualizar_Salida = () => {
  const respuesta = fetchAPI(formactualizar, url+'/ventas/salida/actualizarSalida','POST')
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

//pdf
const obtener_pdf = (id) => {
  printPage(url+'/ventas/salida/generarpdf?atributo=Id_Folio&value='+id)
}

document.addEventListener('click',(evt)=>{
  
  if (evt.target.dataset.impresion){
    console.log(evt.target.dataset.impresion)
    obtener_pdf(evt.target.dataset.impresion)
  } 
});

(function (){
    obtener(); 
    
})()