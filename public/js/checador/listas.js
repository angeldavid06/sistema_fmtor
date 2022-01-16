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
    tr.classList.add('tr')
    tr.innerHTML += '<td>'+empleados[i][0]+'</td>'+
                    '<td>'+empleados[i][1]+'</td>'+
                    '<td>'+horario[0][0].split(' ')[1]+'</td>'+   //Martes
                    '<td>'+horario[0][1].split(' ')[1]+'</td>'+   //Miercoles
                    '<td>'+horario[0][2].split(' ')[1]+'</td>'+   //Jueves
                    '<td>'+horario[0][3].split(' ')[1]+'</td>'+   //Viernes
                    '<td>'+horario[0][4].split(' ')[1]+'</td>'+   //Sabado
                    '<td>'+horario[0][5].split(' ')[1]+'</td>'+   //Lunes
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
                aux.push(' ')
            }
        } else if (json.length == 0) {
            for (let i = 0; i < 6; i++) {
                aux.push(' ')
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