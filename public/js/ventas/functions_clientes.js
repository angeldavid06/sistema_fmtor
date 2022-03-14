const obtener = () =>{
    const respuesta = fetchAPI('',url+'/ventas/clientes/obtener','')
    respuesta.then(json => {
        render_clientes(json);
    })  
};

document.addEventListener('DOMContentLoaded', () => {
    obtener();
})