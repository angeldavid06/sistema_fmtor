const quitar_filas = (t_body) => {
    while(t_body.firstChild){
        t_body.removefirstChild(t_body.firstChild)
    }
}

const render_ordenes = (json) => {
    const t_body= document.getElementsByClassName('body')
    json.forEach(el => {
        const tr = document.createElement('tr')

        tr.classList.add('tr')

        if (el.estado == 'TERMINADO') {
            tr.classList.add('terminado')
        } else if (el.estado == 'CANCELADO') {
            tr.classList.add('cancelado')
        }

        tr.innerHTML += '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.calibre+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+new Intl.NumberFormat('es-MX').format(el.factor*el.cantidad_elaborar)+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.factor+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.Id_Folio+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.Fecha.split(' ')[0]+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.Clientes+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.descripcion+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano">'+el.acabados+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano" class="number">'+el.cantidad_elaborar+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano" class="number">$ ' + new Intl.NumberFormat('es-MX').format(el.precio_millar)+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano" class="number">$ ' + new Intl.NumberFormat('es-MX').format(el.TOTAL)+'</td>'+
                        '<td data-plano="'+el.Id_Catalogo+'" data-modal="modal-plano" class="number">' + /*new Intl.NumberFormat('es-MX').format(Acumulado)*/'Acumulado'+'</td>'+
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

document.addEventListener('DOMContentLoaded', () => {
    obtener_ordenes()
});

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.plano) {
        obtener_plano(evt.target.dataset.plano)
    }
})