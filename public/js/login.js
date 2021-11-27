const form = document.getElementById('form-login');
const usu = document.getElementById('nombre');
const pass = document.getElementById('password');

const iniciar_sesion = () => {
    const response = fetchAPI(form,'http://localhost/sistema_fmtor/main/iniciar','POST');
    response.then(json => {
        if (json.depto) {
            window.location.href = 'http://localhost/sistema_fmtor/'+json.depto.toLowerCase()+'/main/mostrar'
        } else {
            usu.classList.add('input-error')
            pass.classList.add('input-error')
            open_alert('El usuario o contraseña introducidos son incorrectos','rojo');
        }
    })
}

form.addEventListener('submit', (evt) => {
    evt.preventDefault();
    usu.classList.remove('input-error')
    pass.classList.remove('input-error')
    if (usu.value == '' && pass.value == '') {
        usu.classList.add('input-error')
        pass.classList.add('input-error')
        open_alert('No ha introducido el nombre de usuario o contraseña','rojo');
    } else if (pass.value == '') {
        pass.classList.add('input-error')
        open_alert('No ha introducido la contraseña','rojo');
    } else if (usu.value == '') {
        usu.classList.add('input-error')
        open_alert('No ha introducido el nombre de usuario','rojo');
    } else {
        iniciar_sesion()
    }
})

const error_inicio_sesion = () => {
    usu.classList.add('input-error')
    pass.classList.add('input-error')
    open_alert('El usuario o contraseña introducidos son incorrectos','rojo');
}
