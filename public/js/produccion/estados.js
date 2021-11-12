const totales = {
    total_kg: 0.0,
    total_pzas: 0
}

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.estado) {
        if (document.getElementById('op_control').value != '') {
            quit_class()
            evt.target.classList.add('active')
            
            const titulo_estado = document.getElementsByClassName('titulo_estado');
        
            titulo_estado[0].innerHTML = evt.target.dataset.titulo;
            obtener_control(evt.target.dataset.estado)
        } else {
            open_alert('No ha introducido la Orden de Producción', 'rojo')
        }
    } 
});

const quit_class = () => {
    const botones = document.getElementsByClassName('boton_estado');
    for (let i = 0; i < botones.length; i++) {
        botones[i].classList.remove('active')
    }
    const estado = document.getElementsByClassName('table-control');
    for (let i = 0; i < estado.length; i++) {
        estado[i].classList.remove('show')
    }
}

const obtener_control = (vista) => {
    const op_control = document.getElementById('op_control')
    const data = {
        vista: vista,
        op: op_control.value
    }
    const control = JSON.stringify(data);
    const respuesta = fetchAPI('',url+'/produccion/control/obtener_control?control='+control,'');
    respuesta.then(json => {
        render_control(vista,json)
        obtener_op_control(op_control.value)
    })
}

const obtener_op_control = (op) => {
    const info = document.getElementsByClassName('info')
    const respuesta = fetchAPI('',url+'/produccion/control/obtener_info_op?op='+op,'');
    respuesta.then(json => {
        quitar_info(info[0])
        render_info(json)
    })
}

const quitar_info = (info) => {
    while (info.firstChild) {
        info.removeChild(info.firstChild)
    }
}

const render_info = (json) => {
    const op_control = document.getElementById('op_control')
    const info = document.getElementsByClassName('info')

    json.forEach(el => {
        info[0].innerHTML = '<label>Código Del Dibujo:  '+el.plano+'</label>'+
                            '<label>Cliente:  '+el.Cliente+'</label>'+
                            '<label>Fecha:  '+el.Fecha+'</label>'+
                            '<label>Cantidad:  '+el.cantidad_millares+'</label>'+
                            '<label>Descripción:  '+el.descripcion+'</label>';
        op_control.value = el.id_control_produccion
    })
}

const quitar_filas = (tabla) => {
    const body = document.getElementsByClassName('body')
    while (body[0].firstChild) {
        body[0].removeChild(body[0].firstChild)
    }
}

const render_control = (vista,json) => {
    totales.total_kg = 0.0;
    totales.total_pzas = 0;
    const body = document.getElementsByClassName('body')
    const op_control = document.getElementById('op_control')

    quitar_filas(vista)

    json.forEach(el => {
        body[0].innerHTML += '<tr>'+
                                    '<td><button class="btn btn-icon-self btn-rojo material-icons" data-opcion="cerrar" data-eliminar='+el.id_registro_diario+'>delete</button></td>'+
                                    '<td><button class="btn btn-icon-self material-icons" data-modal="modal-actualizar" data-opcion="actualizar"  data-edit="'+el.id_registro_diario+'">edit</button></td>'+
                                    '<td>'+el.botes+'</td>'+
                                    '<td>'+el.fecha+'</td>'+
                                    '<td class="txt-right">'+new Intl.NumberFormat('es-MX').format(el.pzas)+'</td>'+
                                    '<td class="txt-right">'+new Intl.NumberFormat('es-MX').format(el.kilos)+'</td>'+
                                    '<td class="txt-right">'+el.no_maquina+'</td>'+
                                '</tr>';
        totales.total_kg += parseFloat(el.kilos)
        totales.total_pzas  += parseInt(el.pzas)
    });

    const factor = document.getElementsByClassName('factor')
    const total_kilogramos = document.getElementsByClassName('total_kg')
    const total_acumuladas = document.getElementsByClassName('total_acumuladas')

    factor[0].innerHTML = 'Factor: <br> 00.00'
    total_kilogramos[0].innerHTML = 'Total k.g.: <br>' + new Intl.NumberFormat('es-MX').format(totales.total_kg)
    total_acumuladas[0].innerHTML = 'Pzas. Acumuladas: <br>' + new Intl.NumberFormat('es-MX').format(totales.total_pzas)
}