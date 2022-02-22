const meses = ['ENERO',
                'FEBRERO',
                'MARZO',
                'ABRIL',
                'MAYO',
                'JUNIO',
                'JULIO',
                'AGOSTO',
                'SEPTIEMBRE',
                'OCTUBRE',
                'NOVIEMBRE',
                'DICIEMBRE']

const colocar_cliente = (cliente) => {
  const select = document.getElementById("Id_Clientes_2");
  const options = select.getElementsByTagName('option');
  for (let i = 0; i < options.length; i++) {
      options[i].removeAttribute('selected')
  }
  for (let i = 0; i < options.length; i++) {
    if (options[i].textContent.trim() == cliente.trim()) {
      options[i].setAttribute('selected','')
    }
  }
}

const colocar_acabado = (acabado) => {
  const select = document.getElementById("Acabado");
  const select_2 = document.getElementById("Acabado_edit");
  const options = select.getElementsByTagName('option');
  const options_2 = select_2.getElementsByTagName('option');
  for (let i = 0; i < options.length; i++) {
    if (options[i].value == acabado) {
      options[i].setAttribute('selected','')
    }
  }
  for (let i = 0; i < options_2.length; i++) {
    if (options_2[i].value == acabado) {
      options_2[i].setAttribute('selected','')
    }
  }
}

const portapapeles_pegar = () => {
  navigator.clipboard.readText().then( clipText => {
    const textos = clipText.split(';')

    document.getElementById("Fecha_entrega").value = textos[13];
    colocar_cliente(textos[1]);
    // document.getElementById("Id_Clientes_2").value = textos[1];
    document.getElementById("Cantidad_millares").value = textos[4];
    document.getElementById("Codigo").value = textos[2];
    document.getElementById("Pedido_pza").value = textos[5];
    document.getElementById("Precio_millar").value = textos[9].split(' ')[1];
    if (textos[14] != '-') {
      document.getElementById("Dibujo").value = textos[11];
      document.getElementById("Medida").value = textos[6];
      document.getElementById("Descripcion").value = textos[7];
      
      colocar_acabado(textos[8]);

      document.getElementById("Material").value = textos[12];
      document.getElementById('cantidad_producir').value = textos[15];
    } else {
      document.getElementById("Dibujo").value = '';
      document.getElementById("Medida").value = '';
      document.getElementById("Descripcion").value = '';
      
      colocar_acabado('');

      document.getElementById("Material").value = '';
      document.getElementById('cantidad_producir').value = '';
    }
  });
}

const portapapeles_copiar = (el) => {
  const txt_salida = document.getElementById("td_id_folio_"+el);
  const txt_razon = document.getElementById("td_razon_"+el);
  const txt_fecha = document.getElementById("td_fecha_"+el);
  const txt_cantidad = document.getElementById("td_cantidad_"+el);
  const txt_el = document.getElementById("td_cantidad_el_"+el);
  const txt_parte = document.getElementById("td_no_parte_"+el);
  const txt_pedido = document.getElementById("td_pedido_"+el);
  const txt_medida = document.getElementById("td_medida_"+el);
  const txt_descripcion = document.getElementById("td_descripcion_"+el);
  const txt_acabado = document.getElementById("td_acabado_"+el);
  const txt_costo = document.getElementById("td_costo_"+el);
  const txt_factura = document.getElementById("td_factura_"+el);
  const txt_dibujo = document.getElementById("td_dibujo"+el);
  const txt_material = document.getElementById("td_material"+el);
  const txt_entrega = document.getElementById("td_entrega_"+el);
  const txt_op = document.getElementById("td_id_folio_"+el);
  
  const texto_copiado = txt_salida.textContent.trim()+';'+ 
                        txt_razon.textContent.trim()+';'+
                        txt_parte.textContent.trim()+';'+
                        txt_fecha.textContent.trim()+';'+
                        txt_cantidad.textContent.trim()+';'+
                        txt_pedido.textContent.trim()+';'+
                        txt_medida.textContent.trim()+';'+
                        txt_descripcion.textContent.trim()+';'+
                        txt_acabado.textContent.trim()+';'+
                        txt_costo.textContent.trim()+';'+
                        txt_factura.textContent.trim()+';'+
                        txt_dibujo.textContent.trim()+';'+
                        txt_material.textContent.trim()+';'+
                        txt_entrega.textContent.trim()+';'+
                        txt_op.textContent.trim()+';'+
                        txt_el.textContent.trim();

  navigator.clipboard.writeText(texto_copiado).then(function () {
    open_alert("Copiado!",'azul');
  }, function () {
      open_alert("Contenido no copiado",'naranja');
  });
}

