const meses = 
[
    'ENERO',
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
    'DICIEMBRE'
]
let total_mes_costo = 0
let total_mes_impuestos = 0
let total_mes_total = 0
let totales = []

const render_totales = () => {
    const body = document.getElementsByClassName("body_reporte");
    body[0].innerHTML += '<tr><td colspan="9"></td></tr>'+
                            '<tr style="background: var(--background-aux);">'+
                                '<td class="txt-right" colspan="5">Total:</td>'+
                                '<td class="txt-right">$ '+ new Intl.NumberFormat('es-MX').format(total_mes_costo) + '</td>'+
                                '<td class="txt-right">$ '+ new Intl.NumberFormat('es-MX').format(total_mes_impuestos) + '</td>'+
                                '<td class="txt-right">$ '+ new Intl.NumberFormat('es-MX').format(total_mes_total) + '</td>'+
                            '</tr>';

}
const render_filas = (body,array) => {
    let total_concepto_costo = 0
    let total_concepto_impuestos = 0
    let total_concepto_total = 0
    array.forEach(el => {
        total_concepto_costo += el[1]
        total_concepto_impuestos += (el[1] / 100) * 6.25;
        total_concepto_total += (el[1] / 100) * 6.25 + el[1];
        body[0].innerHTML += '<tr>'+
                                // '<td style="padding: 5px;"><button title="Mover" class="material-icons btn btn-icon-self">low_priority</button></td>'+
                                '<td>'+el[0].fecha+'</td>'+
                                '<td>'+el[0].razon_social+'</td>'+
                                '<td>'+el[0].id_folio+'</td>'+
                                '<td class="txt-right">' + new Intl.NumberFormat('es-MX').format(el[3]) + '</td>'+
                                '<td class="txt-right">' + new Intl.NumberFormat('es-MX').format(el[2]) + '</td>'+
                                '<td class="txt-right">$ '+ new Intl.NumberFormat('es-MX').format(el[1]) + '</td>'+
                                '<td class="txt-right">$ '+ new Intl.NumberFormat('es-MX').format((el[1] / 100) * 6.25) + '</td>'+
                                '<td class="txt-right">$ '+ new Intl.NumberFormat('es-MX').format(((el[1] / 100) * 6.25) + el[1]) + '</td>'+
                            '</tr>';
    })

    total_mes_costo += total_concepto_costo;
    total_mes_impuestos += total_concepto_impuestos;
    total_mes_total += total_concepto_total;

    body[0].innerHTML += '<tr style="background: var(--background-aux);">'+
                                '<td colspan="3"></td>'+
                                '<td class="txt-right"></td>'+
                                '<td class="txt-right"></td>'+
                                '<td class="txt-right">$ '+ new Intl.NumberFormat('es-MX').format(total_concepto_costo) + '</td>'+
                                '<td class="txt-right">$ '+ new Intl.NumberFormat('es-MX').format(total_concepto_impuestos) + '</td>'+
                                '<td class="txt-right">$ '+ new Intl.NumberFormat('es-MX').format(total_concepto_total) + '</td>'+
                            '</tr>';

    totales.push(total_concepto_costo);

}

const render_salidas = (json,body) => {
    let aux = 0;
    let array = []
    let anterior = 0;
    let salida_anterior = {};
    let total_salida_costo = 0;
    let total_salida_cantidad = 0;
    let total_salida_kilos = 0;

    json.forEach((element) => {
        if (aux == 0) {
            anterior = element.id_folio
        } 
        
        if (anterior == element.id_folio) {
            total_salida_costo += parseFloat(element.costo);
            total_salida_cantidad += parseFloat(element.cantidad);
            total_salida_kilos += (parseFloat(element.Factor) * parseFloat(element.cantidad))
            anterior = element.id_folio;
            salida_anterior = element;
        } else {
            array.push([salida_anterior,total_salida_costo,total_salida_cantidad,total_salida_kilos])
            anterior = element.id_folio;
            salida_anterior = element
            total_salida_costo = 0;
            total_salida_cantidad = 0;
            total_salida_kilos = 0;
            total_salida_costo += parseFloat(element.costo);
            total_salida_cantidad += parseFloat(element.cantidad);
            total_salida_kilos += (parseFloat(element.Factor) * parseFloat(element.cantidad))
        }
        aux++;
    });
    array.push([salida_anterior,total_salida_costo,total_salida_cantidad,total_salida_kilos])
    render_filas(body,array)
}

