const cantidad = document.getElementById('Cantidad_Tornillos');
const contenedor_tornillos = document.getElementById('tornillos');

const render_nuevo_tornillo = (cantidad) => {
    let t = cantidad + 1;
    cantidad.value = cantidad
    const tornillo = document.createElement('div');
    tornillo.classList.add('tornillo');
    tornillo.setAttribute('id','tornillo-'+t);
    document.getElementById("cantidad_tornillos_pedidos").innerText = 'Información del tornillo ('+t+'):';
    tornillo.innerHTML +=   '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1">'+
                                                    '<p style="padding: 15px 0px 30px 0px;" class="txt-left">TORNILLO '+t+':</p>'+
                                                '</div>'+
                                                '<div class="d-flex justify-right align-content-center">'+
                                                    '<label title="Pegar información del tornillo '+t+'" data-p="'+t+'" class="btn btn-icon-self material-icons">content_paste_go</label>'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-1">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Fecha de entrega :</p>'+
                                                    '<input class="input" type="date" name="Fecha_entrega_'+t+'" id="Fecha_entrega_'+t+'">'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>No. Parte cliente:</p>'+
                                                    '<input class="input" type="text" name="Codigo_'+t+'" id="Codigo_'+t+'" placeholder="Ingrese el codigo">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Pedido Cliente:</p>'+
                                                    '<input class="input" type="text" name="Pedido_pza_'+t+'" id="Pedido_pza_'+t+'">'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-3">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Cantidad (millares):</p>'+
                                                    '<input class="input" type="text" name="Cantidad_millares_'+t+'" id="Cantidad_millares_'+t+'">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Descripcion:</p>'+
                                                    '<input type="text" class="input" name="Descripcion_'+t+'" id="Descripcion_'+t+'">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Medida:</p>'+
                                                    '<input class="input" type="text" name="Medida_'+t+'" id="Medida_'+t+'">'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-3">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Factor:</p>'+
                                                    '<input class="input" type="text" name="factor_'+t+'" id="factor_'+t+'">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Acabado:</p>'+
                                                    '<select class="input" name="Acabado_'+t+'" id="Acabado_'+t+'">'+
                                                        '<option value="">Selecciona un acabado</option>'+
                                                        '<option value="TROPICALIZADO">TROPICALIZADO</option>'+
                                                        '<option value="GALVANIZADO">GALVANIZADO Blanco</option>'+
                                                        '<option value="GALVANIZADO">GALVANIZADO Azul/GALVANIZADO Electrolitico Azul</option>'+
                                                        '<option value="ZINCADO NEGRO">ZINCADO NEGRO</option>'+
                                                        '<option value="NÍQUEL">NÍQUEL</option>'+
                                                        '<option value="PULIDO">PULIDO</option>'+
                                                        '<option value="PAVONADO">PAVONADO</option>'+
                                                        '<option value="LATÓNADO">LATÓNADO</option>'+
                                                        '<option value="COBRE">COBRE</option>'+
                                                        '<option value="VERDE VIEJO">VERDE VIEJO</option>'+
                                                        '<option value="VERDE OLIVO">VERDE OLIVO</option>'+
                                                    '</select>'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Material:</p>'+
                                                    '<input class="input" type="text" name="Material_'+t+'" id="Material_'+t+'">'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-3">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Costo:</p>'+
                                                    '<input class="input" type="text" name="Precio_millar_'+t+'" id="Precio_millar_'+t+'">'+
                                                '</div>'+
                                            '</div>';
    contenedor_tornillos.appendChild(tornillo)
}

const cantidad_tornillos = document.getElementsByClassName('tornillo')
const tornillo_mas = () => {
    render_nuevo_tornillo(cantidad_tornillos.length-1)
    cantidad.value = cantidad_tornillos.length-1
} 

