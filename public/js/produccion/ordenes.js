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

        tr.innerHTML += '<td>'+el.calibre+'</td>'+
                        '<td>'+new Intl.NumberFormat('es-MX').format(el.factor*el.cantidad_elaborar)+'</td>'+
                        '<td>'+el.factor+'</td>'+
                        '<td>'+el.Id_Folio+'</td>'+
                        '<td>'+el.Fecha.split(' ')[0]+'</td>'+
                        '<td>'+el.Clientes+'</td>'+
                        '<td>'+el.descripcion+'</td>'+
                        '<td>'+el.acabados+'</td>'+
                        '<td class="number">'+el.cantidad_elaborar+'</td>'+
                        '<td class="number">$ ' + new Intl.NumberFormat('es-MX').format(el.precio_millar)+'</td>'+
                        '<td class="number">$ ' + new Intl.NumberFormat('es-MX').format(el.TOTAL)+'</td>'+
                        '<td class="number">' + /*new Intl.NumberFormat('es-MX').format(Acumulado)*/'Acumulado'+'</td>'+
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

document.addEventListener('DOMContentLoaded', () => {
    obtener_ordenes()
});

