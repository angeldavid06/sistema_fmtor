const render_salida = (json) => {
    const body = document.getElementById('table')
    body.innerHTML = ''
    json.salidas.forEach((el) => {
        body.innerHTML += '<tr>'+
                                '<td>'+el.id_folio+'</td>'+
                                '<td>'+el.razon_social+'</td>'+
                                '<td>'+el.fecha+'</td>'+
                                '<td class=" txt-right"><button class="btn btn-amarillo btn-icon-self material-icons" data-modal="modal-actualizar-salida">edit</button></td>'+
                                '<td class=" txt-right"><button data-salida="'+el.id_folio+'" data-historial="' +el.id_cotizacion +'" class="btn btn-transparent btn-icon-self material-icons" data-modal="modal-historial">more_vert</button></td>'+
                                '<td class=" txt-right"><button class="btn btn-transparent btn-icon-self material-icons">warehouse</button></td>'+
                        '</tr>'
    })
}

const form = document.getElementById('form_reg_salida')

form.addEventListener('submit', (evt) => {
    evt.preventDefault()
    registrar_salida()
})

const registrar_salida = () => {
    const respuesta = fetchAPI(form,url+'/ventas/salida/NuevaSalida','POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('Registro exitoso','verde')
            obtener()
        } else {
            open_alert('La salida de almacen no pudo ser registrada','rojo')
        }
    })
}

const select_cotizaciones = document.getElementById("cotizacion");

select_cotizaciones.addEventListener('change', () => {
    obtener_pedidos(select_cotizaciones.value);
})

const generar_form = (cantidad) => {
    const contenedor = document.getElementById('tornillos')
    contenedor.innerHTML = ''
    for (let i = 1; i <= cantidad; i++) {
        contenedor.innerHTML += '<div class="tornillo" id="tornillo-'+i+'">'+
                                    '<div class="d-grid g-2">'+
                                        '<div class="d-grid">'+
                                            '<p style="padding: 15px 0px 5px 0px;" id="pedido-'+i+'">Descripción y Medida</p>'+
                                        '</div>'+
                                        '<div class="d-grid g-1">'+
                                            '<input type="checkbox" name="sin_op_'+i+'" id="sin_op_'+i+'">'+
                                            '<label class="lbl-checkbox" data-pedido="'+i+'" id="lbl_checkbox_salida" for="sin_op_'+i+'" style="margin: 0 0 15px 0;">Sin O.P.:</label>'+
                                        '</div>'+
                                    '</div>'+
                                    '<div class="d-grid g-2">'+
                                    '<input class="input" type="text" name="pedido_'+i+'" id="pedido_'+i+'"  hidden>'+
                                        '<div class="d-grid g-1 grid-gap-0">'+
                                            '<p id="t_plano_'+i+'">No. de Dibujo:</p>'+
                                            '<input class="input" type="text" name="Dibujo_'+i+'" id="Dibujo_'+i+'" placeholder="Ingrese el numero de plano">'+
                                        '</div>'+
                                        '<div class="d-grid g-1 grid-gap-0">'+
                                            '<p id="t_cantidad_'+i+'">Cantidad a Producir (millares):</p>'+
                                            '<input class="input" type="number" name="cantidad_producir_'+i+'" id="cantidad_producir_'+i+'">'+
                                        '</div>'+
                                    '</div>'+
                                '</div>'
    }
} 

const asignar_valores = (json) => {
    let i = 1;
    json.forEach(el => {
        document.getElementById('pedido_'+i).value = el.Id_Pedido;
        document.getElementById('pedido-'+i).innerText = '( ' + el.cantidad + ' ) ' + el.descripcion + ' ' + el.medida;
        i++;
    })
}

const ocultar_input = (id) => {
    const checkbox = document.getElementById('sin_op_'+id)
    const plano = document.getElementById('Dibujo_'+id)
    const cantidad = document.getElementById('cantidad_producir_'+id)
    const t_plano = document.getElementById('t_plano_'+id)
    const t_cantidad = document.getElementById('t_cantidad_'+id)
    if (checkbox.checked == false) {
        t_plano.setAttribute('hidden','')
        plano.setAttribute('hidden','')
        plano.setAttribute('disabled','')
        t_cantidad.setAttribute('hidden','')
        cantidad.setAttribute('hidden','')
        cantidad.setAttribute('disabled','')
    } else {
        t_plano.removeAttribute('hidden')
        plano.removeAttribute('hidden')
        plano.removeAttribute('disabled')
        t_cantidad.removeAttribute('hidden')
        cantidad.removeAttribute('hidden')
        cantidad.removeAttribute('disabled')
    }
}

const render_pedidos = (json) => {
    document.getElementById('cantidad_tornillos').value = json.length
    generar_form(json.length)
    asignar_valores(json)
}

const render_cotizaciones = (json) => {
    json.forEach(el => {
        select_cotizaciones.innerHTML += '<option value="'+el.id_cotizacion+'">'+ el.id_cotizacion + ' - '+el.razon_social+'</option>'
    });
}

const obtener_pedidos = (id) => {
    const respuesta = fetchAPI('',url+'/ventas/cotizacion/historial?id='+id,'')
    respuesta.then(json => {
        render_pedidos(json)
    })
}

const obtener_cotizaciones = () => {
    const respuesta = fetchAPI('',url+'/ventas/cotizacion/obtener_cotizaciones','')
    respuesta.then(json => {
        render_cotizaciones(json)
    })
}

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.pedido) {
        ocultar_input(evt.target.dataset.pedido);
    }
})

document.addEventListener('DOMContentLoaded', () => {
    obtener_cotizaciones()
})