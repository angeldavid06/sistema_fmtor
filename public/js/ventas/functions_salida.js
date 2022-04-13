const meses = [
    "ENERO",
    "FEBRERO",
    "MARZO",
    "ABRIL",
    "MAYO",
    "JUNIO",
    "JULIO",
    "AGOSTO",
    "SEPTIEMBRE",
    "OCTUBRE",
    "NOVIEMBRE",
    "DICIEMBRE",
];
let auxiliar = 0;

//posible copia de busqueda

const obtener_clave_reporte = (clave) => {
    const respuesta = fetchAPI("",url + "/ventas/salida/buscar?clave=" + clave,"");
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

const buscar_historial = (salida) => {
    const respuesta = fetchAPI("",url + "/ventas/cotizacion/historial?id=" + salida,"");
    respuesta.then((json) => {
        render_historial(json);
    });
};

//pdf
const obtener_pdf = (id) => {
    printPage(url + "/ventas/salida/generarpdf?atributo=Id_Folio&value=" + id);
};

const obtener_cotizacion_pdf = (id) => {
    printPage(url + "/ventas/cotizacion/generarpdf?id=" + id);
};

const render_historial = (json) => {
    const body = document.getElementById("body_historial");
    body.innerHTML = "";
    json.forEach((el) => {
        body.innerHTML +=
        "<tr>" +
            "<td>" +el.no_parte +"</td>" +
            "<td>" +el.pedido_cliente +"</td>" +
            "<td>" +el.descripcion +"</td>" +
            "<td>" +el.medida +"</td>" +
            "<td>" +el.tratamiento +"</td>" +
            "<td class='txt-right'>" +el.factor +"</td>" +
            "<td>" +el.acabado +"</td>" +
            "<td>" +el.material +"</td>" +
            "<td class='txt-right'>" + new Intl.NumberFormat("es-MX").format(el.cantidad) +"</td>" +
            "<td class='txt-right'>$ " +new Intl.NumberFormat("es-MX").format(el.costo) +"</td>" +
            "<td>" +el.fecha_entrega +"</td>" +
            // '<td style="padding: 5px 0px 5px 5px;" ><button data-copiar="' +el.id_cotizacion +'" data-pedido="' +el.Id_Pedido +'" id="' +el.id_cotizacion +'" class="material-icons btn btn-icon-self btn-transparent" title="Copiar información">copy_all</button></td>' +
            // '<td style="padding: 5px 0px 5px 0px;" ><button data-pedidoact="' +el.Id_Pedido +'" id="' +el.Id_Pedido +'" data-modal="modal-actualizar" class="material-icons-outlined btn-amarillo btn btn-icon-self btn-transparent" title="Copiar información">edit</button></td>' +
            // '<td style="padding: 5px 0px;" ><button data-eliminar="'+el.Id_Pedido+'" class="material-icons-outlined btn btn-icon-self btn-rojo">delete</button></td>' +
        "</tr>";
    });
};

const restaurar_formulario = () => {
  const inputs_radio = document.getElementsByName("buscar_por");
  const inputs_radio_fecha = document.getElementsByName("buscar_por_fecha");
  for (let i = 0; i < inputs_radio.length; i++) {
    inputs_radio[i].checked = false;
  }

  for (let i = 0; i < inputs_radio_fecha.length; i++) {
    inputs_radio_fecha[i].checked = false;
  }

  const inputs = form_filtros.getElementsByClassName("input");
  for (let i = 0; i < inputs.length; i++) {
    inputs[i].value = "";
    inputs[i].setAttribute("disabled", "");
  }
};

document.addEventListener("click", (evt) => {
    if (evt.target.dataset.historial) {
        auxiliar = evt.target.dataset.historial;
        document.getElementById("numero_salida_almacen").innerHTML = "Salida de Almacen: " + evt.target.dataset.salida;
        buscar_historial(evt.target.dataset.historial);
    } else if (evt.target.dataset.recarga) {
        obtener();
        restaurar_formulario();
    } else if (evt.target.dataset.impresion) {
        obtener_pdf(evt.target.dataset.impresion);
    } else if (evt.target.dataset.cotizacion) {
        obtener_cotizacion_pdf(evt.target.dataset.cotizacion);
    } 
});

document.addEventListener("DOMContentLoaded", () => {
    obtener();
});