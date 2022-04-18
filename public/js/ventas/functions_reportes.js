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
    limpiar_tabla();
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
                "<td class='txt-right'>"+element.fecha + "</td>" + 
                "<td class='txt-right'>"+element.fecha_entrega + "</td>" + 
                "<td>"+element.razon_social +"</td>" +
                "<td>"+element.id_folio + "</td>" +
                "<td class='txt-right'>kilos</td>" + 
                "<td class='txt-right'>"+new Intl.NumberFormat('es-MX').format(element.cantidad) + "</td>" + 
                "<td class='txt-right'>$ "+new Intl.NumberFormat('es-MX').format(element.costo) + "</td>" + 
            '</tr>';
        }
    });
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