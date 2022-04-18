const auxiliar = {dato : 0}

const render_orden = (json) => {
    const body = document.getElementById("body_orden");
    body.innerHTML = "";
    if (json.length > 0) {
        json.forEach((element) => {
            body.innerHTML +=
                "<tr>" +
                    '<td>'+
                        '<div id="'+element.Id_Folio+'" class="mas_opciones_tablas">'+
                            '<div class="opcion">'+
                                '<button data-opciones="'+element.Id_Folio+'"  class="mas btn btn-transparent btn-icon-self material-icons">more_vert</button>'+
                            '</div>'+
                            '<div class="opciones" id="opciones-'+element.Id_Folio+'">'+
                                '<button data-editar="'+element.Id_Folio+'" style="margin: 0px 5px 0px 0px;" class="material-icons-outlined btn btn-amarillo btn-icon-self" data-modal="modal-actualizar">edit</button>'+
                                '<button style="margin: 0px 5px;" title="Tarjeta de Flujo ('+element.Id_Folio+')" class= "btn-transparent btn-impresion material-icons-outlined btn btn-icon-self" data-tarjeta="'+element.Id_Folio+'"*/ data-modal="modal-tarjetas">note_alt</button>'+
                                '<button style="margin: 0px 5px;" title="Orden de Producción ('+element.Id_Folio+')" class= "btn-transparent btn-impresion material-icons btn btn-icon-self" data-imprimir="' + element.Id_Folio +'">splitscreen</button>'+
                                '<button style="margin: 0px 5px;" title="Control de Producción('+element.Id_Folio+')" class= "btn-transparent btn-impresion material-icons btn btn-icon-self" data-control="' + element.Id_Folio +'">calendar_view_month</button>'+
                                '<button style="margin: 0px 0px 0px 5px;" title="Cancelar la O.P.: '+element.Id_Folio+'" class= "material-icons-outlined btn btn-icon-self btn-rojo" data-cancelar="'+element.Id_Folio+'">do_not_disturb_on</button>'+
                            '</div>'+
                        '</div>'+
                    '</td>'+    
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

const Id_Folio = document.getElementById("op_e");
const dibujo = document.getElementById("Dibujo_e");
const cantidad_elaborar = document.getElementById("cantidad_producir_e");

const pintarModal = (json) => {
    json.forEach((element) => {
        Id_Folio.value = element.Id_Folio;
        dibujo.value = element.Id_Catalogo;
        cantidad_elaborar.value = element.cantidad_elaborar;
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

const cancelar = () => {
    const respuesta = fetchAPI('',url+'/ventas/orden/cancelar?op='+auxiliar.dato,'')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('Orden de Producción No. '+auxiliar.dato+' cancelada','naranja')
            // obtener()
            buscar_mes_actual()
        } else {
            open_alert('Ocurrio un error al cancelar la O.P.','rojo')
        }
    })
}

const buscar_mes_actual = () => {
    const fecha_actual = new Date().toLocaleDateString();
    const fecha = fecha_actual.split("/");

    if (parseInt(fecha[1]) < 10) {
        aux = fecha[2] + "-0" + fecha[1];
    } else {
        aux = fecha[2] + '-' +fecha[1];
    }
    document.getElementById("f_fecha_mes").value = aux;
    buscar_dato("buscar_mes");
}


document.addEventListener("click", (evt) => {
    if (evt.target.dataset.editar) {
        mostrarModal(evt.target.dataset.editar);
    } else if (evt.target.dataset.cancelar) {
        auxiliar.dato = evt.target.dataset.cancelar;
        open_confirm('¿Desea cancelar la Orden de Producción '+evt.target.dataset.cancelar+'?',cancelar)
    } else if (evt.target.dataset.control) {
        generar_control_vacio(evt.target.dataset.control);
    } else if (evt.target.dataset.tarjeta) {
        auxiliar.dato = evt.target.dataset.tarjeta;
    } else if (evt.target.dataset.t5) {
        generar_tarjetas();
    } else if (evt.target.dataset.t1) {
        if (document.getElementById("bote").value != "") {
            generar_tarjeta(document.getElementById("bote").value);
        }
    } else if (evt.target.dataset.recarga) {
        // obtener();
        buscar_mes_actual()
        restaurar_formulario();
    } else if (evt.target.dataset.limpiar) {
        // obtener();
        buscar_mes_actual()
        restaurar_formulario();
    }
});

const formactualizar = document.getElementById("form_act_orden");

formactualizar.addEventListener("submit", (evt) => {
    evt.preventDefault();
    open_confirm('¿Desea guardar los cambios realizados?', actualizar_orden)
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
    buscar_mes_actual();
})