
const render_orden = (json) => {
    const body = document.getElementById("body_orden");
    body.innerHTML = "";
    if (json.length > 0) {
        json.forEach((element) => {
            body.innerHTML +=
                "<tr>" +
                    '<td>'+
                        '<div id="'+element.Id_Folio+'" class="mas_opciones_tablas">'+
                            '<div class="opcion">'+
                                '<button data-opciones="'+element.Id_Folio+'"  class="mas btn btn-transparent btn-icon-self material-icons">more_vert</button>'+
                            '</div>'+
                            '<div class="opciones" id="opciones-'+element.Id_Folio+'">'+
                                '<button data-editar="'+element.Id_Folio+'" style="margin: 0px 5px 0px 0px;" class="material-icons-outlined btn btn-amarillo btn-icon-self" data-modal="modal-actualizar">edit</button>'+
                                '<button style="margin: 0px 5px;" title="Tarjeta de Flujo ('+element.Id_Folio+')" class= "btn-transparent btn-impresion material-icons-outlined btn btn-icon-self" data-tarjeta="'+element.Id_Folio+'"*/ data-modal="modal-tarjetas">note_alt</button>'+
                                '<button style="margin: 0px 5px;" title="Orden de Producción ('+element.Id_Folio+')" class= "btn-transparent btn-impresion material-icons btn btn-icon-self" data-imprimir="' + element.Id_Folio +'">splitscreen</button>'+
                                '<button style="margin: 0px 5px;" title="Control de Producción('+element.Id_Folio+')" class= "btn-transparent btn-impresion material-icons btn btn-icon-self" data-control="' + element.Id_Folio +'">calendar_view_month</button>'+
                                '<button style="margin: 0px 0px 0px 5px;" title="Cancelar la O.P.: '+element.Id_Folio+'" class= "material-icons-outlined btn btn-icon-self btn-rojo" data-cancelar="'+element.Id_Folio+'">do_not_disturb_on</button>'+
                            '</div>'+
                        '</div>'+
                    '</td>'+    
                    "<td>" + element.estado_general + "</td>" +
                    "<td>" + element.Id_Folio + "</td>" +
                    "<td>" + element.Id_Salida_FK + "</td>" +
                    "<td>" + (element.Clientes + ' ' + element.razon_social.split(' ')[0].trim()) + "</td>" +
                    "<td class='txt-right'>$ " +new Intl.NumberFormat('es-MX').format(element.precio_millar) + "</td>" +
                    "<td>" + element.Id_Catalogo + "</td>" +
                    "<td>" + element.descripcion + "</td>" +
                    "<td>" + element.medida + "</td>" +
                    "<td class='txt-right'>" + new Intl.NumberFormat('es-MX').format(element.cantidad_elaborar) + "</td>" +
                    "<td>" + element.acabados + "</td>" +
                    // "<td>" + element.codigo + "</td>" +
                    "<td>" + element.tratamiento + "</td>" +
                    "<td>" + element.material + "</td>" +
                    "<td>" + element.Fecha + "</td>" +
                    "<td>" + element.fecha_entrega + "</td>" +
                "</tr>";
        });
    } else {
            body.innerHTML +=
                        "<tr>" +
                            "<td colspan='17'>No hay ninguna orden de producción.</td>" +
                        "</tr>";
    }
};