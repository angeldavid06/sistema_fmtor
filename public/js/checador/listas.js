//librerias

let empleados = []
let i = 0

const quitar_filas = (t_body) => {
    while(t_body.firstChild){
        t_body.removefirstChild(t_body.firstChild)
    }
}
const render_horarioV = (json) => {
    const t_body= document.getElementsByClassName('body')
    json.forEach(lis => {
        const tr = document.createElement('tr')
        tr.classList.add('tr')

        tr.innerHTML += '<td>'+lis.nombre+'</td>'+
                        '<td>'+lis.apellidoP+'</td>'+
                        '<td>'+lis.apellidoM+'</td>'+
                        '<td>'+lis.entrada+'</td>'+
                        '<td>'+lis.almuerzoS+'</td>'+
                        '<td>'+lis.almuerzoR+'</td>'+
                        '<td>'+lis.salida+'</td>';

        t_body[0].appendChild(tr)
    });
}

const render_lista_diaria = (json) => {
    const t_body= document.getElementsByClassName('body')
    json.forEach(lis => {
        const tr = document.createElement('tr')
        tr.classList.add('tr')

        tr.innerHTML += '<td>'+lis.nombre+'</td>'+
                        '<td>'+lis.apellidoP+'</td>'+
                        '<td>'+lis.apellidoM+'</td>'+
                        '<td>'+lis.entrada+'</td>'+
                        '<td>'+lis.fecha+'</td>';

        t_body[0].appendChild(tr)
    });
}

const render_lista_almuerzo = (json) => {
    const t_body= document.getElementsByClassName('body')
    json.forEach(lis => {
        const tr = document.createElement('tr')
        tr.classList.add('tr')

        tr.innerHTML += '<td>'+lis.nombre+'</td>'+
                        '<td>'+lis.apellidoP+'</td>'+
                        '<td>'+lis.apellidoM+'</td>'+
                        '<td>'+lis.almuerzoS+'</td>'+
                        '<td>'+lis.fecha+'</td>';

        t_body[0].appendChild(tr)
    });
}

const render_lista_salida = (json) => {
    const t_body= document.getElementsByClassName('body')
    json.forEach(lis => {
        const tr = document.createElement('tr')
        tr.classList.add('tr')

        tr.innerHTML += '<td>'+lis.nombre+'</td>'+
                        '<td>'+lis.apellidoP+'</td>'+
                        '<td>'+lis.apellidoM+'</td>'+
                        '<td>'+lis.salida+'</td>'+
                        '<td>'+lis.fecha+'</td>';

        t_body[0].appendChild(tr)
    });
}

const render_lista_salidaExtra = (json) => {
    const t_body= document.getElementsByClassName('body')
    json.forEach(lis => {
        const tr = document.createElement('tr')
        tr.classList.add('tr')

        tr.innerHTML += '<td>'+lis.nombre+'</td>'+
                        '<td>'+lis.apellidoP+'</td>'+
                        '<td>'+lis.apellidoM+'</td>'+
                        '<td>'+lis.salida+'</td>'+
                        '<td>'+lis.fecha+'</td>';

        t_body[0].appendChild(tr)
    });
}

