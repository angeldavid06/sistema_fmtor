const auxiliar = {dato : 0}

const render_orden = (json) => {
    const body = document.getElementById("body_orden");
    body.innerHTML = "";
    if (json.length > 0) {
        json.forEach((element) => {
            body.innerHTML +=
                "<tr>" +
                '<td style="padding: 5px;"><button style="margin:0px;" class="btn-impresion material-icons-outlined btn btn-amarillo btn-icon-self" data-modal="modal-actualizar">edit</button></td>' +
                // '<td style="padding: 5px;"><button style="margin:0px;" title="Tarjeta de Flujo ('+element.Id_Folio+')" class= "btn-impresion material-icons-outlined btn btn-icon-self btn-transparent" data-tarjeta="'+element.Id_Folio+'"*/ data-modal="modal-tarjetas">note_alt</button></td>' +
                '<td style="padding: 5px;"><button style="margin:0px;" title="Tarjeta de Flujo ('+element.Id_Folio+')" class= "btn-impresion material-icons-outlined btn btn-icon-self btn-transparent" data-tarjeta="' + element.Id_Folio +'" data-modal="modal-tarjetas">note_alt</button></td>' +
                '<td style="padding: 5px 0px;"><button style="margin:0px;" title="Orden de Producción ('+element.Id_Folio+')" class= "btn-impresion material-icons btn btn-icon-self btn-transparent" data-imprimir="' + element.Id_Folio +'">splitscreen</button>' +
                '<td style="padding: 5px;"><button style="margin:0px;" title="Control de Producción('+element.Id_Folio+')" class= "btn-impresion material-icons btn btn-icon-self btn-transparent" data-control="' + element.Id_Folio +'">calendar_view_month</button>' +
                "<td>" + element.estado_general + "</td>" +
                "<td>" + element.Id_Folio + "</td>" +
                "<td>" + element.Id_Salida_FK + "</td>" +
                "<td>" + (element.Clientes + ' ' + element.razon_social.split(' ')[0].trim()) + "</td>" +
                "<td class='txt-right'>$ " +new Intl.NumberFormat('es-MX').format(element.precio_millar) + "</td>" +
                "<td>" + element.Id_Catalogo + "</td>" +
                "<td>" + element.descripcion + "</td>" +
                "<td>" + element.medida + "</td>" +
                "<td class='txt-right'>" + new Intl.NumberFormat('es-MX').format(element.cantidad_elaborar) + "</td>" +
                "<td>" + element.acabados + "</td>" +
                // "<td>" + element.codigo + "</td>" +
                "<td>" + element.tratamiento + "</td>" +
                "<td>" + element.material + "</td>" +
                "<td>" + element.Fecha + "</td>" +
                "<td>" + element.fecha_entrega + "</td>" +
                "</tr>";
        });
    } else {
            body.innerHTML +=
                        "<tr>" +
                            "<td colspan='17'>No hay ninguna orden de producción.</td>" +
                        "</tr>";
    }
};
const mostrarModal = (id) => {
    const respues = fetchAPI("",url + "/ventas/orden/obtener_per?aux=" + id + "","");
    respues.then((json) => {
        pintarModal(json);
    });
};

const Tratamiento = document.getElementById("Tratamiento_edit");
const Id_Folio = document.getElementById("id_folio_edit");

const pintarModal = (json) => {
    json.forEach((element) => {
        Tratamiento.value = element.Tratamiento;
        Id_Folio.value = element.Id_Folio;
    });
};

const obtener_clave_orden = (clave) => {
    const respuesta = fetchAPI("",url + "/ventas/orden/buscar?clave=" + clave,"");
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

const generar_tarjeta = (bote) => {
    printPage(url+'/ventas/tarjeta/pdftarjeta?value='+auxiliar.dato+"&bote="+bote)
}

const generar_tarjetas = () => {
    for (let bote = 1; bote <= 5; bote++) {
        printPage(url+'/ventas/tarjeta/pdftarjeta?value='+auxiliar.dato+"&bote="+bote)
    }
}

document.addEventListener("click", (evt) => {
    if (evt.target.dataset.imprimir) {
        pdf(evt.target.dataset.imprimir);
    }
});

const restaurar_formulario = () => {
    const inputs_radio = document.getElementsByName("buscar_por");
    const inputs_radio_fecha = document.getElementsByName("buscar_por_fecha");
    for (let i = 0; i < inputs_radio.length; i++) {
        inputs_radio[i].checked = false;
    }

    for (let i = 0; i < inputs_radio_fecha.length; i++) {
        inputs_radio_fecha[i].checked = false;
    }

    const inputs = document.getElementsByClassName("input");
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].value = "";
        inputs[i].setAttribute("disabled", "");
    }
};

document.addEventListener("click", (evt) => {
    if (evt.target.dataset.edit) {
        mostrarModal(evt.target.dataset.edit);
    } else if (evt.target.dataset.control) {
        generar_control_vacio(evt.target.dataset.control);
    } else if (evt.target.dataset.tarjeta) {
        auxiliar.dato = evt.target.dataset.tarjeta;
    } else if (evt.target.dataset.t5) {
        generar_tarjetas()
    } else if (evt.target.dataset.t1) {
        if (document.getElementById("bote").value != '') {
            generar_tarjeta(document.getElementById("bote").value);
        }
    } else if (evt.target.dataset.recarga) {
        obtener();
        restaurar_formulario();
    } else if (evt.target.dataset.limpiar) {
        obtener();
        restaurar_formulario();
    }
});
const formactualizar = document.getElementById("form_act_orden");

formactualizar.addEventListener("submit", (evt) => {
  evt.preventDefault();
  actualizar_orden();
});

const actualizar_orden = () => {
    const respuesta = fetchAPI(formactualizar,url + "/ventas/orden/actualizarorden","POST");
    respuesta.then((json) => {
        if (json == 1) {
            open_alert("El registro ha sido actualizado correctamente", "verde");
            obtener();
        } else {
            open_alert("Error al actualizar el registro", "rojo");
        }
    });
};

document.addEventListener('DOMContentLoaded', () => {
  obtener();
})