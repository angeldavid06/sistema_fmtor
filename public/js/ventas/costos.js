// REVISAR FORMULA DEL PULIDO

const calcular = (costo) => {
    const input_cantidad = document.getElementById("Cantidad_millares_"+costo)
    const input_factor = document.getElementById("factor_"+costo)
    const acabado = document.getElementById("Acabado_"+costo);

    if (input_cantidad.value == "") {
        open_alert("No ha introducido la cantidad", "naranja");
        input_cantidad.focus();
        document.getElementById("Cantidad_millares_" + costo).value = 0;
    } else if (input_factor.value == '') {
        open_alert('No ha introducido el factor','naranja')
        input_factor.focus()
        document.getElementById("factor_"+costo).value = 0.0;
    } else if (acabado.value == '') {
        open_alert('No seleccionado un acabado','naranja')
        acabado.focus()
    } else {
        if (input_cantidad.value < 100) {
            menos_100k(input_factor,acabado,costo)
        } else {
            mas_100k(input_factor, acabado, costo);
        }
    }
}

const menos_100k = (input_factor,acabado,costo) => {
    let costo_final = 0;
    if (parseFloat(input_factor.value) < 4) {
        costos_obtenidos.then(costos => {
            if (acabado.value == 'GALVANIZADO BLANCO' || acabado.value == 'GALVANIZADO AZUL') {
                costo_final = 1.3 * 3.6 * input_factor.value * costos.cotizacion.costo.acero
            } else if (acabado.value == 'PULIDO') {
                costo_final = (costos.cotizacion.costo.acero *
                    input_factor.value *
                    3.6 - 10 *
                    input_factor.value) * 1.3
            } else if (acabado.value == "TROPICALIZADO") {
              costo_final =
                costos.cotizacion.costo.acero * input_factor.value * 3.6 * 1.3;
            } else if (acabado.value == "ZINCADO NEGRO") {
                costo_final =
                  (costos.cotizacion.costo.acero *
                  input_factor.value *
                  3.6 + 
                  input_factor.value *
                  40) *
                  1.3;
            } else if (acabado.value == "NÍQUEL") {
              costo_final =
                (costos.cotizacion.costo.acero * input_factor.value * 3.6 +
                  input_factor.value * 13) *
                1.3;
            } else if (acabado.value == "PAVONADO") {
              costo_final =
                (input_factor.value * costos.cotizacion.costo.acero * 3.6 +
                  input_factor.value * 13) *
                1.3;
            } else if (acabado.value == "COBRE") {
              costo_final =
                (costos.cotizacion.costo.acero * input_factor.value * 3.6 +
                  input_factor.value * 33) *
                1.3;
            }
            document.getElementById("Precio_millar_"+costo).value = new Intl.NumberFormat('es-MX').format(costo_final);
        })
    } else {
        costos_obtenidos.then(costos => {
            if (acabado.value == 'GALVANIZADO BLANCO' || acabado.value == 'GALVANIZADO AZUL') {
                costo_final = 
                    (costos.cotizacion.costo.acero * 
                    input_factor.value +
                    10 * 
                    input_factor.value +
                    143) * 1.4
            } else if (acabado.value == 'PULIDO') {
                costo_final = 
                    (costos.cotizacion.costo.acero * 
                    input_factor.value +
                    143) * 1.4
            } else if (acabado.value == "TROPICALIZADO") {
              costo_final =
                (costos.cotizacion.costo.acero * input_factor.value +
                  10 * input_factor.value +
                  143) *
                1.4;
            } else if (acabado.value == "ZINCADO NEGRO") {
                costo_final =
                  (costos.cotizacion.costo.acero *
                  input_factor.value +
                  40 * 
                  input_factor.value +
                  143) *
                  1.4;
            } else if (acabado.value == "NÍQUEL") {
              costo_final =
                (costos.cotizacion.costo.acero * input_factor.value +
                  13 * input_factor.value +
                  143) *
                1.4;
            } else if (acabado.value == "PAVONADO") {
              costo_final =
                (costos.cotizacion.costo.acero * input_factor.value +
                  3.6 * input_factor.value +
                  143) *
                1.4;
            } else if (acabado.value == "COBRE") {
              costo_final =
                (costos.cotizacion.costo.acero * input_factor.value +
                  33 * input_factor.value +
                  143) *
                1.4;
            }
            document.getElementById("Precio_millar_"+costo).value = new Intl.NumberFormat('es-MX').format(costo_final);
        })
    }
}

