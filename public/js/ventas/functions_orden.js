const render_orden = (json) => {
  const body = document.getElementsByClassName("body_orden");
  body[0].innerHTML = "";
  json.forEach((element) => {
    if (element.Id_Folio != 1) {

        body[0].innerHTML +=
          "<tr>" +
          "<td>" +
          element.Id_Folio +
          "</td>" +
          "<td>" +
          element.Clientes +
          "</td>" +
          "<td>" +
          element.precio_millar +
          "</td>" +
          "<td>" +
          element.Fecha +
          "</td>" +
          "<td>" +
          element.descripcion +
          "</td>" +
          "<td>" +
          element.medida +
          "</td>" +
          "<td>" +
          element.cantidad_elaborar +
          "</td>" +
          "<td>" +
          element.acabados +
          "</td>" +
          "<td>" +
          element.Codigo +
          "</td>" +
          "<td>" +
          element.tratamiento +
          "</td>" +
          "<td>" +
          element.Id_Catalogo +
          "</td>" +
          "<td>" +
          element.material +
          "</td>" +
          "<td>" +
          element.Fecha_entrega +
          "</td>" +
          "<td>" +
          element.Id_Salida_FK +
          "</td>" +
          '<td><button class= "material-icons btn btn-icon-self" data-tarjeta="'+element.Id_Folio+'">account_tree</button></td>' +
          '<td><button class= "material-icons btn btn-icon-self btn-verde" data-imprimir="' + element.Id_Folio +'">print</button>' +
          '<td><button class= "material-icons btn btn-icon-self btn-amarillo" data-control="' + element.Id_Folio +'">calendar_view_month</button>' +
          "</tr>";
    }
  });
};
const mostrarModal = (id) => {
  const respues = fetchAPI(
    "",
    url + "/ventas/orden/obtener_per?aux=" + id + "",
    ""
  );
  respues.then((json) => {
    pintarModal(json);
  });
};

const Tratamiento = document.getElementById("Tratamiento_edit");
const Id_Folio = document.getElementById("id_folio_edit");

const pintarModal = (json) => {
  json.forEach((element) => {
    console.log(element);
    Tratamiento.value = element.Tratamiento;
    Id_Folio.value = element.Id_Folio;
  });
};

// const btn_buscar = document.getElementById("clave");
// btn_buscar.addEventListener("click", () => {
//   const input = document.getElementById("id_folio");
//   console.log(input.value);
//   console.log(input.id);
//   if (input.value == "") {
//     obtener();
//   } else {
//     obtener_clave_orden(input.value);
//   }
// });

const obtener_clave_orden = (clave) => {
  const respuesta = fetchAPI(
    "",
    url + "/ventas/orden/buscar?clave=" + clave,
    ""
  );
  respuesta.then((json) => {
    render_orden(json);
  });
};

//
const obtener = () => {
  const respuesta = fetchAPI("", url + "/ventas/orden/obtener", "");
  respuesta.then((json) => {
    render_orden(json);
  });
};

//pdfb
const pdf = (id) => {
  printPage(url + "/ventas/orden/pdforden?atributo=Id_Folio&value=" + id);
};

const generar_control_vacio = (valor) => {
  printPage(url + "/produccion/control/pdf_control_vacio?valor=" + valor);
};

const generar_tarjeta = (valor) => {
  printPage(url+'/ventas/tarjeta/pdftarjeta?value='+valor)
}

document.addEventListener("click", (evt) => {
  if (evt.target.dataset.imprimir) {
    console.log(evt.target.dataset.imprimir);
    pdf(evt.target.dataset.imprimir);
  }
});

document.addEventListener("click", (evt) => {
  if (evt.target.dataset.edit) {
    mostrarModal(evt.target.dataset.edit);
  } else if (evt.target.dataset.control) {
    generar_control_vacio(evt.target.dataset.control);
  } else if (evt.target.dataset.tarjeta) {
    generar_tarjeta(evt.target.dataset.tarjeta);
  }
});
const formactualizar = document.getElementById("form_act_orden");

formactualizar.addEventListener("submit", (evt) => {
  evt.preventDefault();
  actualizar_orden();
});

const actualizar_orden = () => {
  const respuesta = fetchAPI(
    formactualizar,
    url + "/ventas/orden/actualizarorden",
    "POST"
  );
  respuesta.then((json) => {
    console.log(json);
    if (json == 1) {
      open_alert("El registro ha sido actualizado correctamente", "verde");
      obtener();
    } else {
      open_alert("Error al actualizar el registro", "rojo");
    }
  });
};

(function () {
  obtener();
})();
