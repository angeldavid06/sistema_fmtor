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
    
    input.value = estado[0].dataset.id
    op.value = op_control.dataset.control
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

const general = document.getElementsByClassName('info_general')

general[0].addEventListener('click', () => {
    general[0].classList.toggle('hidden')
})