const render_historial = (json) => {
    const body = document.getElementById("body_historial");
    body.innerHTML = "";
    json["salida"].forEach((el) => {
        const info = {
            op: "-",
            plano: "-",
            estado: "-",
            material: "-",
            factor: "0",
        };
        json["ordenes"].forEach((orden) => {
        if (orden.Id_Pedido == el.Id_Pedido) {
            info.op = orden.Id_Folio;
            info.plano = orden.Id_Catalogo;
            info.estado = orden.estado_general;
            info.factor = orden.factor;
        }
        });
        body.innerHTML +=
        "<tr>" +
            "<td>" +info.op +"</td>" +
            "<td>" +info.factor +"</td>" +
            "<td>" +el.descripcion +"</td>" +
            "<td>" +el.medida +"</td>" +
            "<td>" +el.acabados +"</td>" +
            "<td>" +el.material +"</td>" +
            "<td>" +el.cantidad +"</td>" +
            "<td>" +el.no_parte +"</td>" +
            "<td>" +el.pedido_cliente +"</td>" +
            "<td>" +new Intl.NumberFormat("es-MX").format(el.costo) +"</td>" +
            "<td>" +info.plano +"</td>" +
            "<td>" +el.fecha_entrega +"</td>" +
        "</tr>";
    });
};

const render_salida = (json) => {
    let aux = 0;
    const body = document.getElementsByClassName("body_salida");
    body[0].innerHTML = "";
    json["salidas"].forEach((element) => {
        const tr_mes = document.createElement("tr");
        let fecha = element.fecha.split("-");
        if (aux == 0 ||(mes != fecha[0] + "-" + fecha[1] &&fecha[0] + "-" + fecha[1] != "0000-00")) {
            tr_mes.innerHTML = '<tr><td class="txt-center" colspan="8">' +meses[fecha[1] - 1] +" " +fecha[0] +"</td></tr>";
            mes = fecha[0] + "-" + fecha[1];
            aux++;
            body[0].appendChild(tr_mes);
        }
        const info = {
            op: "-",
            medida: "-",
            descripcion: "-",
            acabado: "-",
            plano: "-",
            estado: "-",
            material: "-",
            cantidad: "0",
        };
        json["ordenes"].forEach((orden) => {
        if (orden.Id_Pedido == element.Id_Pedido) {
            info.op = orden.Id_Folio;
            info.plano = orden.Id_Catalogo;
            info.estado = orden.estado_general;
            info.cantidad = orden.cantidad_elaborar;
        }
        });

        if (element.Salida != 0) {
        body[0].innerHTML +=
            "<tr>" +
                "<td id='td_id_folio_" +element.id_folio +"'>" +element.id_folio +"</td>" +
                "<td id='td_razon_" +element.id_folio +"'>" +element.razon_social +"</td>" +
                "<td id='td_fecha_" +element.id_folio +"'>" +element.fecha +"</td>" +
                '<td style="padding: 5px;" ><button data-historial="' +element.id_folio +'" data-modal="modal-historial" id="' +element.id_folio +'" class="material-icons-outlined btn btn-icon-self btn-transparent" title="Copiar información">more_vert</button></td>' +
                '<td style="padding: 5px;" ><button title="Generar Salida de Almacen" class= "material-icons-outlined btn btn-icon-self" data-impresion="' +element.id_folio +'">warehouse</button>' +
                '<td style="padding: 5px;" ><button title="Generar Cotización" class= "material-icons-outlined btn btn-icon-self" data-cotizacion="' +element.id_folio +'">request_quote</button>' +
            "</tr>";
        }
    });
};

const obtener_clientes = () => {
    const respuesta = fetchAPI("", url + "/ventas/salida/obtener_clientes", "");
    respuesta.then((json) => {
        json.forEach((el) => {
            document.getElementById("f_cliente").innerHTML +='<option value="' +el.Razon_social +'">' +el.Razon_social +"</option>";
        });
    });
};

document.addEventListener("DOMContentLoaded", () => {
    obtener_clientes();
});