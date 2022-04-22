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

const buscar_historial_compra = (salida) => {
    const respuesta = fetchAPI("",url + "/ventas/salida/historial_compra?id=" + salida,"");
    respuesta.then((json) => {
        render_historial_compra(json);
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
            '<td><button style="margin: 0px 5px;" data-cantidad="'+el.cantidad+'" data-factor="'+el.factor+'" data-factura="' +el.Id_Pedido +'" class="btn btn-transparent btn-icon-self material-icons-outlined" data-modal="modal-actualizar-factura">receipt</button></td>'+
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

const render_historial_compra = (json) => {
    const body = document.getElementById("body_historial_compra");
    body.innerHTML = "";
    json.forEach((el) => {
        body.innerHTML +=
        "<tr>" +
            "<td>" +el.codigo +"</td>" +
            "<td>" +el.producto +"</td>" +
            "<td class='txt-right'>" + new Intl.NumberFormat("es-MX").format(el.cantidad) +"</td>" +
            "<td class='txt-right'>$ " +new Intl.NumberFormat("es-MX").format(el.precio) +"</td>" +
            '<td class="txt-right">$ '+ new Intl.NumberFormat("es-MX").format(el.cantidad * el.precio) +'</td>'
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
    } else if (evt.target.dataset.historial_compra) {
        auxiliar = evt.target.dataset.historial_compra;
        document.getElementById("numero_salida_almacen_compra").innerHTML = "Salida de Almacen: " + evt.target.dataset.salida;
        buscar_historial_compra(evt.target.dataset.historial_compra);
    } else if (evt.target.dataset.recarga) {
        restaurar_formulario();
        buscar_mes_actual();
    } else if (evt.target.dataset.impresion) {
        obtener_pdf(evt.target.dataset.impresion);
    } else if (evt.target.dataset.cotizacion) {
        obtener_cotizacion_pdf(evt.target.dataset.cotizacion);
    } 
});

const buscar_mes_actual = () => {
    const fecha_actual = new Date().toLocaleDateString();
    const fecha = fecha_actual.split("/");

    if (parseInt(fecha[1]) < 10) {
        aux = fecha[2] + "-0" + fecha[1];
    } else {
        aux = fecha[2] + '-' +fecha[1];
    }
    document.getElementById("f_fecha_mes").value = aux;
    document.getElementById("fecha_mes").checked = true;
    buscar_dato("buscar_mes");
}

document.addEventListener("DOMContentLoaded", () => {
    buscar_mes_actual()
});