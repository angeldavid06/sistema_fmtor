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

            if (document.getElementById('nuevo_factor')) {
                document.getElementById('nuevo_factor').dataset.est = evt.target.dataset.id
            }

            obtener_control(evt.target.dataset.estado)
            obtener_op_control(op_control.value);
            obtener_factor(evt.target.dataset.id)
            document.getElementById('op_control').classList.remove('input-error')
        } else {
            open_alert('No ha introducido la Orden de Producción', 'naranja')
            op_control.classList.add('input-error')
        }
    } 
});

if (document.getElementById('nuevo_factor')) {
    const btn_nuevo_factor = document.getElementById('nuevo_factor')
    btn_nuevo_factor.addEventListener('click', () => {
        actualizar_factor(btn_nuevo_factor.dataset.est);
    })
}

const actualizar_factor = (estado) => {
    const op_control = document.getElementById('op_control')
    const factor_control = document.getElementById('factor_control')
    if (factor_control.value != '') {
        if (op_control.value != '') {
            factor_control.classList.remove('input-error')
            const respuesta =fetchAPI('',url+'/produccion/control/actualizar_factor?estado='+estado+'&op='+op_control.value+'&factor='+factor_control.value,'')
            respuesta.then(json => {
                obtener_factor(estado)
                op_control.classList.remove('input-error')
                factor_control.classList.remove('input-error')
                if (json) {
                    open_alert('Factor actualizado correctamente','verde')
                }
            })
        } else {
            open_alert('No ha introducido la Orden de Producción','naranja')
            op_control.classList.add('input-error')
        }
    } else {
        open_alert('No ha introducido el factor','naranja')
        factor_control.classList.add('input-error')
    }
}

const obtener_factor = (estado) => {
    const op_control = document.getElementById('op_control')
    const factor_control = document.getElementById('factor_control')
    const respuesta = fetchAPI('',url+'/produccion/control/obtener_factor?estado='+estado+'&op='+op_control.value,'')
    respuesta.then(json => {
        factor_control.value = json.factor;
    })
}

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
        info[0].innerHTML = '<label>Código Del Dibujo: <br> '+el.plano+'</label>'+
                            '<label>Cliente: <br> '+el.Cliente+'</label>'+
                            '<label>Fecha: <br> '+el.Fecha.split(' ')[0]+'</label>'+
                            '<label>Cantidad: <br> '+el.cantidad_elaborar+'</label>'+
                            '<label>Descripción: <br> '+el.descripcion+'</label>'+
                            '<label>Tratamiento: <br> '+el.tratamiento+'</label>'+
                            '<label>Material: <br> '+el.material+'</label>'+
                            '<label>Factor: <br> '+el.factor+'</label>';
    })
}

const quitar_filas = () => {
    const body = document.getElementsByClassName('body')
    while (body[0].firstChild) {
        body[0].removeChild(body[0].firstChild)
    }
}

const btn_informacion = document.getElementById('informacion_op')

btn_informacion.addEventListener('click', () => {
    const op_control = document.getElementById('op_control')
    if (op_control.value == '') {
        open_alert('No ha introducido la Orden de Producción','naranja')
        op_control.classList.add('input-error')
    } else {
        obtener_op_control(op_control.value);
        op_control.classList.remove('input-error')
    }
})