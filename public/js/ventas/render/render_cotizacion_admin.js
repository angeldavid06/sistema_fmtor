const dato = {aux: 0}
const form = document.getElementById("form_reg_cotizacion");
const form_act_cot = document.getElementById("form_act_solo_cotizacion");
const form_act_pedido = document.getElementById("form_act_cotizacion");

form.addEventListener('submit', (evt) => {
    evt.preventDefault();
    insertar_cotizacion();
})

form_act_cot.addEventListener('submit', (evt) => {
    evt.preventDefault()
    actualizar_solo_salida()
})

form_act_pedido.addEventListener('submit', (evt) => {
    evt.preventDefault()
    actualizar_pedido()
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

const actualizar_solo_salida = () => {
    const respuesta = fetchAPI(form_act_cot,url+'/ventas/cotizacion/actualizar_solo_cotizacion','POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('El registro ha sido actualizado correctamente','verde')
            obtener()
        } else {
            open_alert('El registro no ha sido actualizado','rojo')
        }
    })
}

const actualizar_pedido = () => {
    const respuesta = fetchAPI(form_act_pedido, url+'/ventas/cotizacion/actualizar_pedido','POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('El pedido fue actualizado correctamente','verde')
            buscar_historial(auxiliar)
        } else {
            open_alert('El pedido no pudo ser actualizado', 'rojo')
        }
    })
}

const obtener_cotizacion = (id) => {
    const respuesta = fetchAPI('',url+'/ventas/cotizacion/obtener_cotizacion?id='+id, '')
    respuesta.then(json => {
        render_cotizacion(json)
    })
}

const obtener_pedido = (id) => {
    const respuesta = fetchAPI('',url+'/ventas/cotizacion/obtener_pedido?id='+id,'')
    respuesta.then(json => {
        render_pedido(json);
    })
}

const obtener_clientes = () => {
    const respuesta = fetchAPI("", url + "/ventas/salida/obtener_clientes", "");
    respuesta.then((json) => {
        json.forEach((el) => {
            document.getElementById("Id_Clientes_2").innerHTML +='<option value="' +el.Id_Clientes +'">' +el.Razon_social +"</option>";
            document.getElementById("Id_Clientes_2_e").innerHTML +='<option value="' +el.Id_Clientes +'">' +el.Razon_social +"</option>";
            // document.getElementById("f_cliente").innerHTML +='<option value="' +el.Razon_social +'">' +el.Razon_social +"</option>";
        });
    });
};

const eliminarPedido = () => {
    const respuesta = fetchAPI('',url+'/ventas/cotizacion/eliminar_pedido?id='+dato.aux,'')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('El registro fue eliminado con exito','verde')
            buscar_historial(auxiliar);
        } else {
            open_alert('El registro no pudo ser eliminado','rojo')
        }
    })    
}

const render_cotizaciones = (json) => {
    const body = document.getElementsByClassName('body')[0]
    body.innerHTML = ''
    if (json.length == 0) {
        body.innerHTML += '<tr><td colspan="7">No existe ningún registro</td></tr>'
    } else {
        json.forEach(el => {
            body.innerHTML += '<tr>'+
                                '<td>'+el.id_cotizacion+'</td>'+
                                '<td>'+el.razon_social+'</td>'+
                                '<td>'+el.fecha+'</td>'+
                                '<td class="txt-right" style="padding: 5px 0px 5px 0px;" ><button title="Editar Salida de Almacen" class="material-icons-outlined btn btn-amarillo btn-icon-self" data-modal="modal-actualizar-cotizacion" data-cotizacion="' +el.id_cotizacion +'"> mode_edit</button></td>' +
                                '<td class="txt-right" style="padding: 5px 0px 5px 0px;" ><button data-copiar="'+el.id_cotizacion+'" id="'+el.id_cotizacion+'" class="material-icons btn btn-icon-self btn-transparent" title="Copiar información">copy_all</button></td>' +
                                '<td class="txt-right" style="padding: 5px 0px 5px 0px;" ><button data-historial="' +el.id_cotizacion +'" data-modal="modal-historial" id="' +el.id_cotizacion +'" class="material-icons-outlined btn btn-icon-self btn-transparent" title="Copiar información">more_vert</button></td>' +
                                '<td class="txt-right" style="padding: 5px 0px 5px 0px;" ><button title="Generar Cotización" class= "material-icons-outlined btn btn-icon-self" data-cotizacion="' +el.id_cotizacion +'">request_quote</button>' +
                            '</tr>'
        })
    }
}

const render_cotizacion = (json) => {
    json.forEach(el => {
        document.getElementById("Cotizacion_e").value = el.Id_Cotizacion;
        document.getElementById("Fecha_e").value = el.Fecha
        document.getElementById('Id_Clientes_2_e').value = el.Id_Clientes_FK
    })
}

const render_pedido = (json) => {
    json.forEach(el => {
        document.getElementById('Pedido_p').value = el.Id_Pedido
        document.getElementById('Fecha_entrega_p').value = el.Fecha_entrega
        document.getElementById('Codigo_p').value = el.Codigo
        document.getElementById('Pedido_pza_p').value = el.Pedido_pza
        document.getElementById('Cantidad_millares_p').value = el.Cantidad_millares
        document.getElementById('Descripcion_p').value = el.Descripcion
        document.getElementById('Medida_p').value = el.Medida
        document.getElementById('factor_p').value = el.Factor
        document.getElementById('Acabado_p').value = el.Acabado
        document.getElementById('Material_p').value = el.Material
        document.getElementById('Precio_millar_p').value = el.Precio_millar
    })
}

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.tornillo) {
        if (evt.target.dataset.tornillo == "mas") {
            tornillo_mas();
        } else if (evt.target.dataset.tornillo == "menos") {
            tornillo_menos();
        }
    } else if (evt.target.dataset.cotizacion) {
        obtener_cotizacion(evt.target.dataset.cotizacion);
    } else if (evt.target.dataset.pedidoact) {
        obtener_pedido(evt.target.dataset.pedidoact);
    } else if (evt.target.dataset.eliminar) {
        dato.aux = evt.target.dataset.eliminar;
        open_confirm('¿Esta seguro de querer eliminar este registro?', eliminarPedido)
    }
})

document.addEventListener('DOMContentLoaded', () => {
    obtener_clientes();
})