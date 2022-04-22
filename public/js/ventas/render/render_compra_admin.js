const form_orden_ingresar = document.getElementById("form_reg_orden");
const form_orden_actualizar = document.getElementById("form_act_orden");
const form_orden_actualizar_pedido = document.getElementById("form_act_orden_pedido");
const auxiliar = {dato: 0}

form_orden_ingresar.addEventListener('submit', (evt) => {
    evt.preventDefault();
    open_confirm('¿Esta seguro de realizar el registro?',ingresar_orden)
})

form_orden_actualizar.addEventListener('submit', (evt) => {
    evt.preventDefault();
    open_confirm("¿Esta seguro de modificar este registro?", actualizar_orden);
})

form_orden_actualizar_pedido.addEventListener('submit', (evt) => {
    evt.preventDefault();
    open_confirm("¿Esta seguro de modificar este registro?", actualizar_orden_pedido);
})

const ingresar_orden = () => {
    const respuesta = fetchAPI(form_orden_ingresar,url+'/ventas/compras/insertar','POST')
    respuesta.then(json => {
        if (json == 1) {
            obtener_ordenes()
            limpiar_formulario(form_orden_ingresar)
            open_alert('Orden de compra fue registrada correctamente','verde')
        } else {
            open_alert('El registro no pudo ser realizado','rojo')
        }
    })
}

const actualizar_orden = () => {
    const respuesta = fetchAPI(form_orden_actualizar,url+'/ventas/compras/actualizar','POST');
    respuesta.then(json => {
        if (json == 1) {
            obtener_ordenes()
            open_alert('Orden de compra fue actualizada correctamente','verde')
        } else {
            open_alert('El registro no pudo ser realizado','rojo')
        }
    })
};

const actualizar_orden_pedido = () => {
    const respuesta = fetchAPI(form_orden_actualizar_pedido,url+'/ventas/compras/actualizar_pedido','POST');
    respuesta.then(json => {
        if (json == 1) {
            obtener_ordenes()
            obtener_pedidos(auxiliar.dato);
            open_alert('Orden de compra fue actualizada correctamente','verde')
        } else {
            open_alert('El registro no pudo ser realizado','rojo')
        }
    })
};

const render_ordenes = (json) => {
    const body = document.getElementById('body')
    body.innerHTML = ''
    json.forEach(el => {
        body.innerHTML += "<tr>" + 
                            '<td style="padding: 5px;">'+
                                '<div id="'+el.Id_Compra+'" class="mas_opciones_tablas">'+
                                    '<div class="opcion">'+
                                        '<button data-opciones="'+el.Id_Compra+'"  class="mas btn btn-icon-self material-icons">more_vert</button>'+
                                    '</div>'+
                                    '<div class="opciones" id="opciones-'+el.Id_Compra+'">'+
                                        '<button style="margin: 0px 5px 0px 0px;" data-modal="modal-actualizar" data-act="'+el.Id_Compra+'" class="btn btn-icon-self btn-amarillo material-icons-outlined">edit</button>'+
                                        '<button style="margin: 0px 5px;" data-copiar="'+el.Id_Compra+'" class="btn btn-transparent btn-icon-self material-icons">copy_all</button>'+
                                        '<button style="margin: 0px 5px;" data-modal="modal-historial" data-compra="'+el.Id_Compra+'" class="btn btn-icon-self btn-transparent material-icons-outlined">toc</button>'+
                                        '<button style="margin: 0px 0px 0px 5px;" class="btn btn-icon-self btn- material-icons-outlined" data-imprimir="'+el.Id_Compra+'" data-empresa="'+el.FK_Empresa+'">print</button>'+
                                    '</div>'+
                                '</div>'+
                            '</td>'+
                            "<td>"+el.Id_Compra+"</td>"+
                            "<td>"+el.Fecha+"</td>"+
                            "<td>"+el.Empresa+"</td>"+
                            "<td>"+el.Solicitado+"</td>"+
                            "<td>"+el.Proveedor+"</td>"+
                        "</tr>";
    })
}

