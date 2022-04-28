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
        render_historial(json);
    });
};

const obtener_cotizacion_pdf = (id) => {
    printPage(url + "/ventas/cotizacion/generarpdf?id=" + id);
};

const buscar_mes_actual = () => {
    const fecha_actual = new Date().toLocaleDateString();
    const fecha = fecha_actual.split("/");

    if (parseInt(fecha[1]) < 10) {
        aux = "0" + fecha[1];
    } else {
        aux = fecha[1];
    }
    document.getElementById("f_fecha_mes").toggleAttribute('disabled');
    document.getElementById("f_fecha_mes").value = aux;
    buscar_dato("buscar_mes");
}

const restaurar_formulario = () => {
    const form_filtros = document.getElementsByClassName("contenedor_filtros");
    const inputs_radio = document.getElementsByName("buscar_por");
    const inputs_radio_fecha = document.getElementsByName("buscar_por_fecha");
    for (let i = 0; i < inputs_radio.length; i++) {
        inputs_radio[i].checked = false;
    }
    for (let i = 0; i < inputs_radio_fecha.length; i++) {
        inputs_radio_fecha[i].checked = false;
    }

    const inputs = form_filtros[0].getElementsByClassName("input");
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].value = "";
        inputs[i].setAttribute("disabled", "");
    }
    document.getElementById("f_fecha_mes").removeAttribute('disabled');
    document.getElementById("fecha_mes").checked = true;
};

document.addEventListener("click", (evt) => {
    if (evt.target.dataset.historial) {
        auxiliar = evt.target.dataset.historial;
        document.getElementById("numero_salida_almacen").innerHTML = "Cotización: " + evt.target.dataset.historial;
        buscar_historial(evt.target.dataset.historial);
    } else if (evt.target.dataset.recarga) {
        restaurar_formulario();
        buscar_mes_actual()
    } else if (evt.target.dataset.limpiar) {
        restaurar_formulario();
        buscar_mes_actual();
    } else if (evt.target.dataset.documento) {
        obtener_cotizacion_pdf(evt.target.dataset.documento);
    } 
});

document.addEventListener("DOMContentLoaded", () => {
    buscar_mes_actual()
    render_factor();
});