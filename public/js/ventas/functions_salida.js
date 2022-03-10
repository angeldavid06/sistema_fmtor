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
let auxiliar = 0;

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

const colocar_acabado = (acabado,j) => {
  const select = document.getElementById("Acabado_"+j);
  const select_2 = document.getElementById("Acabado_p");
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

const colocar_informacion_op = (op,contador) => {
  document.getElementById('cantidad_producir_' + contador).value = op[0].cantidad_elaborar;
  document.getElementById('Dibujo_' + contador).value = op[0].Id_Catalogo;
}

const colocar_informacion_sin_op = (op,contador) => {
  document.getElementById('sin_op_' + contador).setAttribute('checked','');
}

const colocar_informacion_tornillos = (salida) => {
  let i = 1;
  salida.forEach(el => {
    document.getElementById("Fecha_entrega_" + i).value = el.fecha_entrega;
    document.getElementById("Codigo_" + i).value = el.no_parte;
    document.getElementById("Pedido_pza_" + i).value = el.pedido_cliente;
    document.getElementById("Cantidad_millares_" + i).value = el.cantidad;
    document.getElementById("Precio_millar_" + i).value = el.costo;
    document.getElementById("Medida_" + i).value = el.medida;
    document.getElementById("Descripcion_" + i).value = el.descripcion;
    colocar_acabado(el.acabados,i);
    document.getElementById("Material_" + i).value = el.material;
    i++;
  })
}

const portapapeles_pegar_tornillo = (form) => {
 navigator.clipboard.readText().then((clipText) => {
    const json = JSON.parse(clipText);
    const pedido = json["pedido"];

    pedido.forEach(el => {
      const info = {
        cantidad: '0',
        dibujo: '' 
      };
      json['ordenes'].forEach((orden) => {
        if (orden.Id_Pedido == el.Id_Pedido) {
          info.dibujo = orden.Id_Catalogo;
          info.cantidad = orden.cantidad_elaborar;
        }
      })
      document.getElementById("Fecha_entrega_" +form).value = el.fecha_entrega;
      document.getElementById("Codigo_" + form).value = el.no_parte;
      document.getElementById("Pedido_pza_" + form).value = el.pedido_cliente;
      document.getElementById("Cantidad_millares_" + form).value = el.cantidad;
      document.getElementById("Precio_millar_" + form).value = el.costo;
      document.getElementById("Medida_" + form).value = el.medida;
      document.getElementById("Descripcion_" + form).value = el.descripcion;
      document.getElementById("factor_" + form).value = el.Factor;
      colocar_acabado(el.acabados,form);
      document.getElementById("Material_" + form).value = el.material;
      document.getElementById('Dibujo_' + form).value = info.dibujo;
      document.getElementById('cantidad_producir_' + form).value = info.cantidad;
    })
  });
}

const portapapeles_pegar_cliente = () => {
  navigator.clipboard.readText().then((clipText) => {
    const json = JSON.parse(clipText);
    const salida = json["salida"];

    // document.getElementById("Fecha_entrega").value = salida[0].fecha_entrega;
    colocar_cliente(salida[0].razon_social);
    // document.getElementById("Codigo").value = salida[0].no_parte;
    // document.getElementById("Pedido_pza").value = salida[0].pedido_cliente;
  });
}

const portapapeles_pegar = () => {
  navigator.clipboard.readText().then(clipText => {
    const json = JSON.parse(clipText)
    const salida = json['salida']
    const ordenes = json['ordenes']
    let op = [];
    let aux = false;
    let contador = 1;
    
    colocar_cliente(salida[0].razon_social);
    document.getElementById("Cantidad_Tornillos").value = salida.length;
    vaciar_tornillos()
    render_form_tornillo(salida.length)
    colocar_informacion_tornillos(salida);

    salida.forEach(el => {
      ordenes.forEach((orden) => {
        if (orden.Id_Pedido == el.Id_Pedido) {
          op.push(orden)
          aux = true;
        }
      })
      if (aux) {
        colocar_informacion_op(op,contador);
        contador++;
      } else {
        colocar_informacion_sin_op(op,contador)
        contador++;
      }
      aux = false
    });
  });
}

const portapapeles_copiar = (el,pedido) => {
  const respuesta = fetchAPI("", url + "/ventas/salida/obtener_per?aux="+el+"&pedido="+pedido,'');
  respuesta.then(json => {
    let string = JSON.stringify(json)
    navigator.clipboard.writeText(string).then(function () {
      open_alert("Copiado!",'azul');
    }, function () {
        open_alert("Contenido no copiado",'naranja');
    });
  })
}

const render_historial = (json) => {
  const body = document.getElementById('body_historial')
  body.innerHTML = ''
  json['salida'].forEach(el => {
    const info = {
      op: '-', 
      plano: '-',
      estado: '-',
      material: '-',
      factor: '0'
    };
    json['ordenes'].forEach((orden) => {
      if (orden.Id_Pedido == el.Id_Pedido) {
        info.op = orden.Id_Folio;
        info.plano = orden.Id_Catalogo;
        info.estado = orden.estado_general;
        info.factor = orden.factor;
      }
    })
    body.innerHTML += '<tr>'+
                        '<td style="padding: 5px;" ><button data-copiar="'+el.id_folio+'" data-pedido="'+el.Id_Pedido+'" id="'+el.id_folio+'" class="material-icons btn btn-icon-self btn-transparent" title="Copiar información">copy_all</button></td>'+
                        '<td style="padding: 5px;" ><button data-pedidoact="'+el.Id_Pedido+'" id="'+el.id_folio+'" data-modal="modal-actualizar" class="material-icons btn btn-icon-self btn-transparent" title="Copiar información">edit</button></td>'+
                        '<td>'+info.op+'</td>'+
                        '<td>'+info.factor+'</td>'+
                        '<td>'+el.descripcion+'</td>'+
                        '<td>'+el.medida+'</td>'+
                        '<td>'+el.acabados+'</td>'+
                        '<td>'+el.material+'</td>'+
                        '<td>'+el.cantidad+'</td>'+
                        '<td>'+el.no_parte+'</td>'+
                        '<td>'+el.pedido_cliente+'</td>'+
                        '<td>'+el.costo+'</td>'+
                        '<td>'+info.plano+'</td>'+
                        '<td>'+el.fecha_entrega+'</td>'+
                      '</tr>'
  })
}

const buscar_historial = (salida) => {
  const respuesta = fetchAPI('',url+'/ventas/salida/historial?salida='+salida,'')
  respuesta.then(json => {
    render_historial(json)
  })
}

const render_salida = (json) => {
  let aux = 0;
  const body = document.getElementsByClassName("body_salida");
  body[0].innerHTML = "";
  json['salidas'].forEach((element) => {
    const tr_mes = document.createElement("tr");
    let fecha = element.fecha.split("-");
    if (aux == 0 || mes != (fecha[0]+'-'+fecha[1]) && (fecha[0]+'-'+fecha[1]) != '0000-00') {
        tr_mes.innerHTML = '<tr><td class="txt-center" colspan="8">'+meses[fecha[1]-1]+' '+fecha[0]+'</td></tr>'
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
      if (orden.Id_Pedido == element.Id_Pedido) {
        info.op = orden.Id_Folio;
        info.plano = orden.Id_Catalogo;
        info.estado = orden.estado_general;
        info.cantidad = orden.cantidad_elaborar;
      }
    })

    if (element.Salida != 0) {
      body[0].innerHTML +=
        "<tr>" +
          "<td id='td_id_folio_"+element.id_folio+"'>"+element.id_folio + "</td>" +
          "<td id='td_razon_"+element.id_folio+"'>"+element.razon_social +"</td>" +
          "<td id='td_fecha_"+element.id_folio+"'>"+element.fecha + "</td>" + 
          '<td style="padding: 5px;" ><button title="Editar Salida de Almacen" class="material-icons-outlined btn btn-amarillo btn-icon-self" data-modal="modal-actualizar-salida" data-salida="'+element.id_folio +'"> mode_edit</button></td>' +
          '<td style="padding: 5px;" ><button data-copiar="'+element.id_folio+'" id="'+element.id_folio+'" class="material-icons btn btn-icon-self btn-transparent" title="Copiar información">copy_all</button></td>' +
          '<td style="padding: 5px;" ><button data-historial="'+element.id_folio+'" data-modal="modal-historial" id="'+element.id_folio+'" class="material-icons-outlined btn btn-icon-self btn-transparent" title="Copiar información">more_vert</button></td>' +
          '<td style="padding: 5px;" ><button title="Generar Salida de Almacen" class= "material-icons-outlined btn btn-icon-self" data-impresion="' +element.id_folio +'">warehouse</button>'+
          '<td style="padding: 5px;" ><button title="Generar Cotización" class= "material-icons-outlined btn btn-icon-self" data-cotizacion="' +element.id_folio +'">request_quote</button>'+
          '</tr>';
    }
  });
};