const render_pedidos = (json) => {
    const body = document.getElementById("body_historial");
    body.innerHTML = ''
    json.forEach(el => {
        body.innerHTML += "<tr>" +  
                            '<td style="padding: 5px;">'+
                                '<div id="0'+(el.Id_Pedido_Compra)+'" class="mas_opciones_tablas">'+
                                    '<div class="opcion">'+
                                        '<button data-opciones="0'+(el.Id_Pedido_Compra)+'"  class="mas btn btn-icon-self material-icons">more_vert</button>'+
                                    '</div>'+
                                    '<div class="opciones" id="opciones-0'+(el.Id_Pedido_Compra)+'">'+
                                        "<button style='margin: 0px 5px 0px 0px;' data-cp='"+el.Id_Pedido_Compra+"' style='margin: 0px;' class='btn btn-icon-self btn-transparent material-icons'>copy_all</button>"+
                                        "<button style='margin: 0px 5px;' data-pedido='"+el.Id_Pedido_Compra+"&"+el.FK_Orden_Compra+"' data-modal='modal-actualizar-tornillo' style='margin: 0px;' class='btn btn-icon-self btn-amarillo material-icons'>edit</button>"+
                                        "<button style='margin: 0px 0px 0px 5px;' class='btn btn-icon-self btn-rojo material-icons'>delete</button>"+
                                    '</div>'+
                                '</div>'+
                            '</td>'+
                            "<td>"+el.Codigo+"</td>"+
                            "<td>"+el.Producto+"</td>"+
                            "<td class='txt-right'>"+new Intl.NumberFormat('es-MX').format(el.Cantidad)+"</td>"+
                            "<td class='txt-right'>$ "+new Intl.NumberFormat('es-MX').format(el.Precio)+"</td>"+
                        "</tr>";
    })
}

const colocar_empresas = (json) => {
    const select = document.getElementById('empresas')
    const select_p = document.getElementById('empresas_p')
    const select_b = document.getElementById('f_empresa_b')
    json.forEach(el => {
        select.innerHTML += '<option value="'+el.Id_Empresa+'">'+el.Empresa+'</option>'
        select_p.innerHTML += '<option value="'+el.Id_Empresa+'">'+el.Empresa+'</option>'
        select_b.innerHTML += '<option value="'+el.Id_Empresa+'">'+el.Empresa+'</option>'
    });
}

const colocar_proveedores = (json) => {
    const select = document.getElementById('proveedores')
    const select_p = document.getElementById('proveedores_p')
    const select_b = document.getElementById('f_proveedor_b')
    json.forEach(el => {
        select.innerHTML += '<option value="'+el.Id_Proveedor+'">'+el.Proveedor+'</option>';
        select_p.innerHTML += '<option value="'+el.Id_Proveedor+'">'+el.Proveedor+'</option>';
        select_b.innerHTML += '<option value="'+el.Id_Proveedor+'">'+el.Proveedor+'</option>';
    })
}

const render_pedido = (json) => {
    json.forEach((el) => {
        document.getElementById("id_pedido").value = el.Id_Pedido_Compra
        document.getElementById('codigo_p').value = el.Codigo
        document.getElementById('producto_p').value = el.Producto
        document.getElementById('cantidad_p').value = el.Cantidad
        document.getElementById('precio_p').value = el.Precio
    })
}

const render_compra = (json) => {
    json.forEach(el => {
        document.getElementById('Id_Compra_p').value = el.Id_Compra
        document.getElementById('Fecha_p').value = el.Fecha
        document.getElementById('empresas_p').value = el.FK_Empresa
        document.getElementById('proveedores_p').value = el.FK_Proveedor
        document.getElementById('solicitado_p').value = el.Solicitado
        document.getElementById('terminos_p').value = el.Terminos
        document.getElementById("contacto_p").value = el.Contacto;
    })
}

const pegar_orden = () => {
    navigator.clipboard.readText().then(clipText => {
        const json = JSON.parse(clipText)
        console.log(json);
        json['orden'].forEach(el => {
            document.getElementById('Fecha').value = el.Fecha
            document.getElementById('empresas').value = el.FK_Empresa
            document.getElementById('proveedores').value = el.FK_Proveedor
            document.getElementById('solicitado').value = el.Solicitado
            document.getElementById('terminos').value = el.Terminos
            document.getElementById('contacto').value = el.Contacto
        })
    })
}

