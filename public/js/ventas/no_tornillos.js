const cantidad = document.getElementById('Cantidad_Tornillos');
const contenedor_tornillos = document.getElementById('tornillos');

const render_nuevo_tornillo = (cantidad) => {
    let t = cantidad + 1;
    console.log(cantidad,t);
    const tornillo = document.createElement('div');
    tornillo.classList.add('tornillo');
    tornillo.setAttribute('id','tornillo-'+t);
    document.getElementById("cantidad_tornillos_pedidos").innerText = 'Información del tornillo ('+t+'):';
    tornillo.innerHTML +=   '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1">'+
                                                    '<p style="padding: 15px 0px 30px 0px;" class="txt-left">TORNILLO '+t+':</p>'+
                                                '</div>'+
                                                '<div class="d-flex justify-right align-content-center">'+
                                                    '<label data-pedido="'+t+'" class="btn btn-icon-self material-icons">content_paste_go</label>'+
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
                                                        '<option value="GALVANIZADO">GALVANIZADO</option>'+
                                                        '<option value="PULIDO">PULIDO</option>'+
                                                        '<option value="ZINCADO NEGRO">ZINCADO NEGRO</option>'+
                                                        '<option value="ZINCADO ESPAÑOL">ZINCADO ESPAÑOL</option>'+
                                                        '<option value="TROPICALIZADO">TROPICALIZADO</option>'+
                                                        '<option value="PAVONADO">PAVONADO</option>'+
                                                        '<option value="INOXIDABLE">INOXIDABLE</option>'+
                                                        '<option value="NIQUELADO">NIQUELADO</option>'+
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
                                                '<div class="d-flex align-content-bottom justify-left">'+
                                                    '<input type="checkbox" name="tratamiento_'+t+'" id="tratamiento_'+t+'">'+
                                                    '<label class="lbl-checkbox" for="tratamiento_'+t+'" style="margin: 0px 0px 30px 0px;">T/TERMICO</label>'+
                                                '</div>'+
                                            '</div>'+
                                            '<p style="padding: 15px 0px 30px 0px;" class="txt-right">Orden de Producción:</p>'+
                                            '<div class="d-grid g-1">'+
                                                '<input type="checkbox" name="sin_op_'+t+'" id="sin_op_'+t+'">'+
                                                '<label class="lbl-checkbox" id="lbl_checkbox_salida" for="sin_op_'+t+'" style="margin: 0 0 15px 0;">Sin O.P.:</label>'+
                                            '</div>'+
                                            '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>No. de Dibujo:</p>'+
                                                    '<input class="input" type="text" name="Dibujo_'+t+'" id="Dibujo_'+t+'" placeholder="Ingrese el numero de plano">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Cantidad a Producir (millares):</p>'+
                                                    '<input class="input" type="number" name="cantidad_producir_'+t+'" id="cantidad_producir_'+t+'">'+
                                                '</div>'+
                                            '</div>';
    contenedor_tornillos.appendChild(tornillo)
}

const tornillo_mas = () => {
    const cantidad_tornillos = document.getElementsByClassName('tornillo')
    console.log(cantidad_tornillos);
    render_nuevo_tornillo(cantidad_tornillos.length)
} 

const tornillo_menos = () => {
    const cantidad_tornillos = document.getElementsByClassName('tornillo')
    if (cantidad_tornillos.length <= 1) {
        open_alert('Una salida de almacen requiere por lo menos de un tornillo','naranja')
        console.log('no se puede borrar');
    } else {
        contenedor_tornillos.removeChild(contenedor_tornillos.lastChild)
        document.getElementById("cantidad_tornillos_pedidos").innerText = 'Información del tornillo ('+cantidad_tornillos.length+'):';
    }
}

const vaciar_tornillos = () => {
    contenedor_tornillos.innerHTML = "";
}

const render_form_tornillo = (c) => {
   vaciar_tornillos()
    document.getElementById("cantidad_tornillos_pedidos").innerText = 'Información del tornillo ('+c+'):';
    for (let t = 1; t <= c; t++) {
        contenedor_tornillos.innerHTML += '<div class="tornillo" id="tornillo-'+t+'">'+
                                            '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1">'+
                                                    '<p style="padding: 15px 0px 30px 0px;" class="txt-left">TORNILLO '+t+':</p>'+
                                                '</div>'+
                                                '<div class="d-flex justify-right align-content-center">'+
                                                    '<label data-pedido="'+t+'" class="btn btn-icon-self material-icons">content_paste_go</label>'+
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
                                                        '<option value="GALVANIZADO">GALVANIZADO</option>'+
                                                        '<option value="PULIDO">PULIDO</option>'+
                                                        '<option value="ZINCADO NEGRO">ZINCADO NEGRO</option>'+
                                                        '<option value="ZINCADO ESPAÑOL">ZINCADO ESPAÑOL</option>'+
                                                        '<option value="TROPICALIZADO">TROPICALIZADO</option>'+
                                                        '<option value="PAVONADO">PAVONADO</option>'+
                                                        '<option value="INOXIDABLE">INOXIDABLE</option>'+
                                                        '<option value="NIQUELADO">NIQUELADO</option>'+
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
                                                '<div class="d-flex align-content-bottom justify-left">'+
                                                    '<input type="checkbox" name="tratamiento_'+t+'" id="tratamiento_'+t+'">'+
                                                    '<label class="lbl-checkbox" for="tratamiento_'+t+'" style="margin: 0px 0px 30px 0px;">T/TERMICO</label>'+
                                                '</div>'+
                                            '</div>'+
                                            '<p style="padding: 15px 0px 30px 0px;" class="txt-right">Orden de Producción:</p>'+
                                            '<div class="d-grid g-1">'+
                                                '<input type="checkbox" name="sin_op_'+t+'" id="sin_op_'+t+'">'+
                                                '<label class="lbl-checkbox" id="lbl_checkbox_salida" for="sin_op_'+t+'" style="margin: 0 0 15px 0;">Sin O.P.:</label>'+
                                            '</div>'+
                                            '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>No. de Dibujo:</p>'+
                                                    '<input class="input" type="text" name="Dibujo_'+t+'" id="Dibujo_'+t+'" placeholder="Ingrese el numero de plano">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Cantidad a Producir (millares):</p>'+
                                                    '<input class="input" type="number" name="cantidad_producir_'+t+'" id="cantidad_producir_'+t+'">'+
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