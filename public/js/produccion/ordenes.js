const render_ordenes = (json) => {
    const t_body= document.getElementsByClassName('body')
    let total_acumulado = 0
    json.forEach(el => {
        const tr = document.createElement('tr')
    
        tr.classList.add('tr')

        if (el.estado == 'TERMINADO') {
            tr.classList.add('terminado')
        } else if (el.estado == 'CANCELADO') {
            tr.classList.add('cancelado')
        }

        tr.innerHTML += '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.calibre+'</td>'+
                        '<td class="txt-right" data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+new Intl.NumberFormat('es-MX').format(el.factor*el.cantidad_elaborar)+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.factor+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.Id_Folio+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.Fecha.split(' ')[0]+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.Clientes+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.descripcion+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.acabados+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano" class="number">'+el.cantidad_elaborar+'</td>'+
                        '<td class="txt-right" data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano" class="number">$ ' + new Intl.NumberFormat('es-MX').format(el.precio_millar)+'</td>'+
                        '<td class="txt-right" data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano" class="number">$ ' + new Intl.NumberFormat('es-MX').format(el.TOTAL)+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano" class="number txt-right">' + new Intl.NumberFormat('es-MX').format(el.acumulado) + '</td>'+
                        '<td>' + el.estado_general+'</td>'
        t_body[0].appendChild(tr)
    })
}

const render_reporte_diario = (json) => {
    const t_body= document.getElementsByClassName('body')
    json.forEach(el => {
        const tr = document.createElement('tr')
        tr.classList.add('tr')

        tr.innerHTML += '<td>'+el.fecha.split(' ')[0]+'</td>'+
                        '<td>'+el.turno+'</td>'+
                        '<td>'+el.estado_general+'</td>'+
                        '<td>'+el.Id_Folio+'</td>'+
                        '<td>'+el.Clientes+'</td>'+
                        '<td>'+el.kilos+'</td>'+
                        '<td>'+el.pzas+'</td>'+
                        '<td>'+el.Maquina+'</td>'+
                        '<td>'+el.descripcion+'</td>'+
                        '<td>'+el.observaciones+'</td>'
                        
        t_body[0].appendChild(tr)
    });
}

const obtener_ordenes = () => {
    const respuesta = fetchAPI('',url+'/produccion/op/obtener_ordenes','')
    respuesta.then(json => {
        render_ordenes(json)
    })
}

const obtener_reporte_diario = () => {
    const respuesta = fetchAPI('',url+'/produccion/op/obtener_reporte_diario','')
    respuesta.then(json => {
        render_reporte_diario(json)
    })
}

const obtener_plano = (id_catalogo) => {
    const plano = fetchBlob(url+'/produccion/op/obtener_plano?id_plano='+id_catalogo)
    plano.then(blob => {
        const div_plano = document.getElementById('plano')
        const embed = document.createElement('embed')

        div_plano.innerHTML='';
        
        embed.classList.add('height-100');
        embed.setAttribute('type','application/pdf')
        embed.setAttribute('src','data:application/pdf;base64,'+encodeURI(blob))
        
        div_plano.appendChild(embed)
    })
}

const tipo_consulta = (url_pdf) => {
    const op = document.getElementById('op')
    const fecha = document.getElementById('fecha')
    const cliente = document.getElementById('cliente')
    const estado = document.getElementById('estado')
    const mes = document.getElementById('fecha_mes')
    const anio = document.getElementById('fecha_anio')
    const r_op = document.getElementById('rango_op')
    const r_fecha = document.getElementById('rango_fecha')

    if (op.checked) {
        url_pdf += '&filtro=op&f_op='+document.getElementById('f_op').value
    } else if(r_op.checked){
        url_pdf += '&filtro=r_op&f_r_op_m='+document.getElementById('f_r_op_m').value+'&f_r_op_M='+document.getElementById('f_r_op_M').value
    } else if(r_fecha.checked){
        url_pdf += '&filtro=r_fecha&f_r_fecha_m='+document.getElementById('f_r_fecha_m').value+'&f_r_fecha_M='+document.getElementById('f_r_fecha_M').value
    } else if(fecha.checked){
        url_pdf += '&filtro=fecha&f_fecha='+document.getElementById('f_fecha').value
    } else if(cliente.checked){
        url_pdf += '&filtro=cliente&f_cliente='+document.getElementById('f_cliente').value
    } else if(estado.checked){
        url_pdf += '&filtro=estado&f_estado='+document.getElementById('f_estado').value
    } else if(mes.checked){
        url_pdf += '&filtro=mes&f_mes='+document.getElementById('f_fecha_mes').value
    } else if(anio.checked){
        url_pdf += '&filtro=anio&f_anio='+document.getElementById('f_fecha_anio').value
    } else {
        url_pdf += '&filtro=todo'
    }

    printPage(url_pdf);
}

const consulta_PDF = () => {
    // const select_formatos = document.getElementById('seleccion_formato')
        tipo_consulta(url+'/produccion/op/pdf_ordenes?formato=v_ordenes')
    // if (select_formatos.value == 0) {
    // } else if (select_formatos.value == 1) {
    //     tipo_consulta(url+'/produccion/op/pdf_ordenes?formato=v_reportediario')
    // }
}

const generar_PDF = () => {
    consulta_PDF()
}

const restaurar_formulario = () => {
    const inputs_radio = document.getElementsByName('buscar_por');
    for (let i = 0; i < inputs_radio.length; i++) {
        inputs_radio[i].checked = false;
    }

    const inputs = document.getElementsByClassName('input');
    for (let i = 0; i < inputs.length; i++) {
        inputs_radio.value = '';
    }
}

const btn_reset = document.getElementById('btn_resetear');

btn_reset.addEventListener('click', () => {
    obtener_ordenes()
    restaurar_formulario()
})

document.addEventListener('DOMContentLoaded', () => {
    obtener_ordenes()
});

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.plano) {
        obtener_plano(evt.target.dataset.plano)
    } else if (evt.target.dataset.impresion) {
        generar_PDF()
    }
})