let resJSON = ''
const btn_menu_toggle = document.getElementById('btn-menu-toggle')
const menu = document.getElementById('menu')

const show_btn = () => {
    if (document.getElementById("btn-subir")) {
        const btn_subir = document.getElementById('btn-subir')
        btn_subir.classList.add('mostrar');
    }
}

const hidde_btn = () => {
    if (document.getElementById("btn-subir")) {
        const btn_subir = document.getElementById('btn-subir')
        btn_subir.classList.remove('mostrar');
    }
}

const quitar_mas_opciones = () => {
    const mas_opciones = document.getElementsByClassName('mas_opciones')
    if (mas_opciones.length > 0) {
        setTimeout(() => { 
            mas_opciones[0].classList.remove('mostrar')
        }, 100);
        setTimeout(() => { 
            document.body.removeChild(mas_opciones[0])
        }, 400);
    }
}

const render_mas_opciones = (texto) => {
    quitar_mas_opciones()
    const mas_opciones = document.createElement('div')
    const titulo = document.createElement('titulo')
    const opciones = document.createElement('opciones')

    mas_opciones.classList.add('mas_opciones')
    
    if(document.getElementsByClassName('hidde_menu').length > 0) {
        mas_opciones.classList.add('w-100')
    } else {
        mas_opciones.classList.add('w-80')
    }

    titulo.innerHTML = '<div class="titulo">'+
                                '<i class="material-icons" data-quitar="opciones">close</i>'+
                                '<h3>'+texto+'</h3>'+
                            '</div>'
                            
    opciones.innerHTML = '<div class="opciones">'+
                                '<button class="btn btn-icon-self btn-transparent material-icons" data-id="1">'+
                                    'delete'+
                                '</button>'+
                                '<button class="btn btn-icon-self btn-transparent material-icons" data-id="1">'+
                                    'edit'+
                                '</button>'+
                            '</div>'
                                    
    mas_opciones.appendChild(titulo)                        
    mas_opciones.appendChild(opciones)                        
    document.body.appendChild(mas_opciones)

    setTimeout(() => { 
        mas_opciones.classList.add('mostrar')
    }, 300);
}

const abrir_cerrar_menu = () => {
    contenido.classList.toggle('hidde_menu')
    menu.classList.toggle('hidde_menu')
}

// Peticiones

const fetchAPI = async (form,ruta,metodo) => {
    preloader()
    if (metodo != '') {
        const data = new FormData(form)
        const opciones = {
            method: metodo,
            body: data
        }

        await fetch(ruta,opciones)
        .then(res => (res.ok ? res.json() : Promise.reject(res)))
        .then(json => {
            resJSON = json;
        })
        .catch(err => {
            resJSON = err;
        })
        .finally(() => {
            ocultarPreloader() 
        })
    } else if (metodo == '') {
        await fetch(ruta)
        .then(res => (res.ok ? res.json() : Promise.reject(res)))
        .then(json => {
            resJSON = json;
        })
        .catch(err => {
            resJSON = err;
        })
        .finally(() => {
            ocultarPreloader() 
        })
    }

    return resJSON
}

// Alertas

const time_notification = (not) => {
    document.body.appendChild(not);
    window.setTimeout(() => {
        not.classList.add('show-alert');
    },300);
    window.setTimeout(() => {
        not.classList.remove('show-alert');
    },3500);
    window.setTimeout(() => {
        document.body.removeChild(not);
    },3800);
}

const open_alert = (title,description) => {   
    const div = document.createElement('div')
    div.classList.add('alert')
    div.classList.add('d-flex')
    div.classList.add('justify-center')
    div.classList.add('flex-wrap')

    div.innerHTML = '<div class="contenido">'+
                        '<h3 class="txt-center">'+title+'</h3>'+
                        '<div class="descripcion">'+
                            '<p class="txt-center">'+description+'</p>'+
                        '</div>'+
                    '</div>'

    time_notification(div)
}

