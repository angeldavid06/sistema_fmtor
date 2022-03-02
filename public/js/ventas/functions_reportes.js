const meses = ['ENERO',
                'FEBRERO',
                'MARZO',
                'ABRIL',
                'MAYO',
                'JUNIO',
                'JULIO',
                'AGOSTO',
                'SEPTIEMBRE',
                'OCTUBRE',
                'NOVIEMBRE',
                'DICIEMBRE']

const render_reporte = (json) => {
    let aux = 0;
    let total_acumulado = 0;
    let total_acumulado_mensual = 0;
    let total_kilos = 0;
    let total_kilos_mensual = 0;
    const body = document.getElementsByClassName("body_reporte");
    body[0].innerHTML = "";
    json['salidas'].forEach((element) => {
        const tr_mes = document.createElement("tr");
        const tr_totales = document.createElement("tr");
        const tr = document.createElement("tr");
        let fecha = element.fecha.split("-");
    
        if (aux > 0 && mes != (fecha[0]+'-'+fecha[1]) && (fecha[0]+'-'+fecha[1]) != '0000-00') {
            tr_totales.innerHTML = '<tr>'+
                                        '<td colspan="3" class="txt-right">Cantidad mensual: </td>'+
                                        '<td class="txt-right">'+ new Intl.NumberFormat('es-MX').format(total_kilos_mensual)+'</td>'+
                                        '<td colspan="5" class="txt-right">Acumulado mensual:</td>'+
                                        '<td class="txt-right">$ ' + new Intl.NumberFormat('es-MX').format(total_acumulado_mensual) + '</td>'+
                                        '<td colspan="4"></td>'+
                                    '</tr>';
            body[0].appendChild(tr_totales)
            total_acumulado_mensual = 0
            total_kilos_mensual = 0
            total_kilos_mensual += parseFloat(element.cantidad)
            total_acumulado_mensual += (parseFloat(element.cantidad) * parseFloat(element.costo))
        } else {
            total_kilos_mensual += parseFloat(element.cantidad)
            total_acumulado_mensual += (parseFloat(element.cantidad) * parseFloat(element.costo))
        }
        total_kilos += parseFloat(element.cantidad);
        total_acumulado += (parseFloat(element.cantidad) * parseFloat(element.costo))

        if (aux == 0 || mes != (fecha[0]+'-'+fecha[1]) && (fecha[0]+'-'+fecha[1]) != '0000-00') {
            tr_mes.innerHTML = '<tr><td class="txt-center" colspan="14">'+meses[fecha[1]-1]+' '+fecha[0]+'</td></tr>'
            mes = (fecha[0]+'-'+fecha[1])
            aux++;
            body[0].appendChild(tr_mes)
        }
        const info = {
            op: '-', 
            medida: '-',
            descripcion: '-',
            acabado: '-',
            plano: '-',
            estado: '-',
            material: '-',
            cantidad: '0'
        };
        json['ordenes'].forEach((orden) => {
            if (orden.Id_Pedido == element.Id_Pedido) {
                info.op = orden.Id_Folio;
                info.plano = orden.Id_Catalogo;
                info.estado = orden.estado_general;
                info.cantidad = orden.cantidad_elaborar;
            }
        })
        if (element.Salida != 0) {
        body[0].innerHTML +=
            "<tr>" +
                "<td>"+element.id_folio + "</td>" +
                "<td>"+element.razon_social +"</td>" +
                "<td class='txt-right'>"+element.fecha + "</td>" + 
                "<td class='txt-right'>"+new Intl.NumberFormat('es-MX').format(element.cantidad) + "</td>" + 
                "<td>"+element.no_parte + "</td>" + 
                "<td>"+element.pedido_cliente + "</td>" + 
                "<td>"+element.medida + "</td>" + 
                "<td>"+element.descripcion + "</td>" + 
                "<td>"+element.acabados + "</td>" + 
                "<td class='txt-right'>$ "+new Intl.NumberFormat('es-MX').format(element.costo) + "</td>" + 
                "<td></td>" + 
                "<td>"+element.material + "</td>" + 
                "<td></td>" + 
                "<td class='txt-right'>"+element.fecha_entrega + "</td>" + 
            '</tr>';
        }
    });
    const tr_totales = document.createElement('tr')
    tr_totales.innerHTML = '<tr>'+
                                '<td colspan="3" class="txt-right">Cantidad mensual: </td>'+
                                '<td class="txt-right">'+new Intl.NumberFormat('es-MX').format(total_kilos_mensual)+'</td>'+
                                '<td colspan="5" class="txt-right">Acumulado mensual:</td>'+
                                '<td class="txt-right">$ ' + new Intl.NumberFormat('es-MX').format(total_acumulado_mensual) + '</td>'+
                                '<td colspan="4"></td>'+
                            '</tr>';
    body[0].appendChild(tr_totales)
    total_acumulado_mensual = 0
    
    const table = document.getElementById('table')
    const tfoot = document.createElement('tfoot');
    tfoot.classList.add('tfoot')
    tfoot.innerHTML = '<tr>'+
                            '<td colspan="3" class="txt-right">Cantidad total: </td>'+
                            '<td class="txt-right">'+new Intl.NumberFormat('es-MX').format(total_kilos)+'</td>'+
                            '<td colspan="5" class="txt-right">Total acumulado</td>'+
                            '<td class="txt-right">$ ' + new Intl.NumberFormat('es-MX').format(total_acumulado) + '</td>'+
                            '<td colspan="4"></td>'+
                    '</tr>';
    table.appendChild(tfoot)
};

