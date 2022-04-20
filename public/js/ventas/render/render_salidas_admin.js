const render_salida = (json) => {
    const body = document.getElementById('table')
    body.innerHTML = ''
    json.salidas.forEach((el) => {
        let estado = ''
        if (el.estado == 1) {
            estado = 'CANCELADO'
        } else {
            estado = ''
        }
        body.innerHTML += '<tr>'+
                                '<td style="padding: 5px;">'+
                                    '<div id="'+el.id_folio+'" class="mas_opciones_tablas">'+
                                        '<div class="opcion">'+
                                            '<button data-opciones="'+el.id_folio+'"  class="mas btn btn-icon-self material-icons">more_vert</button>'+
                                        '</div>'+
                                        '<div class="opciones" id="opciones-'+el.id_folio+'">'+
                                            '<button style="margin: 0px 5px 0px 0px;" class="btn btn-amarillo btn-icon-self material-icons-outlined" data-modal="modal-actualizar-salida" data-editar="'+el.id_folio+'">edit</button>'+
                                            '<button style="margin: 0px 5px;" data-salida="'+el.id_folio+'" data-historial="' +el.id_cotizacion +'" class="btn btn-transparent btn-icon-self material-icons" data-modal="modal-historial">toc</button>'+
                                            '<button style="margin: 0px 5px;" class="btn btn-icon-self material-icons-outlined" data-impresion="'+el.id_folio+'">warehouse</button>'+  
                                            '<button style="margin: 0px 0px 0px 5px;" title="Cancelar Salida de Almacen: '+el.id_folio+'" data-cancelar="'+el.id_folio+'" class="btn btn-icon-self material-icons-outlined btn-rojo">do_not_disturb_on</button>'+  
                                        '</div>'+
                                    '</div>'+
                                '</td>'+
                                '<td>'+el.id_folio+'</td>'+
                                '<td>'+el.razon_social+'</td>'+
                                '<td>'+el.fecha+'</td>'+
                                '<td>'+estado+'</td>'+
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
                                            '<button style="margin: 0px 5px 0px 0px;" class="btn btn-amarillo btn-icon-self material-icons" data-modal="modal-actualizar-salida" data-editar="'+el.id_folio+'">edit</button>'+
                                            '<button style="margin: 0px 5px;" data-salida="'+el.id_folio+'" data-historial_compra="' +el.id_compra +'" class="btn btn-transparent btn-icon-self material-icons" data-modal="modal-historial-compra">toc</button>'+
                                            '<button style="margin: 0px 0px 0px 5px;" class="btn btn-icon-self material-icons" data-impresion="'+el.id_folio+'">warehouse</button>'+
                                        '</div>'+
                                    '</div>'+
                                '</td>'+
                                '<td>'+el.id_folio+'</td>'+
                                '<td>'+el.empresa+'</td>'+
                                '<td>'+el.fecha+'</td>'+
                        '</tr>'
    })
}

const form = document.getElementById('form_reg_salida')
const form_act = document.getElementById("form_act_solo_salida");

form.addEventListener('submit', (evt) => {
    evt.preventDefault()
    open_confirm('¿Estas seguro de registrar la salida de almacen?',registrar_salida)
})

form_act.addEventListener('submit', (evt) => {
    evt.preventDefault()
    open_confirm('¿Esta seguro de registrar los cambios?',actualizar_salida)
})

const registrar_salida = () => {
    const respuesta = fetchAPI(form,url+'/ventas/salida/NuevaSalida','POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('Registro exitoso','verde')
            buscar_mes_actual();
        } else {
            open_alert('La salida de almacen no pudo ser registrada','rojo')
        }
    })
}

const actualizar_salida = () => {
    const respuesta = fetchAPI(form_act,url+'/ventas/salida/actualizar_solo_salida','POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('La información fue modificada correctamente','verde')
            buscar_mes_actual();
        } else {
            open_alert('No se pudo modificar la información','rojo')
        }
    })
}


const concepto = document.getElementById('concepto')

concepto.addEventListener('change', (evt) => {
    console.log(evt.target.checked);
    if (evt.target.checked) { 
        document.getElementById("lbl-concepto").innerText = 'Orden de Compra';
        obtener_ordenes_compra()
    } else {
        document.getElementById("lbl-concepto").innerText = 'Cotización';
        obtener_cotizaciones()
    }
})

const select_filtros = document.getElementById("f_cliente");
const select_cotizaciones = document.getElementById("cotizacion");
const select_cotizaciones_2 = document.getElementById("Id_Clientes_2_e");

