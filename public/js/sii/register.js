const form = document.getElementById('form_reg_user');

const registrar_usuario = () => {
    const respuesta = fetchAPI(form,'http://localhost/sistema_fmtor/sii/main/newUser','POST')
    respuesta.then(json => {
        console.log(json);
    })
}

form.addEventListener('submit', (evt)=>{
    evt.preventDefault();
    registrar_usuario();
})