const mostrarModal = (id) => {
    const respues = fetchAPI('', url+'/ventas/reportes/obtener_per?aux=' + id + '', '');
    respues.then(json => {
        pintarModal(json);
    });
}
const Id_reporte = document.getElementById('Id_reporte_edit');
const Mes_de_creacion = document.getElementById('Mes_de_creacion_edit');
const ReportePDF = document.getElementById('ReportePDF_edit');



const pintarModal = (json) => {
    console.log(json);
    json.forEach(element => {
        Id_reporte.value = element.Id_reporte;
        Mes_de_creacion.value = element.Mes_de_creacion;
    })
}

const Id_reporte_r = document.getElementById('Id_reporte');
const Mes_de_creacion_r = document.getElementById('Mes_de_creacion');

const nuevoreporte = () => {
    Id_reporte_r.value = '';
    Mes_de_creacion_r.value = '';
}
//posible copia de busqueda 
document.addEventListener('click', evt => {
    if (evt.target.dataset.edit) {
        console.log(evt.target.dataset.edit);
        mostrarModal(evt.target.dataset.edit);
    } else if (evt.target.dataset.plano){
        obtener_plano(evt.target.dataset.plano);
    }

})

const obtener_clave_reporte = (clave) => {
    const respuesta = fetchAPI('',url+'/ventas/reportes/buscar?clave='+clave,'');
    respuesta.then(json => {
        render_reporte(json)
    })
}

const obtener = () => {
    const respuesta = fetchAPI('',url+'/ventas/reportes/obtener', '')
    respuesta.then(json => {
        render_reporte(json);
    })
};

const obtener_plano = (Id_reporte) => {
    const plano = fetchBlob(url + '/ventas/reportes/obtener_plano?id_plano=' + Id_reporte)
    plano.then(blob => {
        const div_plano = document.getElementById('plano')
        const embed = document.createElement('embed')

        div_plano.innerHTML = '';

        embed.classList.add('height-100');
        embed.setAttribute('type', 'application/pdf')
        embed.setAttribute('src', 'data:application/pdf;base64,' + encodeURI(blob))

        div_plano.appendChild(embed)
    })
}

const eliminarRegistro = (id) => {
    const respuesta = fetchAPI('', url+'/ventas/reportes/eliminarreporte?dato=' + id, '')
    respuesta.then(json => {
        obtener();
    })
};

const form = document.getElementById('form_reg_reporte');

form.addEventListener('submit', (evt) => {
    evt.preventDefault();
    insertarreporte();
    nuevoRegistro();
})

const insertarreporte = () => {
    const respuesta = fetchAPI(form, url+'/ventas/reportes/Nuevoreporte', 'POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('El registro ha sido agregado correctamente', 'verde')
            obtener();
        } else {
            open_alert('Error al agregar el registro', 'rojo')
        }
        obtener()
        console.log(json);
    })
}

//actualizar 

const formactualizar = document.getElementById('form_act_reporte');

formactualizar.addEventListener('submit', (evt) => {
    evt.preventDefault();
    actualizar_reporte();
})

const actualizar_reporte = () => {
    const respuesta = fetchAPI(formactualizar,url+'/ventas/reportes/actualizarreporte', 'POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('El registro ha sido actualizado correctamente', 'verde')
            obtener();
        } else {
            open_alert('Error al actualizar el registro', 'rojo')
        }
    })
}

(function () {
    obtener();
})()