const mas_100k = (input_factor,acabado,costo) => {
    let costo_final = 0;
        if (parseFloat(input_factor.value) < 4) {
        costos_obtenidos.then(costos => {
            if (acabado.value == 'GALVANIZADO BLANCO' || acabado.value == 'GALVANIZADO AZUL') {
                costo_final = 3.25 * input_factor.value * costos.cotizacion.costo.acero * 1.3
            } else if (acabado.value == 'PULIDO') {
                costo_final = 
                    (costos.cotizacion.costo.acero *
                    input_factor.value *
                    3.25 - 
                    10 *
                    input_factor.value) * 
                    1.3
            } else if (acabado.value == "TROPICALIZADO") {
              costo_final =
                costos.cotizacion.costo.acero * input_factor.value * 3.25 * 1.3;
            } else if (acabado.value == "ZINCADO NEGRO") {
                costo_final =
                    (3.25 * 
                    input_factor.value *
                    costos.cotizacion.costo.acero + 
                    input_factor.value *
                    40 - 
                    10 * 
                    input_factor.value
                    ) *
                    1.3;
            } else if (acabado.value == "NÍQUEL") {
              costo_final =
                (costos.cotizacion.costo.acero * input_factor.value * 3.25 +
                  input_factor.value * 13 -
                  10 * input_factor.value) *
                1.3;
            } else if (acabado.value == "PAVONADO") {
              costo_final =
                (input_factor.value * costos.cotizacion.costo.acero * 3.25 +
                  input_factor.value * 13) *
                1.3;
            } else if (acabado.value == "COBRE") {
              costo_final =
                (costos.cotizacion.costo.acero * input_factor.value * 3.25 +
                  input_factor.value * 33 -
                  10 * input_factor.value) *
                1.3;
            }
            document.getElementById("Precio_millar_"+costo).value = new Intl.NumberFormat('es-MX').format(costo_final);
        })
    } else {
        costos_obtenidos.then(costos => {
            if (acabado.value == 'GALVANIZADO BLANCO' || acabado.value == 'GALVANIZADO AZUL') {
                costo_final = 
                    (costos.cotizacion.costo.acero * 
                    input_factor.value +
                    10 * 
                    input_factor.value +
                    130) * 1.4
            } else if (acabado.value == 'PULIDO') {
                costo_final = 
                    (costos.cotizacion.costo.acero * 
                    input_factor.value +
                    130) * 
                    1.4
            } else if (acabado.value == 'TROPICALIZADO') {
                costo_final = 
                    (costos.cotizacion.costo.acero * 
                    input_factor.value +
                    10 *
                    input_factor.value +
                    130) *
                    1.4 
            } else if ((acabado.value == "ZINCADO NEGRO")) {
                costo_final = 
                    (costos.cotizacion.costo.acero *
                    input_factor.value +
                    40 * 
                    input_factor.value +
                    130) *
                    1.4;
            } else if (acabado.value == "NÍQUEL") {
              costo_final =
                (costos.cotizacion.costo.acero * input_factor.value +
                  13 * input_factor.value +
                  130) *
                1.4;
            } else if (acabado.value == "PAVONADO") {
              costo_final =
                (costos.cotizacion.costo.acero * input_factor.value +
                  13 * input_factor.value +
                  130) *
                1.4;
            } else if (acabado.value == "COBRE") {
              costo_final =
                (costos.cotizacion.costo.acero * input_factor.value +
                  33 * input_factor.value +
                  130) *
                1.4;
            }
            document.getElementById("Precio_millar_"+costo).value = new Intl.NumberFormat('es-MX').format(costo_final);
        })
    }
}