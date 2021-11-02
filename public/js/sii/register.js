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

form.addEventListener('submit', (evt)=>{
    evt.preventDefault();
    registrar_usuario();
})

const tablaPuesto = () => {
    const tabla = fetchAPI('','http://localhost/sistema_fmtor/sii/main/buscarPuesto','')
    tabla.then(json => {
        console.log(json);
    })
}

(() => {
    tablaPuesto();
})()