const render_salida = (json) => {
  let aux = 0;
  let total_acumulado = 0;
  let total_acumulado_mensual = 0;
  const body = document.getElementsByClassName("body_salida");
  body[0].innerHTML = "";
  json['salidas'].forEach((element) => {
    const tr_mes = document.createElement("tr");
    const tr_totales = document.createElement("tr");
    let fecha = element.fecha.split("-");

    if (aux > 0 && mes != (fecha[0]+'-'+fecha[1]) && (fecha[0]+'-'+fecha[1]) != '0000-00') {
        tr_totales.innerHTML = '<tr>'+
                                    '<td class="txt-right" colspan="11">Total mensual: </td>'+
                                    '<td class="txt-right">$ '+ new Intl.NumberFormat('es-MX').format(total_acumulado_mensual)+'</td>'+
                                    '<td colspan="8"></td>'+
                                '</tr>';
        body[0].appendChild(tr_totales)
        total_acumulado += parseFloat(total_acumulado_mensual)
        total_acumulado_mensual = 0
        total_acumulado_mensual += (parseFloat(element.costo) * parseFloat(element.cantidad))
    } else {
        total_acumulado_mensual += (parseFloat(element.costo) * parseFloat(element.cantidad))
    }

    if (aux == 0 || mes != (fecha[0]+'-'+fecha[1]) && (fecha[0]+'-'+fecha[1]) != '0000-00') {
        tr_mes.innerHTML = '<tr><td class="txt-center" colspan="20">'+meses[fecha[1]-1]+' '+fecha[0]+'</td></tr>'
        mes = (fecha[0]+'-'+fecha[1])
        aux++;
        body[0].appendChild(tr_mes)
    }
    const info = {
      op: '-', 
      medida: '-',
      descripcion: '-',
      acabado: '-',
      plano: '-',
      estado: '-',
      material: '-',
      cantidad: '0'
    };
    json['ordenes'].forEach((orden) => {
      if (orden.Id_Salida_FK_1 == element.id_folio) {
          info.op = orden.Id_Folio; 
          info.plano = orden.Id_Catalogo;
          info.estado = orden.estado_general;
          info.cantidad = orden.cantidad_elaborar;
        }
    })
    if (element.Salida != 0) {
      body[0].innerHTML +=
        "<tr>" +
          '<td><button data-copiar="'+element.id_folio+'" id="'+element.id_folio+'" class="material-icons btn btn-icon-self btn-transparent" title="Copiar información">copy_all</button></td>' +
          '<td><button class= "material-icons btn btn-amarillo btn-icon-self" data-modal="modal-actualizar" data-edit="'+element.id_folio +'"> mode_edit</button></td>' +
          '<td><button class= "material-icons btn btn-transparent btn-icon-self" data-impresion="' +element.id_folio +'">warehouse</button>'+
          '<td><button class= "material-icons btn btn-transparent btn-icon-self" data-impresion="' +element.id_folio +'">request_quote</button>'+
          "<td id='td_id_folio_"+element.id_folio+"'>"+element.id_folio + "</td>" +
          "<td id='td_razon_"+element.id_folio+"'>"+element.razon_social +"</td>" +
          "<td id='td_fecha_"+element.id_folio+"'>"+element.fecha + "</td>" +
          "<td id='td_cantidad_"+element.id_folio+"'>"+element.cantidad + "</td>" +
          "<td id='td_cantidad_el_"+element.id_folio+"'>"+info.cantidad + "</td>" +
          "<td id='td_no_parte_"+element.id_folio+"'>"+element.no_parte + "</td>" +
          "<td id='td_pedido_"+element.id_folio+"'>"+element.pedido_cliente + "</td>" +
          "<td id='td_medida_"+element.id_folio+"'>"+element.medida + "</td>" +
          "<td id='td_descripcion_"+element.id_folio+"'>" + element.descripcion + "</td>" +
          "<td id='td_acabado_"+element.id_folio+"'>" + element.acabados + "</td>" +
          "<td id='td_costo_"+element.id_folio+"' class=txt-right>$ " + element.costo + "</td>" +
          "<td id='td_factura_"+element.id_folio+"'>" + element.factura + "</td>" +
          "<td id='td_dibujo"+element.id_folio+"'>" + info.plano + "</td>" +
          "<td id='td_material"+element.id_folio+"'>" + element.material + "</td>" +
          "<td id='td_"+element.id_folio+"'>" + info.op + "</td>" +
          "<td id='td_entrega_"+element.id_folio+"'>" + element.fecha_entrega + "</td>" + 
        '</tr>';
    }
  });
    const tr_totales = document.createElement('tr')
    tr_totales.innerHTML = '<tr>'+
                                '<td class="txt-right" colspan="11">Total mensual: </td>'+
                                '<td class="txt-right">$ '+new Intl.NumberFormat('es-MX').format(total_acumulado_mensual)+'</td>'+
                                '<td colspan="8"></td>'+
                            '</tr>';
    body[0].appendChild(tr_totales)
    total_acumulado += parseFloat(total_acumulado_mensual);
    total_acumulado_mensual = 0
    
    const table = document.getElementById('table')
    
    if (document.getElementById("pie")) {
      const pie = document.getElementById("pie");
      table.removeChild(pie)
    }

    const tfoot = document.createElement('tfoot');
    tfoot.setAttribute('id','pie')
    tfoot.classList.add('tfoot')
    tfoot.innerHTML = '<tr>'+
                            '<td class="txt-right" colspan="11">Total: </td>'+
                            '<td class="txt-right">$ ' + new Intl.NumberFormat('es-MX').format(total_acumulado) + '</td>'+
                            '<td colspan="8"></td>'+
                    '</tr>';
    table.appendChild(tfoot)
};

