const form_control = document.getElementById('form-control');

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
    const inputs = document.getElementsByClassName('input');
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
            render_alert('Error al registrar:', 'Debes llenar los campos correctamente','rojo')
        }
    } catch (error) {
        render_alert('Error al registrar:', 'Debes seleccionar alguna etapa antes de enviar el formulario','rojo')
    }
});

const btn_form_control = document.getElementById('btn-form-control');

btn_form_control.addEventListener('click', () => {
    const estado = document.getElementsByClassName('active')
    const op_control = document.getElementById('op_control')
    const op = document.getElementById('op')
    const input = document.getElementById('estado')
    
    input.value = estado[0].dataset.id
    op.value = op_control.dataset.control
});

const btn_form_control_cancel = document.getElementById('btn-form-control-cancel');

btn_form_control_cancel.addEventListener('click', () => {
    const form = document.getElementsByClassName('ingresar');
    form[0].classList.toggle('open');
});

const registrar_control = () => {
    const respuesta = fetchAPI(form_control,url+'/produccion/control/insertar','POST')
    respuesta.then(json => {
        if (json == '1') {
            render_alert('Registro exitoso:','El usuario se añadio correctamente', 'azul')
            const estado = document.getElementsByClassName('active')
            obtener_control(estado[0].dataset.estado)
        } else {
            render_alert('Registro no exitoso:','Algo ocurrio', 'rojo')
        }
    })
}

const general = document.getElementsByClassName('info_general')

general[0].addEventListener('click', () => {
    general[0].classList.toggle('hidden')
})