const suma_total = () => {
    if (totales.length == 0) {
        totales = [0,0,0,0,0,0]
    }

    document.getElementById('forjadora').innerText = '$ ' + new Intl.NumberFormat('es-MX').format(totales[0]+totales[1])
    document.getElementById('rdg').innerText = '$ ' + new Intl.NumberFormat('es-MX').format(totales[2])
    document.getElementById('notas').innerText = '$ ' + new Intl.NumberFormat('es-MX').format(totales[3])
    document.getElementById('canceladas').innerText = '$ ' + new Intl.NumberFormat('es-MX').format(totales[4])
    document.getElementById('sin').innerText = '$ ' + new Intl.NumberFormat('es-MX').format(totales[5])
    document.getElementById('total').innerText = '$ ' + new Intl.NumberFormat('es-MX').format(
        totales[0]+
        totales[1]+
        totales[2]-
        totales[3]-
        totales[4]-
        totales[5])
    document.getElementById('total-porcentaje').innerText = '$ ' + new Intl.NumberFormat('es-MX').format(
        (((totales[0]+
        totales[1]+
        totales[2]-
        totales[3]-
        totales[4]-
        totales[5]) / 100) * 0.16))
    document.getElementById('total-total').innerText = '$ ' + new Intl.NumberFormat('es-MX').format(
        (((totales[0]+
        totales[1]+
        totales[2]-
        totales[3]-
        totales[4]-
        totales[5]) / 100) * 0.16) + totales[0]+
        totales[1]+
        totales[2]-
        totales[3]-
        totales[4]-
        totales[5])
}

const limpio_total = () => {
    totales = []
    document.getElementById('forjadora').innerText = '$ 0.00'
    document.getElementById('rdg').innerText = '$ 0.00'
    document.getElementById('notas').innerText = '$ 0.00'
    document.getElementById('canceladas').innerText = '$ 0.00'
    document.getElementById('sin').innerText = '$ 0.00'
    document.getElementById('total').innerText = '$ 0.00' 
    document.getElementById('total-porcentaje').innerText = '$ 0.00'
    document.getElementById('total-total').innerText = '$ 0.00'
}

const render_reporte = (json) => {
    let aux = 0;
    const body = document.getElementsByClassName("body_reporte");
    
    limpio_total();
    body[0].innerHTML = "";
    body[0].innerHTML = '<tr><td class="txt-center" colspan="9">FACTURACIÓN</td></tr>'

    
    if (json.terminadas.length == 0) {
        body[0].innerHTML += '<tr><td class="txt-center" colspan="9">No existe ningún registro</td></tr>';
    } else {
        render_salidas(json.terminadas,body)
    }

    body[0].innerHTML += '<tr><td colspan="9"></td></tr>'+
                            '<tr><td class="txt-center" colspan="9">COMPRA</td></tr>';

    if (json.compras.length == 0) {
        body[0].innerHTML += '<tr style="background: var(--background-aux);"><td class="txt-center" colspan="9">No existe ningún registro</td></tr>';
    } else {
        render_salidas(json.compras,body)
    }

    body[0].innerHTML += '<tr><td colspan="9"></td></tr>'+
                        '<tr><td class="txt-center" colspan="9">RDG</td></tr>';

    if (json.rdg.length == 0) {
        body[0].innerHTML += '<tr style="background: var(--background-aux);"><td class="txt-center" colspan="9">No existe ningún registro</td></tr>';
    } else {
        render_salidas(json.rdg,body)
    }

    body[0].innerHTML += '<tr><td colspan="9"></td></tr>'+
                            '<tr><td class="txt-center" colspan="9">CANCELADAS</td></tr>';
                            
    if (json.canceladas.length == 0) {
        body[0].innerHTML += '<tr style="background: var(--background-aux);"><td class="txt-center" colspan="9">No existe ningún registro</td></tr>';
    } else {
        render_salidas(json.canceladas,body)
    }
    
    body[0].innerHTML += '<tr><td colspan="9"></td></tr>'+
                            '<tr><td class="txt-center" colspan="9">NOTAS DE CREDITO</td></tr>';
    if (json.notas.length == 0) {
        body[0].innerHTML += '<tr style="background: var(--background-aux);"><td class="txt-center" colspan="9">No existe ningún registro</td></tr>';
    } else {
        render_salidas(json.notas,body)
    }

    body[0].innerHTML += '<tr><td colspan="9"></td></tr>'+
                            '<tr><td class="txt-center" colspan="9">FACTURAS SIN COMISIÓN</td></tr>';
    if (json.comision.length == 0) {
        body[0].innerHTML += '<tr style="background: var(--background-aux);"><td class="txt-center" colspan="9">No existe ningún registro</td></tr>';
    } else {
        render_salidas(json.comision,body)
    }

    suma_total()
};

const mostrarModal = (id) => {
    const respues = fetchAPI('', url+'/ventas/reportes/obtener_per?aux=' + id + '', '');
    respues.then(json => {
        pintarModal(json);
    });
}


const obtener = () => {
    const mes = document.getElementById('mes')
    const respuesta = fetchAPI('',url+'/ventas/reportes/obtener?mes='+mes.value, '')
    respuesta.then(json => {
        total_mes_costo = 0;
        total_mes_impuestos = 0;
        total_mes_total = 0;
        render_reporte(json);
        render_totales();
    })
};

const colocar_mes = () => {
    let date = new Date().toLocaleDateString()
    let fecha = date.split('/')
    let aux = ''

    if (fecha[1] < 10) {
        aux = fecha[2] + '-0' + fecha[1]
    } else {
        aux = fecha[2] + '-' + fecha[1]
    }

    document.getElementById('mes').value = aux
}

const input_mes = document.getElementById('mes')

input_mes.addEventListener('change', () => {
    obtener()
})

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

document.addEventListener('DOMContentLoaded', () => {
    colocar_mes()
    obtener();
})