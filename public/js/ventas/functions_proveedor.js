const obtener_proveedores = () => {
    const respuesta = fetchAPI('',url+'/ventas/proveedores/obtener_proveedores','')
    respuesta.then(json => {
        render_proveedores(json)
    })
}

document.addEventListener('DOMContentLoaded', () => {
    obtener_proveedores()
})