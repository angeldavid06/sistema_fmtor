//librerias

const empleados = []
const horario = []
let aux = []

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

const render_lista_semanal = () => {
    const t_body= document.getElementsByClassName('body')
    // json.forEach(lis => {
    //     const tr = document.createElement('tr')
    //     tr.classList.add('tr')

    //     tr.innerHTML += '<td>'+lis.nombre+'</td>'+
    //                     '<td>'+lis.apellidoP+'</td>'+
    //                     '<td>'+lis.apellidoM+'</td>'+
    //                     '<td>'+lis.entrada+'</td>'+
    //                     '<td>'+lis.fecha+'</td>'+   //Martes
    //                     '<td>'+lis.fecha+'</td>'+   //Miercoles
    //                     '<td>'+lis.fecha+'</td>'+   //Jueves
    //                     '<td>'+lis.fecha+'</td>'+   //Viernes
    //                     '<td>'+lis.fecha+'</td>'+   //Sabado
    //                     '<td>'+lis.fecha+'</td>'+   //Lunes
    //                     '<td>'+lis.nombre+'</td>'+  //Descuento
    //                     '<td>'+lis.apellidoP+'</>'; //Nota
                        
    //     t_body[0].appendChild(tr)
    // });

    for (let i = 0; i < empleados.length; i++) {
        const tr = document.createElement('tr')
        tr.classList.add('tr')
        tr.innerHTML += '<td>'+empleados[i]+'</td>'+
                        '<td></td>'+
                        '<td></td>'+   //Martes
                        '<td></td>'+   //Miercoles
                        '<td></td>'+   //Jueves
                        '<td></td>'+   //Viernes
                        '<td></td>'+   //Sabado
                        '<td></td>'+   //Lunes
                        '<td></td>'+  //Descuento
                        '<td></td>'; //Nota
        t_body[0].appendChild(tr)
    }
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

const obtener_lista_semanal = () => {
    const respuesta = fetchAPI('',url+'/checador/horarioController/obtener_lista_semanal','')
    respuesta.then(json => {
        render_lista_semanal(json)
    })
};

const agrupar_registros = (json) => {

}

const rango_minimo = document.getElementById('rango_minimo')
const rango_maximo = document.getElementById('rango_maximo')

const obtener_registro = (id) => {
    const respuesta = fetchAPI('',url+'/checador/horarioController/obtener_registro?id_empleado='+id+'&fecha_in='+rango_minimo.value+'&fecha_fin='+rango_maximo.value,'')
    respuesta.then(json => {
        console.log(json.length);
        if (json.length > 0) {
            json.forEach(el => {
                aux.push(el.fecha)
            })
            horario.push(aux);
            aux = []
        } else {
            for (let i = 0; i < 6; i++) {
                aux.push(' ')
            }
            horario.push(aux)
            aux = []
        }
    })
    console.table(horario);
}

const generar_lista_semanal = () => {
    limpiar_tabla()
    const respuesta = fetchAPI('',url+'/checador/horarioController/obtener_empleados','')
    respuesta.then(json => {
        json.forEach(el => {
            empleados.push(el.nombre+' '+el.apellidoP+' '+el.apellidoM)
            obtener_registro(el.id_empleados)
        })
        render_lista_semanal()
    })
}

rango_minimo.addEventListener('change', () => {
    if (rango_minimo.value != '' && rango_maximo.value != '') {
        generar_lista_semanal()
    }
})

rango_maximo.addEventListener('change', () => {
    if (rango_minimo.value != '' && rango_maximo.value != '') {
        generar_lista_semanal()
    }
})

document.addEventListener('DOMContentLoaded', () => {
    obtener_lista_semanal()
});

