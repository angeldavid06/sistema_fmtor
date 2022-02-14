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
          element.Razon_social +
          "</td>" +
          "<td>" +
          element.Precio_millar +
          "</td>" +
          "<td>" +
          element.Fecha +
          "</td>" +
          "<td>" +
          element.Descripcion +
          "</td>" +
          "<td>" +
          element.Medida +
          "</td>" +
          "<td>" +
          element.Cantidad_millares +
          "</td>" +
          "<td>" +
          element.Acabado +
          "</td>" +
          "<td>" +
          element.Codigo +
          "</td>" +
          "<td>" +
          element.Tratamiento +
          "</td>" +
          "<td>" +
          element.Dibujo +
          "</td>" +
          "<td>" +
          element.Material +
          "</td>" +
          "<td>" +
          element.Fecha_entrega +
          "</td>" +
          "<td>" +
          element.Salida +
          "</td>" +
          '<td><button class= "material-icons btn btn-icon-self" data-modal="modal-actualizar" data-edit="' +element.Id_Folio +'"> app_registration</button></td>' +
          '<td><button class= "material-icons btn btn-icon-self btn-verde" data-imprimir="' + element.Id_Folio +'">print</button>' +
          '<td><button class= "material-icons btn btn-icon-self btn-amarillo" data-imprimir="' + element.Id_Folio +'">calendar_view_month</button>' +
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

console.log(Tratamiento);

const pintarModal = (json) => {
  json.forEach((element) => {
    console.log(element);

    //

    Tratamiento.value = element.Tratamiento;
    Id_Folio.value = element.Id_Folio;
  });
};

const btn_buscar = document.getElementById("clave");
btn_buscar.addEventListener("click", () => {
  const input = document.getElementById("id_folio");
  console.log(input.value);
  console.log(input.id);
  if (input.value == "") {
    obtener();
  } else {
    obtener_clave_orden(input.value);
  }
});

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

//pdf
const pdf = (id) => {
  printPage(url + "/ventas/orden/pdforden?atributo=Id_Folio&value=" + id);
};

document.addEventListener("click", (evt) => {
  if (evt.target.dataset.imprimir) {
    console.log(evt.target.dataset.imprimir);
    pdf(evt.target.dataset.imprimir);
  }
});

document.addEventListener("click", (evt) => {
  if (evt.target.dataset.edit) {
    mostrarModal(evt.target.dataset.edit);
  } else {
    if (evt.target.dataset.delete) {
    }
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
