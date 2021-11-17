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

    let totales_semanales = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    let aux = []
    let observaciones = []
    let contador = 1
    let a = ''

    if (json.length > 0) {
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
                a = el.observaciones.replace(/\s+/g, '_')
                observaciones.push(a)
                aux = []
                contador = 1;
            } else {
                if (select.value == 'kilos') {
                    aux.push(el.kilos)
                } else if (select.value == 'pzas') {
                    aux.push(el.pzas)
                }
                a = el.observaciones.replace(/\s+/g, '_')
                observaciones.push(a)
                contador++
            }
        });
    
        aux = []
        contador = 0;
    
        for (let i = 0; i < turnos.length; i++) {
            for (let j = 0; j < 10; j++) {
                aux.push(turnos[i][j])
            }
            aux = []
    
            const fecha = turnos[i][9].split(' ')
            const total_semana = parseInt(turnos[i][0])+parseInt(turnos[i][2])+parseInt(turnos[i][3])+parseInt(turnos[i][4])+parseInt(turnos[i][5])+parseInt(turnos[i][6])+parseInt(turnos[i][7])+parseInt(turnos[i][8])
    
            document.getElementById('body_'+semana).innerHTML += '<tr>'+
                                                                    '<td>'+fecha[0]+'</td>' +
                                                                    '<td class="txt-center '+observaciones[contador]+'">'+turnos[i][0]+'</td>' +
                                                                    '<td class="txt-center '+observaciones[contador+1]+'">'+turnos[i][1]+'</td>' +
                                                                    '<td class="txt-center '+observaciones[contador+2]+'">'+turnos[i][2]+'</td>' +
                                                                    '<td class="txt-center '+observaciones[contador+3]+'">'+turnos[i][3]+'</td>' +
                                                                    '<td class="txt-center '+observaciones[contador+4]+'">'+turnos[i][4]+'</td>' +
                                                                    '<td class="txt-center '+observaciones[contador+5]+'">'+turnos[i][5]+'</td>' +
                                                                    '<td class="txt-center '+observaciones[contador+6]+'">'+turnos[i][6]+'</td>' +
                                                                    '<td class="txt-center '+observaciones[contador+7]+'">'+turnos[i][7]+'</td>' +
                                                                    '<td class="txt-center '+observaciones[contador+8]+'">'+turnos[i][8]+'</td>' +
                                                                    '<td class="txt-center"></td>' +
                                                                    '<td class="txt-center">'+total_semana+'</td>' +
                                                                    '<td class="txt-center">0</td>' +
                                                                    '<td class="txt-center">0</td>' +
                                                                    '<td class="txt-center">0</td>' +
                                                                    '<td class="txt-center">0</td>' +
                                                                    '<td class="txt-center">0</td>' +
                                                                    '<td class="txt-center">0</td>' +
                                                                    '<td class="txt-center">0</td>' +
                                                                    '<td class="txt-center">0</td>' +
                                                                    '<td class="txt-center">0</td>' +
                                                                    '<td class="txt-center">0</td>' +
                                                                    '<td class="txt-center">0</td>' +
                                                                '</tr>';
            totales_semanales[0] += parseInt(turnos[i][0],10)
            totales_semanales[1] += parseInt(turnos[i][1],10)
            totales_semanales[2] += parseInt(turnos[i][2],10)
            totales_semanales[3] += parseInt(turnos[i][3],10)
            totales_semanales[4] += parseInt(turnos[i][4],10)
            totales_semanales[5] += parseInt(turnos[i][5],10)
            totales_semanales[6] += parseInt(turnos[i][6],10)
            totales_semanales[7] += parseInt(turnos[i][7],10)
            totales_semanales[8] += parseInt(turnos[i][8],10)
            totales_semanales[10] += parseInt(total_semana)
            contador+=9
        }

        const tfoot = document.createElement('tfoot')
        const tr = document.createElement('tr')
        tr.innerHTML += '<td>Total:</td>'
        for (let i = 0; i < totales_semanales.length; i++) {
            if (i > 9 || i < 9) {
                tr.innerHTML += '<td class="txt-center">'+ new Intl.NumberFormat('es-MX').format(totales_semanales[i])+'</td>'
            } else {
                tr.innerHTML += '<td></td>';
            }
        }
        tfoot.appendChild(tr)
        document.getElementById('tabla_'+semana).appendChild(tfoot)

        console.log(totales_semanales);
    } else {
        document.getElementById('body_'+semana).innerHTML += '<tr>'+
                                                                '<td colspan="25" class="txt-center">No existe ningún registro</td>' +
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
                                            '<table id="tabla_'+(i+1)+'">'+
                                                '<thead>'+
                                                    '<tr>'+
                                                        '<th rowspan="2">Día</th>'+
                                                        '<th colspan="9">REPORTE DIARIO POR MAQUINA</th>'+
                                                        '<th></th>'+
                                                        '<th colspan="14">REGISTRO DIARIO DE PRODUCCIÓN</th>'+
                                                    '</tr>'+
                                                    '<tr>'+
                                                        '<th>1</th>'+
                                                        '<th>2</th>'+
                                                        '<th>3</th>'+
                                                        '<th>4</th>'+
                                                        '<th>5</th>'+
                                                        '<th>6</th>'+
                                                        '<th>7</th>'+
                                                        '<th>8</th>'+
                                                        '<th>9</th>'+
                                                        '<th></th>'+
                                                        '<th colspan="2">FORJADO</th>'+
                                                        '<th colspan="2">RANURADO</th>'+
                                                        '<th colspan="2">SHANK</th>'+
                                                        '<th colspan="2">TOTAL RANURADO</th>'+
                                                        '<th colspan="2">ROLADO</th>'+
                                                        '<th colspan="2">Acabado</th>'+
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

const auto = () => {
    const hoy = new Date()
    const year = hoy.getFullYear();
    const month = hoy.getMonth();

    input.value = year+'-'+(month+1)
}

(() => {
    auto()
})()