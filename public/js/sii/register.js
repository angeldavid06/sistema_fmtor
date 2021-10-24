const form = document.getElementById('form_reg_user');
const form2 = document.getElementById('only_user_register');
const registrar_usuario = () => {
    const respuesta = fetchAPI(form,'http://localhost/sistema_fmtor/sii/main/newUser','POST')
    respuesta.then(json => {
        console.log(json);
    })
}

const registrar_solo_usuario = () => {
    const respuesta = fetchAPI(form2,'http://localhost/sistema_fmtor/sii/main/new_only_user','POST')
    respuesta.then(json => {
        console.log(json);
    })
}

form2.addEventListener('submit', (evt) => {
    evt.preventDefault();
    registrar_solo_usuario();
})

form.addEventListener('submit', (evt)=>{
    evt.preventDefault();
    registrar_usuario();
})

const tablaPuesto = () => {
    const tabla = fetchAPI('','http://localhost/sistema_fmtor/sii/main/buscarPuesto','')
    tabla.then(json => {
        mostrarPuesto(json);
    })
}

const tablaRol = () =>{
    const tabla = fetchAPI('','http://localhost/sistema_fmtor/sii/main/buscarRol','');
    tabla.then(json => {
        mostrarRol(json);
    })
}

const tablaEmpleados = () =>{
    const tabla = fetchAPI('','http://localhost/sistema_fmtor/sii/datos/mostrarDatos','');
    tabla.then(json => {
        mostrarEmpleados(json);
    })
}

const mostarEmpleados = (json) =>{
    const nombre = document.getElementById('nombre');
}


const mostrarPuesto = (json) => {
    const lista = document.getElementById('nombrePuesto');
    json.forEach(element => {
        const opcion = document.createElement('option');
        opcion.setAttribute('value',element.id_puesto);
        opcion.innerHTML = element.nombrePuesto;
        lista.appendChild(opcion);
    });
}

const mostrarRol = (json) => {
    const lista = document.getElementById('nombreRol');
    const lista2 = document.getElementById('nombreRol2');
    json.forEach(element => {
        const opcion = document.createElement('option');
        opcion.setAttribute('value',element.id_rol);
        opcion.innerHTML = element.nombreRol;
        const opcion2 = document.createElement('option');
         opcion2.setAttribute('value',element.id_rol);
        opcion2.innerHTML = element.nombreRol;
        lista.appendChild(opcion);
        lista2.appendChild(opcion2);
    })
}

(() => {
    tablaPuesto();
    tablaRol();
})()

