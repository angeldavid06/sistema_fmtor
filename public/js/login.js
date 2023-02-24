const contenedor = document.getElementsByClassName('form-login');
const form = document.getElementById('form-login');
const usu = document.getElementById('nombre');
const pass = document.getElementById('password');
const btn_iniciar = document.getElementById('iniciar');
const auxiliar = {
    intentos: 0
}

btn_iniciar.addEventListener('click', () => {
    contenedor[0].classList.add('mostrar')
})

const iniciar_sesion = () => {
    if (auxiliar.intentos < 3) {
        const respuesta = fetchAPI(form,url+'/main/iniciar','POST');
        respuesta.then(json => {
            if (json.depto) {
                window.location.href = url+'/usuario/principal';
            } else {
                auxiliar.intentos++;
                usu.classList.add('input-error')
                pass.classList.add('input-error')
                open_alert('El usuario o contraseña introducidos son incorrectos','rojo');
            }
        })
    } else {
        open_alert('Excediste el número de intentos para poder iniciar sesión','rojo');
    }
}

form.addEventListener('submit', (evt) => {
    evt.preventDefault();
    usu.classList.remove('input-error')
    pass.classList.remove('input-error')
    if (usu.value == '' && pass.value == '') {
        usu.classList.add('input-error')
        pass.classList.add('input-error')
        open_alert('No ha introducido el nombre de usuario y contraseña','amarillo');
    } else if (pass.value == '') {
        pass.classList.add('input-error')
        open_alert('No ha introducido la contraseña','roamarillojo');
    } else if (usu.value == '') {
        usu.classList.add('input-error')
        open_alert('No ha introducido el nombre de usuario','amarillo');
    } else {
        iniciar_sesion()
    }
})

const error_inicio_sesion = () => {
    usu.classList.add('input-error')
    pass.classList.add('input-error')
    open_alert('El usuario o contraseña introducidos son incorrectos','rojo');
}