const mostrarModal = (id) => {
  const respues = fetchAPI("",url + "/ventas/salida/obtener_per?aux=" + id + "","");
  respues.then((json) => {
    pintarModal(json,id);
  });
};

const Salida = document.getElementById("Salida_edit");
const Id_Clientes_2 = document.getElementById("Id_Clientes_2_edit");
const Fecha = document.getElementById("Fecha_edit");
const Cantidad_millares = document.getElementById("Cantidad_millares_edit");
const Cantidad_elaborar = document.getElementById("cantidad_producir_edit");
const Codigo = document.getElementById("Codigo_edit");
const Pedido_pza = document.getElementById("Pedido_pza_edit");
const Medida = document.getElementById("Medida_edit");
const Descripcion = document.getElementById("Descripcion_edit");
const Acabado = document.getElementById("Acabado_edit");
const Precio_millar = document.getElementById("Precio_millar_edit");
const Factura = document.getElementById("Factura_edit");
const Dibujo = document.getElementById("Dibujo_edit");
const Material = document.getElementById("Material_edit");
const Id_Folio = document.getElementById("Id_Folio_edit");
const Fecha_entrega = document.getElementById("Fecha_entrega_edit");

const pintarModal = (json,id) => {
  json['salida'].forEach((element) => {
    Salida.value = id
    Id_Clientes_2.value = element.Id_Clientes_2;
    Fecha.value = element.fecha;
    Cantidad_millares.value = element.cantidad;
    Codigo.value = element.no_parte;
    Pedido_pza.value = element.pedido_cliente;
    Medida.value = element.medida;
    Descripcion.value = element.descripcion;
    Precio_millar.value = element.costo;
    Factura.value = element.factura;
    Fecha_entrega.value = element.fecha_entrega;
    colocar_acabado(element.acabados);
    colocar_cliente_2(element.razon_social)
    json['ordenes'].forEach(orden => {
      if (orden.Id_Salida_FK_1 == element.id_folio) {
        Dibujo.value = orden.Id_Catalogo;
        Material.value = orden.material;
        Cantidad_elaborar.value = orden.cantidad_elaborar;
      }
    })
  });
};

const colocar_cliente_2 = (cliente) => {
  const select = document.getElementById("Id_Clientes_2_edit");
  const options = select.getElementsByTagName('option');
  for (let i = 0; i < options.length; i++) {
      options[i].removeAttribute('selected')
  }
  for (let i = 0; i < options.length; i++) {
    if (options[i].textContent.trim() == cliente.trim()) {
      options[i].setAttribute('selected','')
    }
  }
}


//posible copia de busqueda
document.addEventListener("click", (evt) => {
  if (evt.target.dataset.edit) {
    mostrarModal(evt.target.dataset.edit);
  }
});

const obtener_clave_reporte = (clave) => {
  const respuesta = fetchAPI(
    "",
    url + "/ventas/salida/buscar?clave=" + clave,
    ""
  );
  respuesta.then((json) => {
    render_salida(json);
  });
};

