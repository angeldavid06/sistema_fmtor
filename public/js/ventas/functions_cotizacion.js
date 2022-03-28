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
    const respuesta = fetchAPI("",url + "/ventas/salida/historial?salida=" + salida,"");
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


document.addEventListener("click", (evt) => {
  if (evt.target.dataset.historial) {
      auxiliar = evt.target.dataset.historial;
      document.getElementById("numero_salida_almacen").innerHTML = "Salida de Almacen: " + evt.target.dataset.historial;
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