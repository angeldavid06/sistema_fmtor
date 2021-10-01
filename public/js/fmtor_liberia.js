const btn_menu_toggle = document.getElementById('btn-menu-toggle')

const menu = document.getElementById('menu')
const contenido = document.getElementById('contenido')

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

contenido.addEventListener('scroll', () => {
    if (contenido.scrollTop > 150) {
        show_btn()
    } else {
        hidde_btn()
    }
});

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.opciones) {
        render_mas_opciones(evt.target.textContent)
    } else if (evt.target.dataset.quitar) {
        quitar_mas_opciones(evt.target)
    } else if (evt.target.dataset.menu) {
        abrir_cerrar_menu()
    }
});