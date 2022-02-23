<?php

    $total_pzas = 0;
    $total_costo = 0;
    $plano = '-';

    for ($i=0; $i < count($data['salida']); $i++) { 
        for ($j=0; $j < count($data['ordenes']); $j++) { 
            if ($data['ordenes'][$j]['Id_Pedido'] == $data['salida'][$i]['Id_Pedido']) {
                $plano = $data['ordenes'][$j]['Id_Catalogo'];
            }
        }
        echo '<tr>'.
                '<td class="txt-right">'.$data['salida'][$i]['cantidad'].'</td>'.
                '<td>'.$data['salida'][$i]['no_parte'].'</td>'.
                '<td>'.$data['salida'][$i]['pedido_cliente'].'</td>'.
                '<td>'.$data['salida'][$i]['medida'].'</td>'.
                '<td>'.$data['salida'][$i]['descripcion'].'</td>'.
                '<td>'.$data['salida'][$i]['acabados'].'</td>'.
                '<td class="txt-right">$ '.$data['salida'][$i]['costo'].'</td>'.
                '<td>'.$data['salida'][$i]['factura'].'</td>'. 
                '<td>'.$data['salida'][$i]['empaque'].'</td>'.
                '<td>'.$plano.'</td>'.
            '</tr>';
        $total_pzas += $data['salida'][$i]['cantidad'];
        $total_costo += $data['salida'][$i]['costo'];
        $plano = '-';
    }

    echo '<tr>' .
            '<td class="txt-right" style="border: none;"><br></td>'.
        '</tr>';
    echo '<tr>' .
            '<td class="txt-right">TOTAL PZAS:</td>' .
            '<td colspan="5"></td>' .
            '<td class="txt-right">COSTO TOTAL</td>' .
            '<td colspan="3"></td>' .
        '</tr>';
    echo '<tr>' .
            '<td class="txt-right">'.$total_pzas.'</td>' .
            '<td colspan="5"></td>' .
            '<td class="txt-right">$ '. $total_costo.'</td>' .
            '<td colspan="3"></td>' .
        '</tr>';
?>