const tornillo_menos = () => {
    let tornillos = cantidad_tornillos.length
    if ((tornillos - 1) >= 1) {
        contenedor_tornillos.removeChild(contenedor_tornillos.lastChild)
        tornillos = cantidad_tornillos.length;
        document.getElementById("cantidad_tornillos_pedidos").innerHTML = 'Información del tornillo ('+(tornillos)+'):';
        cantidad.value = (tornillos)
    } else {
        open_alert('Una salida de almacen requiere por lo menos de un tornillo','naranja')
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
        contenedor_tornillos.innerHTML += '<div class="tornillo" id="tornillo-'+t+'">'+
                                            '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1">'+
                                                    '<p style="padding: 15px 0px 30px 0px;" class="txt-left">TORNILLO '+t+':</p>'+
                                                '</div>'+
                                                '<div class="d-flex justify-right align-content-center">'+
                                                    '<label title="Pegar información del tornillo '+t+'" data-p="'+t+'" class="btn btn-icon-self material-icons">content_paste_go</label>'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-1">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Fecha de entrega :</p>'+
                                                    '<input class="input" type="date" name="Fecha_entrega_'+t+'" id="Fecha_entrega_'+t+'">'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>No. Parte cliente:</p>'+
                                                    '<input class="input" type="text" name="Codigo_'+t+'" id="Codigo_'+t+'" placeholder="Ingrese el codigo">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Pedido Cliente:</p>'+
                                                    '<input class="input" type="text" name="Pedido_pza_'+t+'" id="Pedido_pza_'+t+'">'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-3">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Cantidad (millares):</p>'+
                                                    '<input class="input" type="text" name="Cantidad_millares_'+t+'" id="Cantidad_millares_'+t+'">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Descripcion:</p>'+
                                                    '<input type="text" class="input" name="Descripcion_'+t+'" id="Descripcion_'+t+'">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Medida:</p>'+
                                                    '<input class="input" type="text" name="Medida_'+t+'" id="Medida_'+t+'">'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-3">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Factor:</p>'+
                                                    '<input class="input" type="text" name="factor_'+t+'" id="factor_'+t+'">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Acabado:</p>'+
                                                    '<select class="input" name="Acabado_'+t+'" id="Acabado_'+t+'">'+
                                                        '<option value="">Selecciona un acabado</option>'+
                                                        '<option value="TROPICALIZADO">TROPICALIZADO</option>'+
                                                        '<option value="GALVANIZADO">GALVANIZADO Blanco</option>'+
                                                        '<option value="GALVANIZADO">GALVANIZADO Azul/GALVANIZADO Electrolitico Azul</option>'+
                                                        '<option value="ZINCADO NEGRO">ZINCADO NEGRO</option>'+
                                                        '<option value="NÍQUEL">NÍQUEL</option>'+
                                                        '<option value="PULIDO">PULIDO</option>'+
                                                        '<option value="PAVONADO">PAVONADO</option>'+
                                                        '<option value="LATÓNADO">LATÓNADO</option>'+
                                                        '<option value="COBRE">COBRE</option>'+
                                                        '<option value="VERDE VIEJO">VERDE VIEJO</option>'+
                                                        '<option value="VERDE OLIVO">VERDE OLIVO</option>'+
                                                    '</select>'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Material:</p>'+
                                                    '<input class="input" type="text" name="Material_'+t+'" id="Material_'+t+'">'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-3">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Costo:</p>'+
                                                    '<input class="input" type="text" name="Precio_millar_'+t+'" id="Precio_millar_'+t+'">'+
                                                '</div>'+
                                            '</div>'+
                                        '</div>';
    }
}

const generar_fecha = () => {
    const fecha_actual = new Date().toLocaleDateString();
    const fecha = fecha_actual.split("/");
    let aux = fecha[2] + "-";

    if (parseInt(fecha[1]) < 10) {
        aux += "0" + fecha[1] + "-";
    } else {
        aux += fecha[1] + "-";
    }

    if (parseInt(fecha[0]) < 10) {
        aux += "0" + fecha[0];
    } else {
        aux += fecha[0];
    }

    document.getElementById("Fecha").value = aux;
};

cantidad.addEventListener('keyup', () => {
    if (cantidad.value <= 0) {
        open_alert('Es necesario incluir por lo menos un tornillo','naranja')
        cantidad.value = 1
        render_form_tornillo(cantidad.value);
    } else {
        render_form_tornillo(cantidad.value)
    }
})

document.addEventListener('DOMContentLoaded', () => {
    generar_fecha();
})