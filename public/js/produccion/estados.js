let total_kg = 0.0;
let total_pzas = 0;

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.estado) {
        quit_class();
        evt.target.classList.add('active')
        const estado = document.getElementsByClassName('estado_'+evt.target.dataset.estado);
        const titulo_estado = document.getElementsByClassName('titulo_estado');
        estado[0].classList.add('show')
        titulo_estado[0].innerHTML = evt.target.dataset.titulo;
        if (document.getElementById('op_control').value != '') {
            obtener_control(evt.target.dataset.estado)
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
    const info = document.getElementsByClassName('info')

    json.forEach(el => {
        info[0].innerHTML = '<h3>Información de la O.P.</h3>'+
                            '<p>Código Del Dibujo:</p>'+
                            '<label class="cod_dibujo">'+el.Código_de_dibujo+'</label>'+
                            '<p>Cliente:</p>'+
                            '<label class="cliente">'+el.Cliente+'</label>'+
                            '<p>Fecha:</p>'+
                            '<label class="fecha">'+el.fecha+'</label>'+
                            '<p>Cantidad:</p>'+
                            '<label class="cantidad">'+el.cantidad+'</label>'+
                            '<p>Descripción:</p>'+
                            '<label class="descripcion">'+el.Descripción+'</label>';
    })
}

const quitar_filas = (tabla) => {
    const body = document.getElementsByClassName('body_'+tabla)
    while (body[0].firstChild) {
        body[0].removeChild(body[0].firstChild)
    }
}

const render_control = (vista,json) => {
    total_kg = 0.0;
    total_pzas = 0;
    const body = document.getElementsByClassName('body_'+vista)
    const op_control = document.getElementById('op_control')

    quitar_filas(vista)

    json.forEach(el => {
        body[0].innerHTML += '<tr>'+
                                    '<td>'+el.botes+'</td>'+
                                    '<td>'+el.fecha+'</td>'+
                                    '<td>'+new Intl.NumberFormat('es-MX').format(el.pzas)+'</td>'+
                                    '<td>'+new Intl.NumberFormat('es-MX').format(el.kilos)+'</td>'+
                                    '<td>'+el.no_maquina+'</td>'+
                                '</tr>';
        total_kg += parseFloat(el.kilos)
        total_pzas += parseInt(el.pzas)
        op_control.dataset.control = el.control
    });

    const total_kilogramos = document.getElementsByClassName('total_kg')
    const total_acumuladas = document.getElementsByClassName('total_acumuladas')

    total_kilogramos[0].innerHTML = 'Total k.g.: ' + new Intl.NumberFormat('es-MX').format(total_kg)
    total_acumuladas[0].innerHTML = 'Pzas. Acumuladas: ' + new Intl.NumberFormat('es-MX').format(total_pzas)
}