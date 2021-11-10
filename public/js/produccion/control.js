const form_control = document.getElementById('form-control');
const data_aux = {
    dato: ""
}

const quitar_clase = () => {
    const inputs = document.getElementsByClassName('input');
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].classList.remove('input-error');
    }
}

form_control.addEventListener('submit', (evt)=> {
    evt.preventDefault();
    let aux = true;
    quitar_clase();
    const inputs = form_control.getElementsByClassName('input')
    try {
        for (let i = 0; i < inputs.length; i++) {
            if (inputs[i].value == '') {
                inputs[i].classList.add('input-error');
                aux = false;
            } 
        }
        if (aux) {
            registrar_control()
        } else {
            open_alert('Debes llenar los campos correctamente','rojo')
        }
    } catch (error) {
        open_alert('Debes seleccionar alguna etapa antes de enviar el formulario','rojo')
    }
});

const btn_form_control = document.getElementById('btn-form-control');

btn_form_control.addEventListener('click', () => {
    const estado = document.getElementsByClassName('active')
    const op_control = document.getElementById('op_control')
    
    const op = document.getElementById('op')
    const input = document.getElementById('estado')
    
    op.value = op_control.value
    input.value = estado[0].dataset.id
});

const registrar_control = () => {
    const respuesta = fetchAPI(form_control,url+'/produccion/control/insertar','POST')
    respuesta.then(json => {
        if (json == '1') {
            open_alert('Registro añadido correctamente', 'verde')
            const estado = document.getElementsByClassName('active')
            obtener_control(estado[0].dataset.estado)
        } else {
            open_alert('Registro no exitoso','rojo')
        }
    })
}

function funcion() {
    const respuesta = fetchAPI('',url+'/produccion/control/eliminar?dato='+data_aux.dato,'')
    respuesta.then(json => {
        if (json == 1) {
            const estado = document.getElementsByClassName('active')
            obtener_control(estado[0].dataset.estado)
            open_alert('Registro eliminado correctamente','verde')
        } else {
            open_alert('Ocurrio un error al intentar realizar la consulta','rojo')
        }
    })
}

const eliminar_registro = () => {
    open_confirm('¿Estas seguro de realizar esta opción?', funcion)
}

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.opcion) {
        data_aux.dato = evt.target.dataset.eliminar
        eliminar_registro()
    }
})