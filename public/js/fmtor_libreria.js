let resJSON = ''
const url = 'http://localhost/sistema_fmtor'
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

    window.setTimeout(() => { 
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

const open_alert = (titulo,color) => {   
    const div = document.createElement('div')
    let icono = 'info'

    div.classList.add('alert')
    div.classList.add('d-flex')
    div.classList.add('justify-between')
    div.classList.add('align-content-bottom')
    div.classList.add('alert-'+color)

    if (color == 'rojo') {
        icono = 'warning';
    } else if (color == 'verde') {
        icono = 'check';
    } else if (color == 'azul') {
        icono = 'info';
    } else {
        icono = 'info';
    }

    div.innerHTML = '<div class="contenido d-flex align-content-center">'+
                        '<i class="material-icons">'+icono+'</i>'+
                        '<p class="txt-left">'+titulo+'</p>'+
                    '</div>'

    time_notification(div)
}

const open_confirm = (title,callback) => {
    const div = document.createElement('div')
    div.classList.add('confirm')
    div.classList.add('d-flex')
    div.classList.add('justify-center')
    div.classList.add('align-content-top')

    div.innerHTML = '<div class="contenido d-flex justify-center align-content-center flex-wrap">'+
                        '<div class="titulo">'+
                            '<h3 class="txt-center">'+title+'</h3>'+
                        '</div>'+
                        '<div class="opciones">'+
                            '<button class="btn btn-icon-self btn-azul material-icons btn-confirm-sm-accept">done</button>'+
                            '<button class="btn btn-icon-self btn-rojo material-icons btn-confirm-sm-cancel">close</button>'+
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

// Script para poder generar reportes

function closePrint () {
    document.body.removeChild(this.__container__);
}

function setPrint () {
    this.contentWindow.__container__ = this;
    this.contentWindow.onbeforeunload = closePrint;
    this.contentWindow.onafterprint = closePrint;
    this.contentWindow.focus(); // Required for IE
    this.contentWindow.print();
}

function printPage (sURL) {
    const oHideFrame = document.createElement("iframe");
    oHideFrame.onload = setPrint;
    oHideFrame.style.position = "fixed";
    oHideFrame.style.right = "0";
    oHideFrame.style.bottom = "0";
    oHideFrame.style.width = "0";
    oHideFrame.style.height = "0";
    oHideFrame.style.border = "0";
    oHideFrame.src = sURL
    document.body.appendChild(oHideFrame);
}

// Ejemplo

// if (document.getElementsByClassName('getPDF')) {
//     const btn = document.getElementsByClassName('getPDF');
//     btn.addEventListener('click', () => {
//         printPage('tests.php?op=')          
//     });
// }