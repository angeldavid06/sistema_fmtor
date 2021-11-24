<table>
    <thead>
        <tr>
            <th>CAL.</th>
            <th>Kg.</th>
            <th>Factor</th>
            <th>N° O.P.</th>
            <th>Fecha de O.P.</th>
            <th>Cliente</th>
            <th>Descripción</th>
            <th>Acabado</th>
            <th>Cant</th>
            <th>Precio</th>
            <th>Total</th>
            <th>Acumulado</th>
            <th>Estado</th>
        </tr>
    </thead>
    <tbody>
        <?php
            for ($i=0; $i < count($data); $i++) { 
                echo '<tr>'.
                        '<td>'.$data[$i]['calibre'].'</td>'.
                        '<td class="txt-right">'.number_format(floatval($data[$i]['factor'])*floatval($data[$i]['cantidad_elaborar']), 2, '.', '').'</td>'.
                        '<td class="txt-right">'.number_format(floatval($data[$i]['factor']), 2, '.', '').'</td>'.
                        '<td>'.$data[$i]['Id_Folio'].'</td>'.
                        '<td>'.(explode(' ',$data[$i]['Fecha']))[0].'</td>'.
                        '<td>'.$data[$i]['Clientes'].'</td>'.
                        '<td>'.$data[$i]['descripcion'].'</td>'.
                        '<td>'.$data[$i]['acabados'].'</td>'.
                        '<td class="txt-right">'.$data[$i]['cantidad_elaborar'].'</td>'.
                        '<td class="txt-right">'.$data[$i]['precio_millar'].'</td>'.
                        '<td class="txt-right">'.number_format($data[$i]['TOTAL'], 2, '.', '').'</td>'.
                        '<td class="txt-right">'.'Acumulado'.'</td>'.
                        '<td>'.$data[$i]['estado_general'].'</td>'.
                    '</tr>';
            }
        ?>
    </tbody>
</table>