<table>
    <thead>
        <th>Fecha</th>
        <th>Turno</th>
        <th>Departamento</th>
        <th>O.P.</th>
        <th>CLIENTE</th>
        <th>KILOS</th>
        <th>PIEZAS PRODUCIDAS</th>
        <th>NO. MÁQUINA</th>
        <th>DESCRIPCIÓN</th>
        <th>OBSERVACIONES</th>
    </thead>
    <tbody>
        <?php 

            for ($i=0; $i < count($data); $i++) { 
                echo '<tr>'.
                        '<td>'.$data[$i]['fecha'].'</td>'.
                        '<td>'.$data[$i]['turno'].'</td>'.
                        '<td>'.$data[$i]['estado_general'].'</td>'.
                        '<td>'.$data[$i]['Id_Folio'].'</td>'.
                        '<td>'.$data[$i]['Clientes'].'</td>'.
                        '<td>'.$data[$i]['kilos'].'</td>'.
                        '<td>'.$data[$i]['pzas'].'</td>'.
                        '<td>'.$data[$i]['Maquina'].'</td>'.
                        '<td>'.$data[$i]['descripcion'].'</td>'.
                        '<td>'.$data[$i]['observaciones'].'</td>'.
                    '</tr>';
            }
// '<td>'+el.fecha.split(' ')[0]+'</td>'+
// '<td>'+el.turno+'</td>'+
// '<td>'+el.estado_general+'</td>'+
// '<td>'+el.Id_Folio+'</td>'+
// '<td>'+el.Clientes+'</td>'+
// '<td>'+el.kilos+'</td>'+
// '<td>'+el.pzas+'</td>'+
// '<td>'+el.Maquina+'</td>'+
// '<td>'+el.descripcion+'</td>'+
// '<td>'+el.observaciones+'</td>'
        ?>
    </tbody>
</table>