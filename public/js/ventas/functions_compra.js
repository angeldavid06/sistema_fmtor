const obtener_ordenes = () => {
    const respuesta = fetchAPI('',url+'/ventas/compras/obtener','')
    respuesta.then(json => {
        render_ordenes(json)
    })
}

const obtener_empresas = () => {
    const respuesta = fetchAPI("", url + "/ventas/compras/obtener_empresas", "");
    respuesta.then((json) => {
        colocar_empresas(json);
    });
};

const obtener_proveedores = () => {
    const respuesta = fetchAPI("", url + "/ventas/compras/obtener_proveedores", "");
    respuesta.then((json) => {
        colocar_proveedores(json)
    });
}

const obtener_pedidos = (id) => {
    const respuesta = fetchAPI('', url+'/ventas/compras/obtener_informacion_pedidos?id='+id,'')
    respuesta.then(json => {
        render_pedidos(json)
    })
}

const colocar_fecha = () => {
    const fecha = new Date().toLocaleDateString()
    const input = document.getElementById('Fecha')
    let resultado = '';
    
    if (fecha.split("/")[1] < 10) {
        resultado = fecha.split("/")[2] + "-0" + fecha.split("/")[1];
    } else {
        resultado = fecha.split("/")[2] + "-" + fecha.split("/")[1];
    }

    if (fecha.split("/")[0] < 10) {
        resultado += "-0" + fecha.split("/")[0];
    } else {
        resultado += "-" + fecha.split("/")[0];
    }

    input.value = resultado;
}

const generar_documento = (id,empresa) => {
    printPage(url+'/ventas/compras/generar_pdf?id='+id+'&empresa='+empresa);
}

const btn_limpiar_filtros = document.getElementById('limpiar-filtros')

btn_limpiar_filtros.addEventListener('click',() => {
    restaurar_formulario();
    obtener_ordenes();
})

const limpiar_formulario = (form) => {
    const inputs = form.getElementsByClassName("input");
    for (let i = 1; i < inputs.length; i++) {
        inputs[i].value = "";
    }
    render_form_tornillo(1);
    document.getElementById("Cantidad_Tornillos").value = 1;
};

const restaurar_formulario = () => {
    const form_filtros = document.getElementById("form-filtros");
    const inputs_radio = document.getElementsByName("buscar_por");
    for (let i = 0; i < inputs_radio.length; i++) {
        inputs_radio[i].checked = false;
    }

    const inputs = form_filtros.getElementsByClassName("input");
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].value = "";
        inputs[i].setAttribute("disabled", "");
    }
};

document.addEventListener('click',  (evt) => {
    if (evt.target.dataset.imprimir) {
        generar_documento(evt.target.dataset.imprimir,evt.target.dataset.empresa);
    } else  if (evt.target.dataset.compra) {
        document.getElementById("orden_de_compra").innerHTML = 'Orden de Compra: '+evt.target.dataset.compra;
        obtener_pedidos(evt.target.dataset.compra);
    } else if (evt.target.dataset.recarga) {
        obtener_ordenes()
        restaurar_formulario();
    }
})

document.addEventListener('DOMContentLoaded', () => {
    obtener_ordenes()
    obtener_empresas()
    obtener_proveedores()
    colocar_fecha()
})