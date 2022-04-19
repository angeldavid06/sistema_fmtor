const render_salida = (json) => {
    const body = document.getElementById('table')
    body.innerHTML = ''
    json.salidas.forEach((el) => {
        body.innerHTML += '<tr>'+
                                '<td style="padding: 5px;">'+
                                    '<div id="'+el.id_folio+'" class="mas_opciones_tablas">'+
                                        '<div class="opcion">'+
                                            '<button data-opciones="'+el.id_folio+'"  class="mas btn btn-icon-self material-icons">more_vert</button>'+
                                        '</div>'+
                                        '<div class="opciones" id="opciones-'+el.id_folio+'">'+
                                            '<button style="margin: 0px" data-salida="'+el.id_folio+'" data-historial="' +el.id_cotizacion +'" class="btn btn-transparent btn-icon-self material-icons" data-modal="modal-historial">toc</button>'+
                                        '</div>'+
                                    '</div>'+
                                '</td>'+
                                '<td>'+el.id_folio+'</td>'+
                                '<td>'+el.razon_social+'</td>'+
                                '<td>'+el.fecha+'</td>'+
                        '</tr>'
    })
    render_externo(json.externo)
}

const render_externo = (json) => {
    const body = document.getElementById('body_externo')
    body.innerHTML = ''
    json.forEach(el => {
        body.innerHTML += '<tr>'+
                                '<td>'+
                                    '<div id="'+el.id_folio+'" class="mas_opciones_tablas">'+
                                        '<div class="opcion">'+
                                            '<button data-opciones="'+el.id_folio+'"  class="mas btn btn-icon-self material-icons">more_vert</button>'+
                                        '</div>'+
                                        '<div class="opciones" id="opciones-'+el.id_folio+'">'+
                                            '<button style="margin: 0px" data-salida="'+el.id_folio+'" data-historial_compra="' +el.id_compra +'" class="btn btn-transparent btn-icon-self material-icons" data-modal="modal-historial-compra">toc</button>'+
                                        '</div>'+
                                    '</div>'+
                                '</td>'+
                                '<td>'+el.id_folio+'</td>'+
                                '<td>'+el.empresa+'</td>'+
                                '<td>'+el.fecha+'</td>'+
                        '</tr>'
    })
}

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