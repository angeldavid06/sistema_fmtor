const input_factor = document.getElementById("factor_1")
const acabado = document.getElementById("Acabado_1");
let costo_final = 0

// REVISAR FORMULA DEL PULIDO

const calcular = () => {
    if (acabado.value == '') {
        open_alert('No seleccionado un acabado','naranja')
        document.getElementById("Precio_millar_1").value = 0.0;
    } else {
        costos_obtenidos.then(costos => {
            if (acabado.value == 'GALVANIZADO BLANCO' || acabado.value == 'GALVANIZADO AZUL') {
                costo_final = 1.3 * 3.6 * input_factor.value * costos.cotizacion.costo.acero
            } else if (acabado.value == 'PULIDO') {
                costo_final = (costos.cotizacion.costo.acero * input_factor.value * 3.6 - 10 * input_factor.value) * 1.3
            } else if (acabado.value == 'TROPICALIZADO') {
                costo_final = costos.cotizacion.costo.acero * input_factor.value * 3.6 * 1.3 
            } else if (acabado.value == 'NÍQUEL') {
                costo_final = (costos.cotizacion.costo.acero * input_factor.value * 3.6 + input_factor.value * 13) * 1.3 
            } else if (acabado.value == 'PAVONADO') {
                costo_final = (input_factor.value * costos.cotizacion.costo.acero *  3.6 + input_factor.value * 13) * 1.3 
            } else if (acabado.value == 'COBRE') {
                costo_final = (costos.cotizacion.costo.acero * input_factor.value * 3.6 + input_factor.value * 33) * 1.3 
            }
            document.getElementById("Precio_millar_1").value = costo_final;
        })
    }

}