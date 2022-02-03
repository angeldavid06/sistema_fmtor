const render_programa = (registros,maquina) => {
    const body = document.getElementById('body_maquina_'+maquina);
    body.innerHTML += '<tr>'+
                            '<td class="'+registros.producto_desc+'">'+registros.calibre+'</td>'+
                            '<td class="txt-right '+registros.producto_desc+'">'+new Intl.NumberFormat('es-MX').format((registros.factor*registros.cantidad_elaborar))+'</td>'+
                            '<td class="txt-right '+registros.producto_desc+'">'+registros.factor+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.Id_Folio+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.Fecha+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.Clientes+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.medida+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.descripcion+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.acabados+'</td>'+
                            '<td class="txt-right '+registros.producto_desc+'">'+registros.cantidad_elaborar+'</td>'+
                            '<td class="txt-right '+registros.producto_desc+'">$ '+registros.precio_millar+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.Fecha_entrega+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.Herramental+'</td>'+
                            '<td class="'+registros.producto_desc+'">'+registros.tratamiento+'</td>'+
                            '<td class="txt-right '+registros.producto_desc+'">$ '+new Intl.NumberFormat('es-MX').format(registros.TOTAL)+'</td>'+
                        '</tr>'
}