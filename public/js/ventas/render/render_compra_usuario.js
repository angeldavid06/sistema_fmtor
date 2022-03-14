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
                            "<td style='padding: 5px;'><button data-modal='modal-historial' data-compra='"+el.Id_Compra+"' style='margin: 0px;' class='btn btn-icon-self btn-transparent material-icons-outlined'>more_vert</button></td>"+
                            "<td style='padding: 5px;'><button style='margin: 0px;' class='btn btn-icon-self btn- material-icons-outlined' data-imprimir='"+el.Id_Compra+"' data-empresa='"+el.FK_Empresa+"'>print</button></td>"+
                        "</tr>";
    })
}

const render_pedidos = (json) => {
    const body = document.getElementById("body_historial");
    body.innerHTML = ''
    json.forEach(el => {
        body.innerHTML += "<tr>" + 
                            "<td>"+el.Codigo+"</td>"+
                            "<td>"+el.Producto+"</td>"+
                            "<td class='txt-right'>"+new Intl.NumberFormat('es-MX').format(el.Cantidad)+"</td>"+
                            "<td class='txt-right'>$ "+new Intl.NumberFormat('es-MX').format(el.Precio)+"</td>"+
                        "</tr>";
    })
}

const colocar_empresas = (json) => {
    const select_b = document.getElementById('f_empresa_b')
    json.forEach(el => {
        select_b.innerHTML += '<option value="'+el.Id_Empresa+'">'+el.Empresa+'</option>'
    });
}

const colocar_proveedores = (json) => {
    const select_b = document.getElementById('f_proveedor_b')
    json.forEach(el => {
        select_b.innerHTML += '<option value="'+el.Id_Proveedor+'">'+el.Proveedor+'</option>';
    })
}