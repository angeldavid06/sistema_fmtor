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

const render_salidas = (json,body) => {
    let aux = 0;
    let anterior = 0;
    let total_salida_costo = 0;
    let total_salida_cantidad = 0;
    let total_salida_kilos = 0;

    json.forEach((element) => {
        if (aux == 0) {
            anterior = element.Id_Folio
        }

        if (total_salida_costo == 0 && anterior == element.Id_Folio) {
            total_salida_costo += parseFloat(element.costo);
            total_salida_cantidad += parseFloat(element.cantidad);
            total_salida_kilos += (parseFloat(element.Factor) * parseFloat(element.cantidad))
        } else {
            console.log(element.id_folio);
            body[0].innerHTML +=
            "<tr>" +
                "<td class='txt-right'>"+element.fecha + "</td>" + 
                // "<td class='txt-right'>"+element.fecha_entrega + "</td>" + 
                "<td>"+element.razon_social +"</td>" +
                "<td>"+element.id_folio + "</td>" +
                "<td class='txt-right'>"+total_salida_kilos+"</td>" + 
                "<td class='txt-right'>"+new Intl.NumberFormat('es-MX').format(total_salida_cantidad) + "</td>" + 
                "<td class='txt-right'>$ "+new Intl.NumberFormat('es-MX').format(total_salida_costo) + "</td>" + 
            '</tr>';
            anterior = element.Id_Folio;
            total_salida_costo = 0;
            total_salida_cantidad = 0;
            total_salida_kilos = 0;
            total_salida_costo += parseFloat(element.costo);
            total_salida_cantidad += parseFloat(element.cantidad);
            total_salida_kilos += (parseFloat(element.Factor) * parseFloat(element.cantidad))
        }
        aux++;
    });
}

const render_reporte = (json) => {
    let aux = 0;
    const body = document.getElementsByClassName("body_reporte");
    
    body[0].innerHTML = "";
    body[0].innerHTML = '<tr><td class="txt-center" colspan="9">FACTURACIÓN</td></tr>'

    render_salidas(json.terminadas,body)
    
    body[0].innerHTML += '<tr><td colspan="9"></td></tr>'+
                            '<tr><td class="txt-center" colspan="9">CANCELADAS</td></tr>';
    
    render_salidas(json.canceladas,body)
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
    inputs[i].setAttribute('disabled','')
  }
};

//posible copia de busqueda 
document.addEventListener('click', evt => {
    if (evt.target.dataset.recarga) {
        obtener();
        restaurar_formulario();
    } else if (evt.target.dataset.limpiar) {
        obtener();
        restaurar_formulario();
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

const obtener_clientes = () => {
  const respuesta = fetchAPI('',url+'/ventas/salida/obtener_clientes','')
  respuesta.then(json => {
    json.forEach(el => {
      document.getElementById('f_cliente').innerHTML += '<option value="'+el.Razon_social+'">'+el.Razon_social+'</option>'
    })
  })
}

document.addEventListener('DOMContentLoaded', () => {
    obtener();
    obtener_clientes()
})