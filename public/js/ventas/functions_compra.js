const form_orden_ingresar = document.getElementById("form_reg_orden");

form_orden_ingresar.addEventListener('submit', (evt) => {
    evt.preventDefault();
    ingresar_orden();
})

const ingresar_orden = () => {
    const respuesta = fetchAPI(form_orden_ingresar,url+'/ventas/compras/insertar','POST')
    respuesta.then(json => {
        if (json == 1) {
            obtener_ordenes()
            open_alert('Orden de compra registrada correctamente','verde')
        } else {
            open_alert('El registro no pudo ser realizado','rojo')
        }
    })
}

const colocar_empresas = (json) => {
    const select = document.getElementById('empresas')
    json.forEach(el => {
        select.innerHTML += '<option value="'+el.Id_Empresa+'">'+el.Empresa+'</option>'
    });
}

const colocar_proveedores = (json) => {
    const select = document.getElementById('proveedores')
    json.forEach(el => {
        select.innerHTML += '<option value="'+el.Id_Proveedor+'">'+el.Proveedor+'</option>';
    })
}

const render_ordenes = (json) => {
    const body = document.getElementById('body')
    body.innerHTML = ''
    json.forEach(el => {
        body.innerHTML += "<tr>" + 
                            "<td>"+el.Id_Compra+"</td>"+
                            "<td>"+el.Fecha+"</td>"+
                            "<td>"+el.Empresa+"</td>"+
                            "<td>"+el.Solicitado+"</td>"+
                            "<td>"+el.Proveedor+"</td>"+
                            "<td style='padding: 5px;'><button style='margin: 0px;' class='btn btn-icon-self btn-amarillo material-icons-outlined'>edit</button></td>"+
                            "<td style='padding: 5px;'><button style='margin: 0px;' class='btn btn-icon-self btn-transparent material-icons-outlined'>more_vert</button></td>"+
                            "<td style='padding: 5px;'><button style='margin: 0px;' class='btn btn-icon-self btn- material-icons-outlined' data-imprimir='"+el.Id_Compra+"' data-empresa='"+el.FK_Empresa+"'>print</button></td>"+
                        "</tr>";
    })
}

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
        resultado += "-0" + fecha.split("/")[0];
    }

    input.value = resultado;
}

const generar_documento = (id,empresa) => {
    printPage(url+'/ventas/compras/generar_pdf?id='+id+'&empresa='+empresa);
}

document.addEventListener('click',  (evt) => {
    if (evt.target.dataset.imprimir) {
        generar_documento(evt.target.dataset.imprimir,evt.target.dataset.empresa);
    }
})

document.addEventListener('DOMContentLoaded', () => {
    obtener_ordenes()
    obtener_empresas()
    obtener_proveedores()
    colocar_fecha()
})