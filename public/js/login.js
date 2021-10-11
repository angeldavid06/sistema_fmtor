const form = document.getElementById('form_login');
const usu = document.getElementById('nombre');
const pass = document.getElementById('password');

if (document.getElementsByClassName('btn-login-form')) {
    const btn_login_open = document.getElementsByClassName('btn-login-form');
    btn_login_open[0].addEventListener('click', () => {
        const row = document.getElementsByClassName('row-con');
        row[0].classList.toggle('hidden');
    });
}

const iniciar_sesion = () => {
    const response = fetchAPI(form,'http://localhost/sistema_fmtor/main/iniciar','POST');
    response.then(json => {
        if (json.depto) {
            window.location.href = 'http://localhost/sistema_fmtor/'+json.depto.toLowerCase()+'/main/mostrar'
        } else {
            usu.classList.add('input-error')
            pass.classList.add('input-error')
            open_alert('Error al iniciar sesión:','El usuario o contraseña introducidos son incorrectos','rojo');
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
        open_alert('Error al iniciar sesión:','No ha introducido el nombre de usuario o contraseña','rojo');
    } else if (pass.value == '') {
        pass.classList.add('input-error')
        open_alert('Error al iniciar sesión:','No ha introducido la contraseña','rojo');
    } else if (usu.value == '') {
        usu.classList.add('input-error')
        open_alert('Error al iniciar sesión:','No ha introducido el nombre de usuario','rojo');
    } else {
        iniciar_sesion()
    }
})

const error_inicio_sesion = () => {
    usu.classList.add('input-error')
    pass.classList.add('input-error')
    open_alert('Error al iniciar sesión:','El usuario o contraseña introducidos son incorrectos','rojo');
}