//vista
const obtener = () => {
  const respuesta = fetchAPI("", url + "/ventas/salida/obtener", "");
  respuesta.then((json) => {
    render_salida(json);
  });
};

//eliminar
const eliminarRegistro = (id) => {
  const respuesta = fetchAPI(
    "",
    url + "/ventas/salida/eliminarSalida?dato=" + id,
    ""
  );
  respuesta.then((json) => {
    obtener();
  });
};
//ingresar
const form = document.getElementById("form_reg_salida");

form.addEventListener("submit", (evt) => {
  evt.preventDefault();
  insertarSalida();
});

const insertarSalida = () => {
  const respuesta = fetchAPI(form, url + "/ventas/salida/NuevaSalida", "POST");
  respuesta.then((json) => {
    if (json == 1) {
      open_alert("El registro ha sido actualizado correctamente", "verde");
      obtener();
    } else {
      open_alert("Error al actualizar el registro", "rojo");
    }
  });
};

const formactualizar = document.getElementById("form_act_salida");
//actualiza

formactualizar.addEventListener("submit", (evt) => {
  evt.preventDefault();
  actualizar_Salida();
});

const actualizar_Salida = () => {
  const respuesta = fetchAPI(
    formactualizar,
    url + "/ventas/salida/actualizarSalida",
    "POST"
  );
  respuesta.then((json) => {
    if (json == 1) {
      open_alert("El registro ha sido actualizado correctamente", "verde");
      obtener();
    } else {
      open_alert("Error al actualizar el registro", "rojo");
    }
  });
};

//pdf
const obtener_pdf = (id) => {
  printPage(url + "/ventas/salida/generarpdf?atributo=Id_Folio&value=" + id);
};

// const deshabilitar_inputs = () => {
//   const f_inputs = document
//     .getElementById("form-filtros")
//     .getElementsByClassName("input");
//   for (let i = 0; i < f_inputs.length; i++) {
//     f_inputs[i].setAttribute("disabled", "");
//   }
// };

document.addEventListener("click", (evt) => {
  if (evt.target.dataset.pegar) {
    portapapeles_pegar()
  } else if (evt.target.dataset.copiar) {
    portapapeles_copiar(evt.target.dataset.copiar);
  } else if (evt.target.dataset.recarga) {
    obtener()
  } else if (evt.target.dataset.impresion) {
    obtener_pdf(evt.target.dataset.impresion);
  } else  if (evt.target.dataset.radio) {
    deshabilitar_inputs();

    if (document.getElementById("f_" + evt.target.value)) {
      const $f_input = document.getElementById("f_" + evt.target.value);
      $f_input.removeAttribute("disabled", "");
    }

    if (
      evt.target.value.split("_").length > 1 &&
      evt.target.value.split("_")[0] == "rango"
    ) {
      const $f_input_m = document.getElementById(
        "f_r_" + evt.target.value.split("_")[1] + "_m"
      );
      $f_input_m.removeAttribute("disabled", "");
      const $f_input_M = document.getElementById(
        "f_r_" + evt.target.value.split("_")[1] + "_M"
      );
      $f_input_M.removeAttribute("disabled", "");
    }
  }
});

const obtener_clientes = () => {
  const respuesta = fetchAPI('',url+'/ventas/salida/obtener_clientes','')
  respuesta.then(json => {
    json.forEach(el => {
      document.getElementById('Id_Clientes_2').innerHTML += '<option value="'+el.Id_Clientes+'">'+el.Razon_social+'</option>'
      document.getElementById('Id_Clientes_2_edit').innerHTML += '<option value="'+el.Id_Clientes+'">'+el.Razon_social+'</option>'
    })
  })
}

const generar_fecha = () => {
  const fecha_actual = new Date().toLocaleDateString();
  const fecha = fecha_actual.split('/');
  let aux = fecha[2] + '-';

  if (parseInt(fecha[1]) < 10) {
    aux += ('0'+fecha[1]) + '-';
  } else {
    aux += fecha[1] + '-';
  }
  
  if (parseInt(fecha[0]) < 10) {
    aux += ('0'+fecha[0]);
  } else {
    aux += fecha[0];
  }

  document.getElementById('Fecha').value = aux;
} 

document.addEventListener('DOMContentLoaded', () => {
  obtener();
  obtener_clientes();
  generar_fecha();
});