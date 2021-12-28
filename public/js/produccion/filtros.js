const checkbox = ['check_op','check_rango_op','check_fecha','check_fecha_mes','check_fecha_anio','check_rango_fecha','check_cliente','check_estado'];
let cabeceras = [['Cal.', 'Kg.', 'Factor', 'N°. O.P.', 'Fecha de O.P.', 'Cliente', 'Descripción', 'Acabado', 'Cant.', 'Precio', 'Total', 'Acumulado (Acabado)', 'Estado'],['Fecha','Turno','Departamento','O.P.', 'Cliente', 'Kg.', 'Pzas. Producidas', 'Máquina', 'Descripción', 'Observaciones']];

const limpiar_cabecera = () => {
    const thead = document.getElementsByClassName('cabecera');
    while (thead[0].firstChild) {
        thead[0].removeChild(thead[0].firstChild);
    }
}

const limpiar_tabla = () => {
    const tbody = document.getElementsByClassName('body');
    while (tbody[0].firstChild) {
        tbody[0].removeChild(tbody[0].firstChild);
    }
}

const cabecera_op = (titulos) => {
    limpiar_cabecera();
    const fragmento = document.createDocumentFragment();
    const thead = document.getElementsByClassName('cabecera');
    const tr = document.createElement('tr');
    
    for (let i = 0; i < titulos.length; i++) {
        const th = document.createElement('th');
        th.innerHTML = titulos[i];
        tr.appendChild(th);
    }
    fragmento.appendChild(tr);
    thead[0].appendChild(fragmento);
}

if (document.getElementsByClassName('btn_filtrar_open')) {
    const btn_filtros_op = document.getElementsByClassName('btn_filtrar_open');
    btn_filtros_op[0].addEventListener('click', () => {
        const filtros = document.getElementsByClassName('filtrar');
    });
}

const form_filtros = document.getElementById('form-filtros');
form_filtros.addEventListener('submit', (evt) => {
    evt.preventDefault();
    enviar_datos()
});

const enviar_datos = () => {
    const op = document.getElementById('check_op')
    const fecha = document.getElementById('check_fecha')
    const cliente = document.getElementById('check_cliente')
    const estado = document.getElementById('check_estado')
    const mes = document.getElementById('check_fecha_mes')
    const anio = document.getElementById('check_fecha_anio')
    const r_op = document.getElementById('check_rango_op')
    const r_fecha = document.getElementById('check_rango_fecha')
    
    if (op.checked) {
        buscar_dato('buscar_op')
    } else if(r_op.checked){
        buscar_dato('buscar_rango_op')
    } else if(r_fecha.checked){
        buscar_dato('buscar_rango_fecha')
    } else if(fecha.checked){
        buscar_dato('buscar_fecha')
    } else if(cliente.checked){
        buscar_dato('buscar_cliente')
    } else if(estado.checked){
        buscar_dato('buscar_estado')
    } else if(mes.checked){
        buscar_dato('buscar_mes')
    } else if(anio.checked){
        buscar_dato('buscar_anio')
    }
}

const buscar_dato = (metodo) => {
    const respuesta = fetchAPI(form_filtros, url+'/produccion/op/'+metodo, 'POST');
    respuesta.then(json => {
        limpiar_tabla()
        render_ordenes(json)
        // const input_tabla = document.getElementById('tabla')
        // if (input_tabla.value == 'v_ordenes') {
        //     render_ordenes(json)
        // } else if (input_tabla.value == 'v_reportediario') {
        //     render_reporte_diario(json)
        // }
    })
}

// const form_formatos = document.getElementById('form-formatos');
// form_formatos.addEventListener('submit', (evt) => {
//     evt.preventDefault();
    // const select = document.getElementById('seleccion_formato')
    // const input_tabla = document.getElementById('tabla')
    // cabecera_op(cabeceras[select.value]);
    // limpiar_tabla();
        // obtener_ordenes()
    // if (select.value == 0) {
    //     obtener_ordenes()
    // } else if (select.value == 1) {
    //     obtener_reporte_diario()
    // }
// });

// const select_formatos = document.getElementById('seleccion_formato')
// select_formatos.addEventListener('change', () => {
//     cabecera_op(cabeceras[select_formatos.value]);
//     const input_tabla = document.getElementById('tabla')
//     input_tabla.removeAttribute('value')
//     limpiar_tabla();
//     if (select_formatos.value == 0) {
//         input_tabla.setAttribute('value','v_ordenes')
//         obtener_ordenes()
//     } else if (select_formatos.value == 1) {
//         input_tabla.setAttribute('value','v_reportediario')
//         obtener_reporte_diario()
//     }
// })

const filtros_personalizados = (check, filtro) => {
    if (check && (filtro == 'f_op' || filtro == 'f_fecha')) {
        const inputs = document.getElementsByClassName('input')
        for (let i = 0; i < inputs.length; i++) {
            inputs[i].setAttribute('disabled','')
        }
        if (filtro == 'f_op') {
            for (let i = 1; i < checkbox.length; i++) {
                document.getElementById('lbl_'+checkbox[i]).setAttribute('disabled','')
                document.getElementById(checkbox[i]).setAttribute('disabled','')
                document.getElementById(checkbox[i]).checked = false;
            }
        } else if (filtro == 'f_fecha') {
            for (let i = 0; i < checkbox.length; i++) {
                if (checkbox[i] != 'check_fecha') {
                    document.getElementById('lbl_'+checkbox[i]).setAttribute('disabled','')
                    document.getElementById(checkbox[i]).setAttribute('disabled','')
                    document.getElementById(checkbox[i]).checked = false;
                }
            }
        }
    } else if (!check && (filtro == 'f_op' || filtro == 'f_fecha')) {
        if (filtro == 'f_op') {
            for (let i = 1; i < checkbox.length; i++) {
                document.getElementById('lbl_'+checkbox[i]).removeAttribute('disabled')
                document.getElementById(checkbox[i]).removeAttribute('disabled')
            }
        } else if (filtro == 'f_fecha') {
            for (let j = 0; j < checkbox.length; j++) {
                if (checkbox[j] != 'check_fecha') {
                    document.getElementById('lbl_'+checkbox[j]).removeAttribute('disabled')
                    document.getElementById(checkbox[j]).removeAttribute('disabled')
                }
            }
        }
    }
}

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.check) {
        if (!evt.target.dataset.rango) {
            filtros_personalizados(evt.target.checked, evt.target.dataset.check)
            const input = document.getElementById(evt.target.dataset.check);
            if (evt.target.checked) {
                input.removeAttribute('disabled')
            } else if (!evt.target.checked) {
                input.setAttribute('disabled','')
            }
        } else {
            const inputm = document.getElementById(evt.target.dataset.check+'_m');
            const inputM = document.getElementById(evt.target.dataset.check+'_M');
            if (evt.target.checked) {
                inputm.removeAttribute('disabled')
                inputM.removeAttribute('disabled')
            } else if (!evt.target.checked) {
                inputm.setAttribute('disabled','')
                inputM.setAttribute('disabled','')
            }
        }
    }
});