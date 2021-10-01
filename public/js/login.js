if (document.getElementsByClassName('btn-login-form')) {
    const btn_login_open = document.getElementsByClassName('btn-login-form');
    btn_login_open[0].addEventListener('click', () => {
        const row = document.getElementsByClassName('row-con');
        row[0].classList.toggle('hidden');
    });
}

const form = document.getElementById('form-login');
const usu = document.getElementById('nombre_usuario');
const pass = document.getElementById('password');

form.addEventListener('submit', (evt) => {
    evt.preventDefault();
    usu.classList.remove('input-error')
    pass.classList.remove('input-error')
    if (usu.value == '' && pass.value == '') {
        usu.classList.add('input-error')
        pass.classList.add('input-error')
        render_alert('Error al iniciar sesión:','No ha introducido el nombre de usuario o contraseña','rojo');
    } else if (pass.value == '') {
        pass.classList.add('input-error')
        render_alert('Error al iniciar sesión:','No ha introducido la contraseña','rojo');
    } else if (usu.value == '') {
        usu.classList.add('input-error')
        render_alert('Error al iniciar sesión:','No ha introducido el nombre de usuario','rojo');
    } else {
        iniciar_sesion(form)
    }
});

const error_incio_sesion = () => {
    usu.classList.add('input-error')
    pass.classList.add('input-error')
    render_alert('Error al iniciar sesión:','El usuario o contraseña introducidos son incorrectos','rojo');
}

const iniciar_sesion = (form) => {
    preloader()
    const data = new FormData(form)
    let options = {
        method: "POST",
        body: data
    }
    fetch(url+'/scp_fmtor/?controller=usuariosController&action=ingresar',options)
    .then(res => (res.ok ? res.json() : Promise.reject(res)))
    .then(json => {
        ocultarPreloader() 
        if (json.total > 0) {
            window.location.href = url+'/scp_fmtor/?controller=usuariosController&action=menu';
        } else {
            error_incio_sesion();
        }
    })
    .catch((error) => {
        console.log('Error: ',error)
    });
}