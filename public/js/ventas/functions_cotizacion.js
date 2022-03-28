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
            "<td class='txt-right'>" +el.factor +"</td>" +
            "<td>" +el.acabado +"</td>" +
            "<td>" +el.material +"</td>" +
            "<td class='txt-right'>" + new Intl.NumberFormat("es-MX").format(el.cantidad) +"</td>" +
            "<td class='txt-right'>$ " +new Intl.NumberFormat("es-MX").format(el.costo) +"</td>" +
            "<td>" +el.fecha_entrega +"</td>" +
            '<td style="padding: 5px;" ><button data-copiar="' +el.id_folio +'" data-pedido="' +el.Id_Pedido +'" id="' +el.id_folio +'" class="material-icons btn btn-icon-self btn-transparent" title="Copiar información">copy_all</button></td>' +
            '<td style="padding: 5px;" ><button class="material-icons-outlined btn btn-icon-self btn-rojo">delete</button></td>' +
            '<td style="padding: 5px;" ><button data-pedidoact="' +el.Id_Pedido +'" id="' +el.id_folio +'" data-modal="modal-actualizar" class="material-icons-outlined btn-amarillo btn btn-icon-self btn-transparent" title="Copiar información">edit</button></td>' +
        "</tr>";
    });
};

//posible copia de busqueda

// const obtener_clave_reporte = (clave) => {
//     const respuesta = fetchAPI("",url + "/ventas/salida/buscar?clave=" + clave,"");
//     respuesta.then((json) => {
//         render_salida(json);
//     });
// };

//vista
const obtener = () => {
    const respuesta = fetchAPI("", url + "/ventas/cotizacion/obtener_cotizaciones", "");
    respuesta.then((json) => {
        render_cotizaciones(json);
    });
};

const buscar_historial = (salida) => {
    const respuesta = fetchAPI("",url + "/ventas/cotizacion/historial?id=" + salida,"");
    respuesta.then((json) => {
        console.log(json);
        render_historial(json);
    });
};

// pdf
// const obtener_pdf = (id) => {
//     printPage(url + "/ventas/salida/generarpdf?atributo=Id_Folio&value=" + id);
// };

const obtener_cotizacion_pdf = (id) => {
    printPage(url + "/ventas/cotizacion/generarpdf?id=" + id);
};


document.addEventListener("click", (evt) => {
    if (evt.target.dataset.historial) {
        auxiliar = evt.target.dataset.historial;
        document.getElementById("numero_salida_almacen").innerHTML = "Cotización: " + evt.target.dataset.historial;
        buscar_historial(evt.target.dataset.historial);
    }
});

document.addEventListener("DOMContentLoaded", () => {
    obtener();
});