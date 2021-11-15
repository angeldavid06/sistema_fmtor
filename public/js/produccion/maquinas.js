const dias = {
    nombre: ["Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sabado"]
}

const input = document.getElementById('fecha_reporte')
const select = document.getElementById('pzas_kilos')
        
const quitar_semanas = () => {
    if (document.getElementById('acordeon')) {
        const acordeon = document.getElementById('acordeon')

        document.getElementsByClassName('informacion')[1].removeChild(acordeon)
    }
}

const render_semana = (json,semana) => {
    const turnos = []
    let aux = []
    let contador = 1

    json.forEach(el => {
        if (contador == 9) {
            if (select.value == 'kilos') {
                aux.push(el.kilos)
            } else if (select.value == 'pzas') {
                aux.push(el.pzas)
            }
            aux.push(el.fecha)
            aux.push(el.turno)
            turnos.push(aux)
            aux = []
            contador = 1;
        } else {
            if (select.value == 'kilos') {
                aux.push(el.kilos)
            } else if (select.value == 'pzas') {
                aux.push(el.pzas)
            }
            contador++
        }
    });

    aux = []

    for (let i = 0; i < turnos.length; i++) {
        for (let j = 0; j < 10; j++) {
            aux.push(turnos[i][j])
        }
        aux = []

        document.getElementById('body_'+semana).innerHTML += '<tr>'+
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
}

const obtener_semanas = (anio, mes) => {    
    let limite_semana = []
    let inicio = 1
    let fin = 0

    const informacion = document.getElementsByClassName('informacion')
    const dias_mes = new Date(anio, mes, 0).getDate()

    for (let i = 1; i <= dias_mes; i++) {
        const dia = new Date(anio, mes-1, i)
        if (dia.getDay() == 6 || i == dias_mes) {
            limite_semana.push(dia.getDate())
        }
    }

    const acordeon_div = document.createElement('div')
    acordeon_div.classList.add('acordeon')
    acordeon_div.classList.add('tarjeta_transparente')
    acordeon_div.setAttribute('id','acordeon')
    informacion[1].appendChild(acordeon_div)

    const acordeon = document.getElementsByClassName('acordeon')

    for (let i = 0; i < limite_semana.length; i++) {
        const div = document.createElement('div')
        div.innerHTML += '<div class="acordeon_opcion">'+
                                        '<div class="titulo_acordeon">'+
                                            '<h3 data-acordeon="semana_'+i+'">Semana '+(i+1)+'</h3>'+
                                        '</div>'+
                                        '<div id="semana_'+i+'" class="contenido_acordeon mostrar_contenido">'+
                                            '<table>'+
                                                '<thead>'+
                                                    '<tr>'+
                                                        '<th>Día</th>'+
                                                        '<th>Máquina 1</th>'+
                                                        '<th>Máquina 2</th>'+
                                                        '<th>Máquina 3</th>'+
                                                        '<th>Máquina 4</th>'+
                                                        '<th>Máquina 5</th>'+
                                                        '<th>Máquina 6</th>'+
                                                        '<th>Máquina 7</th>'+
                                                        '<th>Máquina 8</th>'+
                                                        '<th>Máquina 9</th>'+
                                                    '</tr>'+
                                                '</thead>'+
                                                '<tbody id="body_'+(i+1)+'">'+
                                                '</tbody>'+
                                            '</table>'+
                                        '</div>'+
                                    '</div>'
        acordeon[0].appendChild(div)
        if (i == 0) {
            inicio = '01'
        } else {
            if (limite_semana[i-1] < 10) {
                inicio = '0'+(limite_semana[i-1]+1)
            } else {
                inicio = limite_semana[i-1]+1
            }
        }

        if (limite_semana[i] < 10) {
            fin = '0'+(limite_semana[i])
        } else {
            fin = (limite_semana[i])
        }

        obtener_dias(select.value,anio+'-'+mes+'-'+inicio,anio+'-'+mes+'-'+fin, (i+1))
    }
}

const obtener_dias = (concepto, inicio, fin, semana) => {
    const respuesta = fetchAPI('',url+'/produccion/maquinas/obtener_reporte?concepto='+concepto+'&inicio='+inicio+'&fin='+fin,'')
    respuesta.then(json => {
        render_semana(json,semana)
        // console.log(json);
    })
}

const generar_reporte = (input,select) => {
    if (input != '' && select != '') {
        const fecha = input.split('-')
        quitar_semanas()
        obtener_semanas(fecha[0],fecha[1])
    }
}

input.addEventListener('change', () => {
    generar_reporte(input.value,select.value)
}) 

select.addEventListener('change', () => {
    generar_reporte(input.value,select.value)
})