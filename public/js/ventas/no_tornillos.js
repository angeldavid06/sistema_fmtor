const cantidad = document.getElementById('Cantidad_Tornillos');
const contenedor_tornillos = document.getElementById('tornillos');

const vaciar_tornillos = () => {
    contenedor_tornillos.innerHTML = "";
}

const render_form_tornillo = (c) => {
   vaciar_tornillos()
    for (let i = 1; i <= c; i++) {
        contenedor_tornillos.innerHTML +=   '<p style="padding: 15px 0px 30px 0px;" class="txt-left">TORNILLO '+i+':</p>'+
                                            '<div class="d-grid g-3">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Cantidad (millares):</p>'+
                                                    '<input class="input" type="text" name="Cantidad_millares_'+i+'" id="Cantidad_millares_'+i+'">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Descripcion:</p>'+
                                                    '<input type="text" class="input" name="Descripcion_'+i+'" id="Descripcion_'+i+'">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Medida:</p>'+
                                                    '<input class="input" type="text" name="Medida_'+i+'" id="Medida_'+i+'">'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-3">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Factor:</p>'+
                                                    '<input class="input" type="text" name="factor_'+i+'" id="factor_'+i+'">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Acabado:</p>'+
                                                    '<select class="input" name="Acabado_'+i+'" id="Acabado_'+i+'">'+
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
                                                    '<input class="input" type="text" name="Material_'+i+'" id="Material_'+i+'">'+
                                                '</div>'+
                                            '</div>'+
                                            '<div class="d-grid g-3">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Costo:</p>'+
                                                    '<input class="input" type="text" name="Precio_millar_'+i+'" id="Precio_millar_'+i+'">'+
                                                '</div>'+
                                                '<div class="d-flex align-content-bottom justify-left">'+
                                                    '<input type="checkbox" name="tratamiento_'+i+'" id="tratamiento_'+i+'">'+
                                                    '<label class="lbl-checkbox" for="tratamiento_'+i+'" style="margin: 0px 0px 30px 0px;">T/TERMICO</label>'+
                                                '</div>'+
                                            '</div>'+
                                            '<p style="padding: 15px 0px 30px 0px;" class="txt-right">Orden de Producción:</p>'+
                                            '<div class="d-grid g-1">'+
                                                '<input type="checkbox" name="sin_op_'+i+'" id="sin_op_'+i+'">'+
                                                '<label class="lbl-checkbox" id="lbl_checkbox_salida" for="sin_op_'+i+'" style="margin: 0 0 15px 0;">Sin O.P.:</label>'+
                                            '</div>'+
                                            '<div class="d-grid g-2">'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>No. de Dibujo:</p>'+
                                                    '<input class="input" type="text" name="Dibujo_'+i+'" id="Dibujo_'+i+'" placeholder="Ingrese el numero de plano">'+
                                                '</div>'+
                                                '<div class="d-grid g-1 grid-gap-0">'+
                                                    '<p>Cantidad a Producir (millares):</p>'+
                                                    '<input class="input" type="number" name="cantidad_producir_'+i+'" id="cantidad_producir_'+i+'">'+
                                                '</div>'+
                                            '</div>'
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