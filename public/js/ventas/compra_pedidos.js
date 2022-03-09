const cantidad = document.getElementById('Cantidad_Tornillos');
const contenedor_tornillos = document.getElementById("pedido_compra");

const render_nuevo_tornillo = (cantidad) => {
    let t = cantidad + 1;
    cantidad.value = cantidad
    const tornillo = document.createElement('div');
    tornillo.classList.add('pedido');
    tornillo.setAttribute("id", "pedido_" + t);
    document.getElementById("cantidad_tornillos_pedidos").innerText = 'Información del tornillo ('+t+'):';
    tornillo.innerHTML +=   '<div class="d-grid g-2">'+
                                '<div class="d-grid g-1">'+
                                    '<p style="padding: 15px 0px 30px 0px;" class="txt-left">TORNILLO '+t+':</p>'+
                                '</div>'+
                                '<div class="d-flex justify-right align-content-center">'+
                                    '<label title="Pegar información del tornillo '+t+'" data-p="'+t+'" class="btn btn-icon-self material-icons">content_paste_go</label>'+
                                '</div>'+
                            '</div>'+
                            '<div class="d-grid g-2">'+
                                '<div class="d-grid g-1 grid-gap-0">'+
                                    '<p>Código:</p>'+
                                    '<input type="number" name="codigo_'+t+'" id="codigo_'+t+'">'+
                                '</div>'+
                                '<div class="d-grid g-1 grid-gap-0">'+
                                    '<p>Producto:</p>'+
                                    '<input type="text" name="producto_'+t+'" id="producto_'+t+'">'+
                                '</div>'+
                            '</div>'+
                            '<div class="d-grid g-2">'+
                                '<div class="d-grid g-1 grid-gap-0">'+
                                    '<p>Cantidad:</p>'+
                                    '<input type="text" name="cantidad_'+t+'" id="cantidad_'+t+'">'+
                                '</div>'+
                                '<div class="d-grid g-1 grid-gap-0">'+
                                    '<p>Precio Unitario:</p>'+
                                    '<input type="text" name="precio_'+t+'" id="precio_'+t+'">'+
                                '</div>'+
                            '</div>';
    contenedor_tornillos.appendChild(tornillo)
}

const cantidad_tornillos = document.getElementsByClassName("pedido");
const tornillo_mas = () => {
    render_nuevo_tornillo(cantidad_tornillos.length)
    cantidad.value = cantidad_tornillos.length
} 

const tornillo_menos = () => {
    let tornillos = cantidad_tornillos.length
    if ((tornillos - 1) >= 1) {
        contenedor_tornillos.removeChild(contenedor_tornillos.lastChild)
        document.getElementById("cantidad_tornillos_pedidos").innerHTML = 'Información del tornillo ('+(tornillos-1)+'):';
        cantidad.value = (tornillos-1)
    } else {
        open_alert('Una orden de compra requiere por lo menos de un tornillo','naranja')
    }
}

const vaciar_tornillos = () => {
    contenedor_tornillos.innerHTML = "";
}

const render_form_tornillo = (c) => {
   vaciar_tornillos()
    cantidad.value = c
    document.getElementById("cantidad_tornillos_pedidos").innerText = 'Información del tornillo ('+c+'):';
    for (let t = 1; t <= c; t++) {
        contenedor_tornillos.innerHTML += '<div id="pedido_'+t+'"  class="pedido">'+
                                            '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1">'+
                                                    '<p style="padding: 15px 0px 30px 0px;" class="txt-left">TORNILLO '+t+':</p>'+
                                                '</div>'+
                                                '<div class="d-flex justify-right align-content-center">'+
                                                    '<label title="Pegar información del tornillo '+t+'" data-p="'+t+'" class="btn btn-icon-self material-icons">content_paste_go</label>'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Código:</p>'+
                                                    '<input type="number" name="codigo_'+t+'" id="codigo_'+t+'">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Producto:</p>'+
                                                    '<input type="text" name="producto_'+t+'" id="producto_'+t+'">'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Cantidad:</p>'+
                                                    '<input type="text" name="cantidad_'+t+'" id="cantidad_'+t+'">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Precio Unitario:</p>'+
                                                    '<input type="text" name="precio_'+t+'" id="precio_'+t+'">'+
                                                '</div>'+
                                            '</div>'+
                                        '</div>';
    }
}

cantidad.addEventListener('keyup', () => {
    if (cantidad.value <= 0) {
        open_alert('Es necesario incluir por lo menos un tornillo','naranja')
        cantidad.value = 1
        render_form_tornillo(cantidad.value);
    } else {
        render_form_tornillo(cantidad.value)
    }
})