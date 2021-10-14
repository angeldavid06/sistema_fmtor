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
                        '<td>'+el.kilos+'</td>'+
                        '<td>'+el.factor+'</td>'+
                        '<td>'+el.op+'</td>'+
                        '<td>'+el.fecha+'</td>'+
                        '<td>'+el.Cliente+'</td>'+
                        '<td>'+el.Medida+'</td>'+
                        '<td>'+el.Descripción+'</td>'+
                        '<td>'+el.Acabado+'</td>'+
                        '<td class="number">'+el.cantidad+'</td>'+
                        '<td class="number">$ ' + new Intl.NumberFormat('es-MX').format(el.precio)+'</td>'+
                        '<td class="number">$ ' + new Intl.NumberFormat('es-MX').format(el.Total)+'</td>'+
                        '<td class="number">' + new Intl.NumberFormat('es-MX').format(el.Acumulado)+'</td>'+
                        '<td>'+el.estado+'</p>'

        t_body[0].appendChild(tr)
    })
}

const render_reporte_diario = (json) => {
    const t_body= document.getElementsByClassName('body')
    json.forEach(el => {
        const tr = document.createElement('tr')
        tr.classList.add('tr')

        tr.innerHTML += '<td>'+el.Fecha+'</td>'+
                        '<td>'+el.turno+'</td>'+
                        '<td>'+el.estado+'</td>'+
                        '<td>'+el.Orden_de_producción+'</td>'+
                        '<td>'+el.Cliente+'</td>'+
                        '<td>'+el.kilos+'</td>'+
                        '<td>'+el.pzas+'</td>'+
                        '<td>'+el.Maquina+'</td>'
                        '<td>'+el.Descripcion+'</td>'+
                        '<td>'+el.observaciones+'</td>'
                        
        t_body[0].appendChild(tr)
    });
}

const obtener_ordenes = () => {
    const respuesta = fetchAPI('',url+'/scp_fmtor/?controller=opController&action=obtener_ordenes','')
    respuesta.then(json => {
        // render_ordenes(json)
        console.log(json);
    })
}

const obtener_reporte_diario = () => {
    const respuesta = fetchAPI('',url+'/scp_fmtor/?controller=opController&action=obtener_reporte_diario','')
    respuesta.then(json => {
        render_reporte_diario(json)
    })
}

document.addEventListener('DOMContentLoaded', () => {
    obtener_ordenes()
});