const generar_tornillos = (json) => {
    let aux = 1;
    console.log(json);
    render_form_tornillo(json.length)
    json.forEach(el => {
        document.getElementById('codigo_'+aux).value = el.Codigo
        document.getElementById('producto_'+aux).value = el.Producto
        document.getElementById('cantidad_'+aux).value = el.Cantidad
        document.getElementById('precio_'+aux).value = el.Precio
        aux++;
    })
}

const pegar_pedido = (id) => {
    navigator.clipboard.readText().then(clipText => {
        const json = JSON.parse(clipText)
        json.forEach(el => {
            document.getElementById("codigo_" + id).value = el.Codigo;
            document.getElementById("producto_" + id).value = el.Producto;
            document.getElementById("cantidad_" + id).value = el.Cantidad;
            document.getElementById("precio_" + id).value = el.Precio;
        })
    })
}

const pegar_todo = () => {
    navigator.clipboard.readText().then(clipText => {
        const json = JSON.parse(clipText)
        json['orden'].forEach(el => {
            document.getElementById('Fecha').value = el.Fecha
            document.getElementById('empresas').value = el.FK_Empresa
            document.getElementById('proveedores').value = el.FK_Proveedor
            document.getElementById('solicitado').value = el.Solicitado
            document.getElementById('terminos').value = el.Terminos
            document.getElementById('contacto').value = el.Contacto
        })
        generar_tornillos(json['pedidos'])
    })
}

const buscar_informacion = (id) => {
    const respuesta = fetchAPI('',url+'/ventas/compras/buscar_informacion?id='+id,'')
    respuesta.then(json => {
        let string = JSON.stringify(json)
        navigator.clipboard.writeText(string).then(function () {
            open_alert("Copiado!",'azul');
        }, function () {
            open_alert("Contenido no copiado",'naranja');
        });
    })
}

const buscar_pedido = (id) => {
    const respuesta = fetchAPI('',url+'/ventas/compras/buscar_pedido?id='+id,'')
    respuesta.then(json => {
        let string = JSON.stringify(json)
        navigator.clipboard.writeText(string).then(function () {
            open_alert("Copiado!",'azul');
        }, function () {
            open_alert("Contenido no copiado",'naranja');
        });
    })
}

const btn_limpiar_ingresar = document.getElementById('btn-limpiar')

btn_limpiar_ingresar.addEventListener('click',() => {
    limpiar_formulario(form_orden_ingresar);
})

const obtener_orden = (id) => {
    const respuesta = fetchAPI('',url+'/ventas/compras/obtener_orden?id='+id,'')
    respuesta.then(json => {
        render_compra(json)
    })
}

const obtener_pedido = (id) => {
    const respuesta = fetchAPI('', url+'/ventas/compras/obtener_informacion_pedido?id='+id,'')
    respuesta.then(json => {
        render_pedido(json)
    })
}

const obtener_salidas = () => {
    const respuesta = fetchAPI('',url+'/ventas/salida/obtener_salidas_disponibles', '')
    respuesta.then(json => {
        json.forEach(el => {
            document.getElementById('salida_compra').innerHTML += '<option value="'+el.id_folio+'">'+ el.id_folio + ' | ' + el.razon_social+'</option>';
        })
    })
}

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.tornillo) {
        if (evt.target.dataset.tornillo == "mas") {
            tornillo_mas();
        } else if (evt.target.dataset.tornillo == "menos") {
            tornillo_menos();
        }
    } else if (evt.target.dataset.pedido) {
        auxiliar.dato = evt.target.dataset.pedido.split('&')[1];
        obtener_pedido(evt.target.dataset.pedido.split('&')[0]);
    } else if (evt.target.dataset.act) {
        obtener_orden(evt.target.dataset.act);
    } else if (evt.target.dataset.copiar) {
        buscar_informacion(evt.target.dataset.copiar);
    } else if (evt.target.dataset.cp) {
        buscar_pedido(evt.target.dataset.cp);
    } else if (evt.target.dataset.p) {
        pegar_pedido(evt.target.dataset.p);
    } else if (evt.target.dataset.pegar) {
        if (evt.target.dataset.pegar == 'pegar-cliente') {
            pegar_orden()
        } else if (evt.target.dataset.pegar == 'pegar-todo') {
            pegar_todo()
        }
    }
})

document.addEventListener('DOMContentLoaded', () => {
    obtener_salidas()
})
