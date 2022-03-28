const form = document.getElementById("form_reg_cotizacion");

form.addEventListener('submit', (evt) => {
    evt.preventDefault();
    insertar_cotizacion();
})

const insertar_cotizacion = () => {
    const respuesta = fetchAPI(form,url+'/ventas/cotizacion/insertar','POST')
    respuesta.then(json => {
        if (json) {
            open_alert('El registro fue realizado exitosamente', 'verde')
            obtener()
        } else {
            open_alert('Ocurrio un error al realizar el registro', 'rojo')
        }
    })
}

const render_cotizaciones = (json) => {
    const body = document.getElementsByClassName('body')[0]
    body.innerHTML = ''
    json.forEach(el => {
        body.innerHTML += '<tr>'+
                            '<td>'+el.id_cotizacion+'</td>'+
                            '<td>'+el.razon_social+'</td>'+
                            '<td>'+el.fecha+'</td>'+
                            '<td style="padding: 5px;" ><button title="Editar Salida de Almacen" class="material-icons-outlined btn btn-amarillo btn-icon-self" data-modal="modal-actualizar-salida" data-salida="' +el.id_cotizacion +'"> mode_edit</button></td>' +'<td style="padding: 5px;" ><button data-copiar="'+el.id_cotizacion+'" id="'+el.id_cotizacion+'" class="material-icons btn btn-icon-self btn-transparent" title="Copiar información">copy_all</button></td>' +
                            '<td style="padding: 5px;" ><button data-historial="' +el.id_cotizacion +'" data-modal="modal-historial" id="' +el.id_cotizacion +'" class="material-icons-outlined btn btn-icon-self btn-transparent" title="Copiar información">more_vert</button></td>' +
                            '<td style="padding: 5px;" ><button title="Generar Salida de Almacen" class= "material-icons-outlined btn btn-icon-self" data-impresion="' +el.id_cotizacion +'">warehouse</button>' +
                            '<td style="padding: 5px;" ><button title="Generar Cotización" class= "material-icons-outlined btn btn-icon-self" data-cotizacion="' +el.id_cotizacion +'">request_quote</button>' +
                        '</tr>'
    })
}

const obtener_clientes = () => {
    const respuesta = fetchAPI("", url + "/ventas/salida/obtener_clientes", "");
    respuesta.then((json) => {
        json.forEach((el) => {
        document.getElementById("Id_Clientes_2").innerHTML +='<option value="' +el.Id_Clientes +'">' +el.Razon_social +"</option>";
        // document.getElementById("Id_Clientes_2_e").innerHTML +='<option value="' +el.Id_Clientes +'">' +el.Razon_social +"</option>";
        // document.getElementById("f_cliente").innerHTML +='<option value="' +el.Razon_social +'">' +el.Razon_social +"</option>";
        });
    });
};

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.tornillo) {
        if (evt.target.dataset.tornillo == "mas") {
            tornillo_mas();
        } else if (evt.target.dataset.tornillo == "menos") {
            tornillo_menos();
        }
    }
})

document.addEventListener('DOMContentLoaded', () => {
    obtener_clientes();
})