const render_lista_semanal = (horario) => {
    const t_body= document.getElementsByClassName('body')
    const tr = document.createElement('tr')
    const semana = ['','','','','','']
    for (let j = 0; j < semana.length; j++) {
        if (horario[0][j].split(' ').length >= 2) {
            const fecha = horario[0][j].split(' ')[0]
            const dia_semana = new Date(fecha.split('-')[0],fecha.split('-')[1]-1,fecha.split('-')[2])
            if (dia_semana.getDay() == 2) {
                semana[0] = horario[0][j].split(' ')[1]
            } else if (dia_semana.getDay() == 3) {
                semana[1] = horario[0][j].split(' ')[1]
            } else if (dia_semana.getDay() == 4) {
                semana[2] = horario[0][j].split(' ')[1]
            } else if (dia_semana.getDay() == 5) {
                semana[3] = horario[0][j].split(' ')[1]
            } else if (dia_semana.getDay() == 6) {
                semana[4] = horario[0][j].split(' ')[1]
            } else if (dia_semana.getDay() == 1) {
                semana[5] = horario[0][j].split(' ')[1]
            }
        }
    }
    
    tr.classList.add('tr')
    tr.innerHTML += '<td>'+empleados[i][0]+'</td>'+
                    '<td>'+empleados[i][1]+'</td>'+
                    '<td>'+semana[0]+'</td>'+   //Martes
                    '<td>'+semana[1]+'</td>'+   //Miercoles
                    '<td>'+semana[2]+'</td>'+   //Jueves
                    '<td>'+semana[3]+'</td>'+   //Viernes
                    '<td>'+semana[4]+'</td>'+   //Sabado
                    '<td>'+semana[5]+'</td>'+   //Lunes
                    '<td>'+'</td>'+  //Descuento
                    '<td>'+'</td>'; //Nota
    t_body[0].appendChild(tr)
    i++;
}

const obtener_horario = () => {
    const respuesta = fetchAPI('',url+'/checador/horarioController/obtener_horario','')
    respuesta.then(json => {
        render_horarioV(json)
    })
};
const obtener_lista_diaria = () => {
    const respuesta = fetchAPI('',url+'/checador/horarioController/obtener_lista_diaria','')
    respuesta.then(json => {
        render_lista_diaria(json)
    }) 
};
const obtener_lista_almuerzo = () => {
    const respuesta = fetchAPI('',url+'/checador/horarioController/obtener_lista_almuerzo','')
    respuesta.then(json => {
        render_lista_almuerzo(json)
    })
};
const obtener_lista_salida = () => {
    const respuesta = fetchAPI('',url+'/checador/horarioController/obtener_lista_salida','')
    respuesta.then(json => {
        render_lista_salida(json)
    })
};
const obtener_lista_salidaExtra = () => {
    const respuesta = fetchAPI('',url+'/checador/horarioController/obtener_lista_salidaExtra','')
    respuesta.then(json => {
        render_lista_salidaExtra(json)
    })
};

const rango_minimo = document.getElementById('rango_minimo')
const rango_maximo = document.getElementById('rango_maximo')

const obtener_registro = (id) => {
    let aux = []
    let horario = []
    const respuesta = fetchAPI('',url+'/checador/horarioController/obtener_registro?id_empleado='+id+'&fecha_in='+rango_minimo.value+'&fecha_fin='+rango_maximo.value,'')
    respuesta.then(json => {
        if (json.length > 0) {
            json.forEach(el => {
                aux.push(el.fecha)
            })
        }
        
        if ((aux.length < 6)) {
            for (let i = aux.length; i < 6; i++) {
                aux.push('')
            }
        } else if (json.length == 0) {
            for (let i = 0; i < 6; i++) {
                aux.push('')
            }
        }
        horario.push(aux)
        render_lista_semanal(horario)
        aux = []
    })
}

const generar_lista_semanal = () => {
    limpiar_tabla()
    const respuesta = fetchAPI('',url+'/checador/horarioController/obtener_empleados','')
    respuesta.then(json => {
        json.forEach(el => {
            empleados.push([el.nombre+' '+el.apellidoP+' '+el.apellidoM,el.entrada])
            obtener_registro(el.id_empleados)
        })
    })
}

rango_minimo.addEventListener('change', () => {
    if (rango_minimo.value != '' && rango_maximo.value != '') {
        generar_lista_semanal()
    }
})

rango_maximo.addEventListener('change', () => {
    if (rango_minimo.value != '' && rango_maximo.value != '') {
        limpiar_tabla();
        cabecera_lis(cabeceras[5]);
        generar_lista_semanal()
    }
})