const render_cotizacion = (json) => {
  const body = document.getElementsByClassName('body_cotizacion');
  body[0].innerHTML = '';  
  json.forEach(element => {
      body[0].innerHTML += '<tr>'+
                              '<td>'+element.Id_Cotizacion+'</td>'+
                              '<td>'+element.Fecha+'</td>'+
                              '<td>'+element.Descripcion+'</td>'+
                              '<td>'+element.Medida+'</td>'+
                              '<td>'+element.Acabado+'</td>'+
                              '<td>'+element.Cantidad_millares+'</td>'+
                              '<td>'+element.Precio_millar+'</td>'+
                              '<td>'+element.Razon_social+'</td>'+
                              '<td>'+element.Total+'</td>'+
                              '<td>'+element.Importe+'</td>'+
                              '<td>'+element.iva+'</td>'+
                              '<td>'+element.total_neto+'</td>'+
                              '<td>'+element.Empleado+'</td>'+
                             
                              '<td><button class= "material-icons btn btn-icon-self"  data-modal="modal-actualizar" data-edit="'+element.Id_Cotizacion+'"> mode_edit</button>'+
                              '<td><button class= "material-icons btn btn-icon-self" onclick="eliminarRegistro('+element.Id_Cotizacion+')">delete</button>'+
                              '<td><button class= "material-icons btn btn-icon-self" data-impresion="'+element.Id_Cotizacion+'">print</button>'
                              +'<tr>';

  });
}

const mostrarModal = (id) =>{
  const respues = fetchAPI('',url+'/ventas/cotizacion/obtener_per?aux='+id+'','');
  respues.then(json => {
      pintarModal(json);
  });
}
const Id_Cotizacion     = document.getElementById('Id_Cotizacion_edit');
const Fecha             = document.getElementById('Fecha_edit');
const Descripcion       = document.getElementById('Descripcion_edit');
const Medida            = document.getElementById('Medida_edit');
const Acabado           = document.getElementById('Acabado_edit');
const Cantidad_millares = document.getElementById('Cantidad_millares_edit');
const Precio_millar     = document.getElementById('Precio_millar_edit');
const Id_Clientes_1     = document.getElementById('Id_Clientes_1_edit');
const Total             = document.getElementById('Total_edit');
const Importe           = document.getElementById('Importe_edit');
const iva               = document.getElementById('iva_edit');
const total_neto        = document.getElementById('total_neto_edit');
const Notas             = document.getElementById('Notas_edit');
const Empleado          = document.getElementById('Empleado_edit');

const pintarModal = (json) => {
  json.forEach(element =>{

    Id_Cotizacion.value     = element.Id_Cotizacion;
    Fecha.value             = element.Fecha;
    Descripcion.value       = element.Descripcion;
    Medida.value            = element.Medida;
    Acabado.value           = element.Acabado;
    Cantidad_millares.value = element.Cantidad_millares;
    Precio_millar.value     = element.Precio_millar;
      tablaCliente();
      Total.value           = element.Total;
      Importe.value         = element.Importe;
      iva.value             = element.iva;
      total_neto.value      = element.total_neto;
      Notas.value           = element.Notas;
      Empleado.value        = element.Empleado;
  })
}

const Id_Cotizacion_r      = document.getElementById('Id_Cotizacion');
const Fecha_r              = document.getElementById('Fecha');
const Descripcion_r        = document.getElementById('Descripcion');
const Medida_r             = document.getElementById('Medida');
const Acabado_r            = document.getElementById('Acabado')
const Cantidad_millares_r  = document.getElementById('Cantidad_millares');
const Precio_millar_r      = document.getElementById('Precio_millar');
const Id_Clientes_1_r      = document.getElementById('Id_Clientes_1');
const Total_r              = document.getElementById('Total');
const Importe_r            = document.getElementById('Importe');
const iva_r                = document.getElementById('iva');
const total_neto_r         = document.getElementById('total_neto');
const Notas_r              = document.getElementById('Notas');
const Empleado_r           = document.getElementById('Empleado');

const nuevoRegistro = () => {
  

      Fecha_r.value ='';
      Descripcion_r.value ='';
      Medida_r.value ='';
      Acabado_r.value ='';
      Cantidad_millares_r.value ='';
      Precio_millar_r.value ='';
      Id_Clientes_1_r.value ='';
      Total_r.value ='';
      Importe_r.value = '';
      iva_r.value     = '';
      total_neto_r.value = '';
      Notas_r.value ='';
      Empleado_r.value ='';
  
}

document.addEventListener('click',evt =>{
  if(evt.target.dataset.edit){
      mostrarModal(evt.target.dataset.edit);
  }else{
      if(evt.target.dataset.delete){
          
      }
  }
  
})
const obtener = (vista) =>{
  const respuesta = fetchAPI('',url+'/ventas/cotizacion/obtener','')
  respuesta.then(json => {
      render_cotizacion(json);
  })
  
};

const eliminarRegistro =(id)=>{
  const respuesta = fetchAPI('',url+'/ventas/cotizacion/eliminarCotizacion?dato='+id,'')
  respuesta.then(json => {
      obtener();
  })
  
};

const form = document.getElementById('form_reg_cotizacion');

form.addEventListener('submit', (evt) => {
  evt.preventDefault();
  insertarCotizacion();
  nuevoRegistro();
})

const insertarCotizacion = () => {
const respuesta = fetchAPI(form,url+'/ventas/cotizacion/NuevaCotizacion','POST')
respuesta.then(json => {
    window.location.reload();
    if (json == 1) {
        open_alert('El registro ha sido actualizado correctamente', 'verde')
        obtener();
    } else {
        open_alert('Error al actualizar el registro','rojo')
    }
  })
} 

const formactualizar = document.getElementById('form_act_cotizacion');

formactualizar.addEventListener('submit', (evt) => {
  evt.preventDefault();
  actualizar_Cotizacion();
})

const actualizar_Cotizacion = () => {
  const respuesta = fetchAPI(formactualizar, url+'/ventas/cotizacion/actualizarCotizacion','POST')
  respuesta.then(json => {
      if (json == 1) {
          open_alert('El registro ha sido actualizado correctamente', 'verde')
          obtener();
      } else {
          open_alert('Error al actualizar el registro','rojo')
      }
  })
}
//muestra Clientes
const tablaCliente = ()=>{
  const tabla=fetchAPI('',url+'/ventas/cotizacion/tablaCliente','');
    tabla.then(json=>{
      pintarCliente(json);
    })
  }
  
  const Cliente=document.getElementById('Id_Clientes_1');
  const Cliente_edit=document.getElementById('Id_Clientes_1_edit');
  const pintarCliente =(json)=>{
  json.forEach(element=>{
    const optionagregar=document.createElement('option');
    optionagregar.setAttribute("value",element.Id_Clientes);
    optionagregar.innerHTML=element.Razon_social;

    const option=document.createElement('option');
    option.setAttribute("value",element.Id_Clientes);
    option.innerHTML=element.Razon_social;
    Cliente_edit.appendChild(option);
    Cliente.appendChild(optionagregar); 
  })
}


  //pdf
const obtener_pdf = (id) => {
  printPage(url+'/ventas/cotizacion/generarpdf?atributo=Id_Cotizacion&value='+id)
}

document.addEventListener('click',(evt)=>{ 
  if (evt.target.dataset.impresion){
    obtener_pdf(evt.target.dataset.impresion)
  } 
});

(function (){
    obtener(); 
    tablaCliente();
})()