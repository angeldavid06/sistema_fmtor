const render_clientes = (json) => {
    const body = document.getElementsByClassName('body_clientes');
    body[0].innerHTML = '';  
    json.forEach(element => {
        if (element.Id_Clientes != 1) {
            body[0].innerHTML += '<tr>'+
                                    '<td>'+element.Id_Clientes+'</td>'+
                                    '<td>'+element.Razon_social+'</td>'+
                                    '<td>'+element.Nombre+'</td>'+
                                    '<td>'+element.Telefono+'</td>'+
                                    '<td>'+element.Correo+'</td>'+
                                    '<td>'+element.Direccion+'</td>'+
                                  '</tr>';
        }
    });
}