const open_confirm = (title,callback) => {
    const div = document.createElement('div')
    div.classList.add('confirm')
    div.classList.add('d-flex')
    div.classList.add('justify-center')

    div.innerHTML = '<div class="contenido d-flex justify-between align-content-center flex-nowrap btn-confirm-sm-cancel">'+
                        '<div class="titulo">'+
                            '<h3>'+title+'</h3>'+
                        '</div>'+
                        '<div class="opciones">'+
                            '<button class="btn btn-icon-self btn-transparent material-icons btn-confirm-sm-accept">done</button>'+
                            '<button class="btn btn-icon-self btn-transparent material-icons btn-confirm-sm-cancel">close</button>'+
                        '</div>'+
                    '</div>'

    document.body.appendChild(div)
    
    window.setTimeout(() => {
        div.classList.add('show-alert');
    },300);

    sharedFunction = callback;
}

if (document.getElementById('contenido')) {
    const contenido = document.getElementById('contenido')
    contenido.addEventListener('scroll', () => {
        if (contenido.scrollTop > 150) {
            show_btn()
        } else {
            hidde_btn()
        }
    });
}

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.opciones) {
        render_mas_opciones(evt.target.textContent)
    } else if (evt.target.dataset.quitar) {
        quitar_mas_opciones(evt.target)
    } else if (evt.target.dataset.menu) {
        abrir_cerrar_menu()
    } else if (evt.target.matches('.btn-confirm-sm-accept')) {
        sharedFunction();
        const not = document.getElementsByClassName('confirm')
        window.setTimeout(() => {
            not[0].classList.remove('show-alert')
        },100)
    } else if (evt.target.matches('.btn-confirm-sm-cancel')) {
        const not = document.getElementsByClassName('confirm')
        window.setTimeout(() => {
            not[0].classList.remove('show-alert')
        },100)
        window.setTimeout(() => {
            document.body.removeChild(not[0])
        },500)
    } else if (evt.target.dataset.modal) {
        abrir_modal(evt.target.dataset.modal)
    }
});

let contador = 0;

const render_titulo = (titulo) => {
    const h3 = document.createElement('h3');
    h3.classList.add('titulo');
    h3.innerHTML = titulo;
    return h3;
}

const render_descripcion = (descripcion) => {
    const p = document.createElement('p');
    p.classList.add('descripcion');
    p.innerHTML = descripcion;
    return p;
}

const render_contenedor = () => {
    const div = document.createElement('div');
    div.classList.add('contenido');
    return div;
}

const render_alert_con = (color) => {
    const div = document.createElement('div');
    div.classList.add('alert');
    div.classList.add('alert-'+color);
    return div;
}

const render_alert = (titulo, descripcion, color) => {
    if (contador == 0) {
        contador = 1;
        const t = render_titulo(titulo);
        const d = render_descripcion(descripcion);
        const c = render_contenedor();
        const a = render_alert_con(color);
        c.appendChild(t)
        c.appendChild(d)
        a.appendChild(c)
        document.body.appendChild(a)
        
        window.setTimeout(() => {
            a.classList.add('show-alert')
        },300);
    
        window.setTimeout(() => {
            a.classList.remove('show-alert')
        },4000);
        
        window.setTimeout(() => {  
            contador = 0;
            document.body.removeChild(a)
        },4300);
    }
}

// Preloader

const preloader = () => {
    const div_content = document.createElement('div')
    const div_preloader = document.createElement('div')
    const div_progress = document.createElement('div')

    div_content.classList.add('content_preloader')
    div_preloader.classList.add('preloader')
    div_progress.classList.add('progress')

    div_preloader.appendChild(div_progress)
    div_content.appendChild(div_preloader)
    document.body.appendChild(div_content)
}

const ocultarPreloader = () => {
    const preloader = document.getElementsByClassName('content_preloader')
    document.body.removeChild(preloader[0])
}

// Ventanas modales

const abrir_modal = (id) => {
    const modal = document.getElementById(id)
    modal.classList.toggle('abrir_modal')
}