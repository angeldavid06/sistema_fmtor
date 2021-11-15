const dias = {
    nombre: ["","Lunes","Martes","Miercoles","Jueves","Viernes","Sabados"]
}
        
const quitar_dias = () => {
    const body = document.getElementById('body')
    while (body.firstChild) {
        body.removeChild(body.firstChild)
    }
}

const render_reporte = (json, anio, mes) => {
    const turnos = []

    let aux = []
    let contador = 1;

    console.log(json);

    json.forEach(el => {
        if (contador == 9) {
            aux.push(el.kilos)
            aux.push(el.fecha)
            aux.push(el.turno)
            turnos.push(aux)
            aux = []
            contador = 1;
        } else {
            aux.push(el.kilos)
            contador++
        }
    });

    for (let i = 0; i < turnos.length; i++) {
        document.getElementById('body').innerHTML += '<tr>'+
                                                        '<td>'+turnos[i][9]+'</td>' +
                                                        '<td>'+turnos[i][0]+'</td>' +
                                                        '<td>'+turnos[i][1]+'</td>' +
                                                        '<td>'+turnos[i][2]+'</td>' +
                                                        '<td>'+turnos[i][3]+'</td>' +
                                                        '<td>'+turnos[i][4]+'</td>' +
                                                        '<td>'+turnos[i][5]+'</td>' +
                                                        '<td>'+turnos[i][6]+'</td>' +
                                                        '<td>'+turnos[i][7]+'</td>' +
                                                        '<td>'+turnos[i][8]+'</td>'+
                                                    '</tr>';
    }

    console.log(turnos);

    // const fragmento = document.createDocumentFragment()
    // const dia = new Date(anio, mes, 0).getDate()
    // 
    // for (let i = 1; i <= dia; i++) {
    //     const fecha_exacta = new Date(anio, mes-1, i)
    //     if (fecha_exacta.getDay() != 0) {
    //         document.getElementById('body').innerHTML += '<tr>'+
    //                                                         '<td>'+fecha_exacta.getDate()+' - '+dias.nombre[fecha_exacta.getDay()]+'</td>' +
    //                                                         '<td></td>' +
    //                                                         '<td></td>' +
    //                                                         '<td></td>' +
    //                                                         '<td></td>' +
    //                                                         '<td></td>' +
    //                                                         '<td></td>' +
    //                                                         '<td></td>' +
    //                                                         '<td></td>' +
    //                                                         '<td></td>'+
    //                                                     '</tr>';
    //     }
    // }
}

const obtener_dias = (anio, mes) => {
    quitar_dias()

    const respuesta = fetchAPI('',url+'/produccion/maquinas/obtener_reporte_kilos?fecha='+anio+'-'+mes,'')
    respuesta.then(json => {
        render_reporte(json, anio, mes);
    })
}

const input = document.getElementById('fecha_reporte')

input.addEventListener('change', () => {
    const fecha = input.value.split('-')
    obtener_dias(fecha[0],fecha[1])
}) 