const mostrarModal = (id) => {
  const respues = fetchAPI("",url + "/ventas/salida/obtener_per?aux=" + id + "","");
  respues.then((json) => {
    pintarModal(json,id);
  });
};

const render_pedido = (json) => {
  json['pedido'].forEach((el) => {
    document.getElementById("Pedido_p").value = el.Id_Pedido;
    document.getElementById("Cantidad_millares_p").value = el.cantidad;
    document.getElementById("Codigo_p").value = el.no_parte;
    document.getElementById("Pedido_pza_p").value = el.pedido_cliente;
    document.getElementById("Medida_p").value = el.medida;
    document.getElementById("Descripcion_p").value = el.descripcion;
    document.getElementById("Acabado_p").value = el.acabados;
    document.getElementById("Precio_millar_p").value = el.costo;
    document.getElementById("Material_p").value = el.material;
    document.getElementById("Fecha_entrega_p").value = el.fecha_entrega;
    document.getElementById("factor_p").value = el.Factor;
  });

  if (json["orden"].length > 0) {
    json["orden"].forEach((el) => {
      document.getElementById("op_cancelar").removeAttribute("disabled", "");
      document.getElementById("tratamiento_p").removeAttribute("disabled", "");
      document.getElementById("cantidad_producir_p").removeAttribute("disabled", "");
      document.getElementById("Dibujo_p").removeAttribute("disabled", "");
      document.getElementById("cantidad_producir_p").value = el.cantidad_elaborar;
      document.getElementById("Dibujo_p").value = el.Id_Catalogo;
      if (el.tratamiento == "T/TERMICO") {
        document.getElementById("tratamiento_p").setAttribute("checked", "");
      }
    });
  } else {
    document.getElementById("sin_op_p").setAttribute("checked", "");
    document.getElementById("tratamiento_p").removeAttribute("checked", "");
    document.getElementById("op_cancelar").setAttribute("disabled", "");
    document.getElementById("tratamiento_p").setAttribute("disabled", "");
    document.getElementById("cantidad_producir_p").value = 0;
    document.getElementById("cantidad_producir_p").setAttribute('disabled','');
    document.getElementById("Dibujo_p").value = '';
    document.getElementById("Dibujo_p").setAttribute("disabled", "");
  }
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

const colocar_cliente_3 = (cliente) => {
  const select = document.getElementById("Id_Clientes_2_e");
  const options = select.getElementsByTagName('option');
  for (let i = 0; i < options.length; i++) {
      options[i].removeAttribute('selected')
  }
  for (let i = 0; i < options.length; i++) {
    if (options[i].value == cliente) {
      options[i].setAttribute('selected','')
    }
  }
}

const obtener_salida = (id_folio) => {
  const respuesta = fetchAPI('',url+'/ventas/salida/obtener_salida?aux='+id_folio,'')
  respuesta.then(json => {
    if (json.length > 0) {
      json.forEach(el => {
        document.getElementById('Fecha_e').value = el.Fecha
        document.getElementById('Salida_e').value = el.Id_Folio
        colocar_cliente_3(el.Id_Clientes_FK)
      })
    }
  })
}

const obtener_pedido = (id_pedido) => {
  const respuesta = fetchAPI('',url+'/ventas/salida/obtener_pedido?pedido='+id_pedido,'')
  respuesta.then(json => {
    render_pedido(json);
  })
}

//posible copia de busqueda
document.addEventListener("click", (evt) => {
  if (evt.target.dataset.edit) {
    mostrarModal(evt.target.dataset.edit);
  } else if (evt.target.dataset.salida) {
    obtener_salida(evt.target.dataset.salida);
  } else if (evt.target.dataset.pedidoact) {
    obtener_pedido(evt.target.dataset.pedidoact)
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
  open_confirm("¿Esta seguro de guardar la Salida de Almacen?", insertarSalida);
});

const limpiar_formulario = (form) => {
  const inputs = form.getElementsByClassName('input')
  for (let i = 1; i < inputs.length; i++) {
    inputs[i].value = ''
  }
  render_form_tornillo(1)
  document.getElementById("Cantidad_Tornillos").value = 1;
}

document.getElementById('btn-limpiar').addEventListener('click', () => {
  limpiar_formulario(form);
})

const insertarSalida = () => {
  const respuesta = fetchAPI(form, url + "/ventas/salida/NuevaSalida", "POST");
  respuesta.then((json) => {
    if (json == 1) {
      limpiar_formulario(form);
      open_alert("El registro ha sido actualizado correctamente", "verde");
      obtener();
    } else {
      open_alert("Error al actualizar el registro", "rojo");
    }
  });
};

const formactualizar = document.getElementById("form_act_salida");
const formactualizarsolo = document.getElementById("form_act_solo_salida");
//actualiza

formactualizar.addEventListener("submit", (evt) => {
  evt.preventDefault();
  open_confirm('¿Esta seguro de guardar los cambios?',actualizar_Salida)
});

formactualizarsolo.addEventListener("submit", (evt) => {
  evt.preventDefault();
  actualizar_solo_salida();
});

const actualizar_solo_salida = () => {
  const respuesta = fetchAPI(formactualizarsolo,url+'/ventas/salida/actualizar_solo_salida','POST')
  respuesta.then(json =>{ 
    if (json == 1) {
      open_alert('Actualización correcta','verde')
      document.getElementById("modal-actualizar-salida").classList.remove('abrir_modal');
      obtener();
    } else {
      open_alert('No se pudo actualizar','rojo')
    }
  })
}

const actualizar_Salida = () => {
  const respuesta = fetchAPI(formactualizar,url + "/ventas/salida/actualizarSalida","POST");
  respuesta.then((json) => {
    if (json == 1) {
      open_alert("El registro ha sido actualizado correctamente", "verde");
      buscar_historial(auxiliar);
      abrir_modal("modal-actualizar");
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

const obtener_cotizacion_pdf = (id) => {
  printPage(url + "/ventas/cotizacion/generarpdf?id=" + id);
};

const restaurar_formulario = () => {
  const inputs_radio = document.getElementsByName("buscar_por");
  for (let i = 0; i < inputs_radio.length; i++) {
    inputs_radio[i].checked = false;
  }

  const inputs = document.getElementsByClassName("input");
  for (let i = 0; i < inputs.length; i++) {
    inputs[i].value = "";
    inputs[i].setAttribute('disabled','')
  }
};

document.addEventListener("click", (evt) => {
  if (evt.target.dataset.historial) {
    auxiliar = evt.target.dataset.historial;
    document.getElementById("numero_salida_almacen").innerHTML = 'Salida de Almacen: '+evt.target.dataset.historial;
    buscar_historial(evt.target.dataset.historial);
  } else if (evt.target.dataset.p) {
    portapapeles_pegar_tornillo(evt.target.dataset.p)
  } else if (evt.target.dataset.pegar) {
    if (evt.target.dataset.pegar == 'pegar-todo') {
      portapapeles_pegar()
    } else if (evt.target.dataset.pegar == 'pegar-cliente') {
      portapapeles_pegar_cliente();
    }
  } else if (evt.target.dataset.tornillo) {
    if (evt.target.dataset.tornillo == "mas") {
      tornillo_mas();
    } else if (evt.target.dataset.tornillo == "menos") {
      tornillo_menos();
    }
  } else if (evt.target.dataset.copiar) {
    portapapeles_copiar(evt.target.dataset.copiar, evt.target.dataset.pedido);
  } else if (evt.target.dataset.recarga) {
    obtener();
    restaurar_formulario()
  } else if (evt.target.dataset.impresion) {
    obtener_pdf(evt.target.dataset.impresion);
  } else if (evt.target.dataset.cotizacion) {
    obtener_cotizacion_pdf(evt.target.dataset.cotizacion);
  } else if (evt.target.dataset.radio) {
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
      // document.getElementById('Id_Clientes_2_edit').innerHTML += '<option value="'+el.Id_Clientes+'">'+el.Razon_social+'</option>'
      document.getElementById('Id_Clientes_2_e').innerHTML += '<option value="'+el.Id_Clientes+'">'+el.Razon_social+'</option>'
      document.getElementById('f_cliente').innerHTML += '<option value="'+el.Razon_social+'">'+el.Razon_social+'</option>'
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