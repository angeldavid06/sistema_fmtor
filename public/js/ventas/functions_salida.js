const render_salida = (json) => {
  const body = document.getElementsByClassName("body_salida");
  body[0].innerHTML = "";
  json.forEach((element) => {
    if (element.Salida != 0) {
      body[0].innerHTML +=
        "<tr>" +
        '<td><button class="material-icons btn btn-icon-self btn-transparent" title="Copiar información">copy_all</button></td>' +
        "<td>" + element.id_folio + "</td>" +
        "<td>" + element.razon_social +"</td>" +
        "<td>" + element.fecha + "</td>" +
        "<td>" + element.cantidad + "</td>" +
        "<td>" + element.no_parte + "</td>" +
        "<td>" + element.pedido_cliente + "</td>" +
        "<td>" + element.medida + "</td>" +
        "<td>" + element.descripcion + "</td>" +
        "<td>" + element.acabado + "</td>" +
        "<td class=txt-right>$ " + element.costo + "</td>" +
        "<td>" + element.factura + "</td>" +
        "<td>" + element.numero_dibujo + "</td>" +
        "<td>" + element.material + "</td>" +
        "<td>" + /*element.Id_Folio */ "</td>" +
        "<td>" + element.fecha_entrega + "</td>" + '<td><button class= "material-icons btn btn-amarillo btn-icon-self" data-modal="modal-actualizar" data-edit="'+element.Id_Folio +'"> mode_edit</button></td>' +
        '<td><button class= "material-icons btn btn-icon-self" data-impresion="' +element.id_folio +'">warehouse</button>';
    }
  });
};
const mostrarModal = (id) => {
  const respues = fetchAPI(
    "",
    url + "/ventas/salida/obtener_per?aux=" + id + "",
    ""
  );
  respues.then((json) => {
    pintarModal(json);
  });
};

const Salida = document.getElementById("Salida_edit");
const Id_Clientes_2 = document.getElementById("Id_Clientes_2_edit");
const Fecha = document.getElementById("Fecha_edit");
const Cantidad_millares = document.getElementById("Cantidad_millares_edit");
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

const pintarModal = (json) => {
  json.forEach((element) => {
    //
    Salida.value = element.Salida;
    Id_Clientes_2.value = element.Id_Clientes_2;
    Fecha.value = element.Fecha;
    Cantidad_millares.value = element.Cantidad_millares;
    Codigo.value = element.Codigo;
    Pedido_pza.value = element.Pedido_pza;
    Medida.value = element.Medida;
    Descripcion.value = element.Descripcion;
    Acabado.value = element.Acabado;
    Precio_millar.value = element.Precio_millar;
    Factura.value = element.Factura;
    Dibujo.value = element.Dibujo;
    Material.value = element.Material;
    Id_Folio.value = element.Id_Folio;
    Fecha_entrega.value = element.Fecha_entrega;
  });
};
const Salida_r = document.getElementById("Salida");
const Id_Clientes_2_r = document.getElementById("Id_Clientes_2");
const Fecha_r = document.getElementById("Fecha");
const Cantidad_millares_r = document.getElementById("Cantidad_millares");
const Codigo_r = document.getElementById("Codigo");
const Pedido_pza_r = document.getElementById("Pedido_pza");
const Medida_r = document.getElementById("Medida");
const Descripcion_r = document.getElementById("Descripcion");
const Acabado_r = document.getElementById("Acabado");
const Precio_millar_r = document.getElementById("Precio_millar");
const Factura_r = document.getElementById("Factura");
const Dibujo_r = document.getElementById("Dibujo");
const Material_r = document.getElementById("Material");
const Id_Folio_r = document.getElementById("Id_Folio");
const Fecha_entrega_r = document.getElementById("Fecha_entrega");

const nuevoRegistro = () => {
  Salida_r.value = "";
  Id_Clientes_2_r.value = "";
  Fecha_r.value = "";
  Cantidad_millares_r.value = "";
  Codigo_r.value = "";
  Pedido_pza_r.value = "";
  Medida_r.value = "";
  Descripcion_r.value = "";
  Acabado_r.value = "";
  Precio_millar_r.value = "";
  Factura_r.value = "";
  Dibujo_r.value = "";
  Material_r.value = "";
  Id_Folio_r.value = "";
  Fecha_entrega_r.value = "";
};

//posible copia de busqueda
document.addEventListener("click", (evt) => {
  if (evt.target.dataset.edit) {
    mostrarModal(evt.target.dataset.edit);
  }
});
//buscar
// const btn_buscar = document.getElementById("clave");
// btn_buscar.addEventListener("click", () => {
//   const input = document.getElementById("id_folio");
//   if (input.value == "") {
//     obtener();
//   } else {
//     obtener_clave_reporte(input.value);
//   }
// });

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
  nuevoRegistro();
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

const deshabilitar_inputs = () => {
  const f_inputs = document.getElementsByClassName("input");
  for (let i = 0; i < f_inputs.length; i++) {
    f_inputs[i].setAttribute("disabled", "");
  }
};

document.addEventListener("click", (evt) => {
  if (evt.target.dataset.recarga) {
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
  generar_fecha();
});