select_cotizaciones.addEventListener('change', () => {
    if (!concepto.checked) {
        obtener_pedidos(select_cotizaciones.value);
    } else {
        document.getElementById("tornillos").innerHTML = "";
    }
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

const cancelar_salida = (id) => {
    auxiliar = id
    open_confirm('¿Desea cancelar esta salida de almacen?',cancelar)
}

const cancelar = () => {
    const respuesta = fetchAPI('', url+'/ventas/salida/cancelar_salida?id='+auxiliar, '')
    respuesta.then(json =>{ 
        if (json == 1) {
            open_alert('Salida de almacen '+auxiliar+' ha sido cancelada correctamente','naranja')
            buscar_mes_actual();
        } else{
            open_alert('No se pudo cancelar esta salida de almacen','rojo')
        }
    })
}

const render_pedidos = (json) => {
    document.getElementById('cantidad_tornillos').value = json.length
    generar_form(json.length)
    asignar_valores(json)
}

const render_cotizaciones = (json) => {
    select_cotizaciones.innerHTML = '<option id="concepto-opcion" value="">Selecciona una cotización</option>';
    json.forEach(el => {
        // select_filtros.innerHTML += '<option value="'+el.id_cotizacion+'">'+ el.id_cotizacion + ' - '+el.razon_social+'</option>'
        select_cotizaciones.innerHTML += '<option value="'+el.id_cotizacion+'">'+ el.id_cotizacion + ' - '+el.razon_social+'</option>'
        // select_cotizaciones_2.innerHTML += '<option value="'+el.id_cotizacion+'">'+ el.id_cotizacion + ' - '+el.razon_social+'</option>'
    });
}

const obtener_clientes = () => {
    const respuesta = fetchAPI("", url + "/ventas/salida/obtener_clientes", "");
    respuesta.then((json) => {
        json.forEach((el) => {
            select_filtros.innerHTML +='<option value="' +el.Razon_social+'">' +el.Razon_social +"</option>";
        });
    });
};

const render_ordenes_compra = (json) => {
    select_cotizaciones.innerHTML = '<option id="concepto-opcion" value="">Selecciona una orden de compra</option>';
    json.forEach(el => {
        select_cotizaciones.innerHTML += '<option value="'+el.Id_Compra+'">'+ el.Id_Compra + ' - '+el.Empresa+'</option>'
        // select_cotizaciones_2.innerHTML += '<option value="'+el.id_cotizacion+'">'+ el.id_cotizacion + ' - '+el.razon_social+'</option>'
    });
}

const obtener_pedidos = (id) => {
    const respuesta = fetchAPI('',url+'/ventas/cotizacion/historial?id='+id,'')
    respuesta.then(json => {
        render_pedidos(json)
    })
}

const obtener_salida = (id) => {
    const respuesta = fetchAPI('',url+'/ventas/salida/obtener_salida?aux='+id,'')
    respuesta.then(json => {
        json.forEach(el => {
            document.getElementById("Salida_e").value = el.Id_Folio;
            document.getElementById('Fecha_e').value = el.Fecha
            document.getElementById('Factura').value = el.Factura
            document.getElementById('Empaque').value = el.Empaque
            // document.getElementById('Id_Clientes_2_e').value = el.Id_Cotizacion_FK
        })
    })
}

const obtener_cotizaciones = () => {
    const respuesta = fetchAPI('',url+'/ventas/cotizacion/obtener_cotizaciones','')
    respuesta.then(json => {
        render_cotizaciones(json)
    })
}

const obtener_ordenes_compra = () => {
    const respuesta = fetchAPI('',url+'/ventas/compras/obtener','')
    respuesta.then(json => {
        render_ordenes_compra(json)
    })
}

const colocar_fecha = () => {
    const fecha = new Date();
    const local = fecha.toLocaleDateString();
    const arr = local.split('/')
    let aux = arr[2]

    if (parseInt(arr[1]) >= 10) {
        aux += '-' + arr[1];
    } else {
        aux += '-0' + arr[1];
    }

    if (parseInt(arr[0]) >= 10) {
        aux += '-' + arr[0];
    } else {
        aux += '-0' + arr[0];
    }
    
    document.getElementById('Fecha').value = aux
}

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.pedido) {
        ocultar_input(evt.target.dataset.pedido);
    } else if (evt.target.dataset.editar) {
        obtener_salida(evt.target.dataset.editar);
    } else if (evt.target.dataset.cancelar) {
        cancelar_salida(evt.target.dataset.cancelar)
    }
})

document.addEventListener('DOMContentLoaded', () => {
    obtener_cotizaciones()
    obtener_clientes();
    colocar_fecha()
})