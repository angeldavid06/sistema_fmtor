<?php 

    $maquinas = [1,2,3,4,5,6,7,8,9];
    $maquina_1 = [];
    $maquina_2 = [];
    $maquina_3 = [];
    $maquina_4 = [];
    $maquina_5 = [];
    $maquina_6 = [];
    $maquina_7 = [];
    $maquina_8 = [];
    $maquina_9 = [];

    for ($j = 0; $j < count($data); $j++) {
        if ($data[$j]['no_maquina'] == 1) {
            $maquina_1[] = $data[$j];
        } else if ($data[$j]['no_maquina'] == 2) {
            $maquina_2[] = $data[$j];
        } else if ($data[$j]['no_maquina'] == 3) {
            $maquina_3[] = $data[$j];
        } else if ($data[$j]['no_maquina'] == 4) {
            $maquina_4[] = $data[$j];
        } else if ($data[$j]['no_maquina'] == 5) {
            $maquina_5[] = $data[$j];
        } else if ($data[$j]['no_maquina'] == 6) {
            $maquina_6[] = $data[$j];
        } else if ($data[$j]['no_maquina'] == 7) {
            $maquina_7[] = $data[$j];
        } else if ($data[$j]['no_maquina'] == 8) {
            $maquina_8[] = $data[$j];
        } else if ($data[$j]['no_maquina'] == 9) {
            $maquina_9[] = $data[$j];
        }
    }
?>

<table>
    <thead>
        <tr>
            <th style="padding: 10px 0px; ">CAL.</th>
            <th style="padding: 10px 0px; ">Kg.</th>
            <th style="padding: 10px 0px; ">Factor</th>
            <th style="padding: 10px 0px; ">N° O.P.</th>
            <th style="padding: 10px 0px; min-width: 100px;">Fecha de O.P.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Cliente</th>
            <th style="padding: 10px 0px;  min-width: 100px;">Medida</th>
            <th style="padding: 10px 0px; min-width: 120px;">Descripción</th>
            <th style="padding: 10px 0px; min-width: 100px;">Acabado</th>
            <th style="padding: 10px 0px; ">Cant.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Precio</th>
            <th style="padding: 10px 0px; min-width: 110px;">Fecha<br>Entrega</th>
            <th style="padding: 10px 0px; ">Herramental</th>
            <th style="padding: 10px 0px; min-width: 120px;">Tratamiento</th>
            <th style="padding: 10px 0px; "></th>
        </tr>
        <tr>
            <th colspan="15" class="txt-center">
                Máquina 1
            </th>
        </tr>
    </thead>
    <tbody>
        <?php 
            for ($i=0; $i < count($maquina_1); $i++) { 
                echo '<tr>';
                    echo '<td>'.$maquina_1[$i]['calibre'].'</td>';
                    echo '<td>'.($maquina_1[$i]['factor']*$maquina_1[$i]['cantidad_elaborar']).'</td>';
                    echo '<td>'.$maquina_1[$i]['factor'].'</td>';
                    echo '<td>'.$maquina_1[$i]['Id_Folio'].'</td>';
                    echo '<td>'.$maquina_1[$i]['Fecha'].'</td>';
                    echo '<td>'.$maquina_1[$i]['Clientes'].'</td>';
                    echo '<td>'.$maquina_1[$i]['medida'].'</td>';
                    echo '<td>'.$maquina_1[$i]['descripcion'].'</td>';
                    echo '<td>'.$maquina_1[$i]['acabados'].'</td>';
                    echo '<td>'.$maquina_1[$i]['cantidad_elaborar'].'</td>';
                    echo '<td>$ '.$maquina_1[$i]['precio_millar'].'</td>';
                    echo '<td>'.$maquina_1[$i]['Herramental'].'</td>';
                    echo '<td>'.$maquina_1[$i]['Fecha_entrega'].'</td>';
                    echo '<td>'.$maquina_1[$i]['tratamiento'].'</td>';
                    echo '<td>'.$maquina_1[$i]['TOTAL'].'</td>';
                echo '</tr>';
            }
        ?>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th style="padding: 10px 0px; ">CAL.</th>
            <th style="padding: 10px 0px; ">Kg.</th>
            <th style="padding: 10px 0px; ">Factor</th>
            <th style="padding: 10px 0px; ">N° O.P.</th>
            <th style="padding: 10px 0px; min-width: 100px;">Fecha de O.P.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Cliente</th>
            <th style="padding: 10px 0px;  min-width: 100px;">Medida</th>
            <th style="padding: 10px 0px; min-width: 120px;">Descripción</th>
            <th style="padding: 10px 0px; min-width: 100px;">Acabado</th>
            <th style="padding: 10px 0px; ">Cant.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Precio</th>
            <th style="padding: 10px 0px; min-width: 110px;">Fecha<br>Entrega</th>
            <th style="padding: 10px 0px; ">Herramental</th>
            <th style="padding: 10px 0px; min-width: 120px;">Tratamiento</th>
            <th style="padding: 10px 0px; "></th>
        </tr>
        <tr>
            <th colspan="15" class="txt-center">
                Máquina 2
            </th>
        </tr>
    </thead>
    <tbody>
        <?php 
            for ($i=0; $i < count($maquina_2); $i++) { 
                echo '<tr>';
                    echo '<td>'.$maquina_2[$i]['calibre'].'</td>';
                    echo '<td>'.($maquina_2[$i]['factor']*$maquina_2[$i]['cantidad_elaborar']).'</td>';
                    echo '<td>'.$maquina_2[$i]['factor'].'</td>';
                    echo '<td>'.$maquina_2[$i]['Id_Folio'].'</td>';
                    echo '<td>'.$maquina_2[$i]['Fecha'].'</td>';
                    echo '<td>'.$maquina_2[$i]['Clientes'].'</td>';
                    echo '<td>'.$maquina_2[$i]['medida'].'</td>';
                    echo '<td>'.$maquina_2[$i]['descripcion'].'</td>';
                    echo '<td>'.$maquina_2[$i]['acabados'].'</td>';
                    echo '<td>'.$maquina_2[$i]['cantidad_elaborar'].'</td>';
                    echo '<td>$ '.$maquina_2[$i]['precio_millar'].'</td>';
                    echo '<td>'.$maquina_2[$i]['Herramental'].'</td>';
                    echo '<td>'.$maquina_2[$i]['Fecha_entrega'].'</td>';
                    echo '<td>'.$maquina_2[$i]['tratamiento'].'</td>';
                    echo '<td>'.$maquina_2[$i]['TOTAL'].'</td>';
                echo '</tr>';
            }
        ?>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th style="padding: 10px 0px; ">CAL.</th>
            <th style="padding: 10px 0px; ">Kg.</th>
            <th style="padding: 10px 0px; ">Factor</th>
            <th style="padding: 10px 0px; ">N° O.P.</th>
            <th style="padding: 10px 0px; min-width: 100px;">Fecha de O.P.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Cliente</th>
            <th style="padding: 10px 0px;  min-width: 100px;">Medida</th>
            <th style="padding: 10px 0px; min-width: 120px;">Descripción</th>
            <th style="padding: 10px 0px; min-width: 100px;">Acabado</th>
            <th style="padding: 10px 0px; ">Cant.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Precio</th>
            <th style="padding: 10px 0px; min-width: 110px;">Fecha<br>Entrega</th>
            <th style="padding: 10px 0px; ">Herramental</th>
            <th style="padding: 10px 0px; min-width: 120px;">Tratamiento</th>
            <th style="padding: 10px 0px; "></th>
        </tr>
        <tr>
            <th colspan="15" class="txt-center">
                Máquina 3
            </th>
        </tr>
    </thead>
    <tbody>
        <?php 
            for ($i=0; $i < count($maquina_3); $i++) { 
                echo '<tr>';
                    echo '<td>'.$maquina_3[$i]['calibre'].'</td>';
                    echo '<td>'.($maquina_3[$i]['factor']*$maquina_3[$i]['cantidad_elaborar']).'</td>';
                    echo '<td>'.$maquina_3[$i]['factor'].'</td>';
                    echo '<td>'.$maquina_3[$i]['Id_Folio'].'</td>';
                    echo '<td>'.$maquina_3[$i]['Fecha'].'</td>';
                    echo '<td>'.$maquina_3[$i]['Clientes'].'</td>';
                    echo '<td>'.$maquina_3[$i]['medida'].'</td>';
                    echo '<td>'.$maquina_3[$i]['descripcion'].'</td>';
                    echo '<td>'.$maquina_3[$i]['acabados'].'</td>';
                    echo '<td>'.$maquina_3[$i]['cantidad_elaborar'].'</td>';
                    echo '<td>$ '.$maquina_3[$i]['precio_millar'].'</td>';
                    echo '<td>'.$maquina_3[$i]['Fecha_entrega'].'</td>';
                    echo '<td>'.$maquina_3[$i]['Herramental'].'</td>';
                    echo '<td>'.$maquina_3[$i]['tratamiento'].'</td>';
                    echo '<td>'.$maquina_3[$i]['TOTAL'].'</td>';
                echo '</tr>';
            }
        ?>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th style="padding: 10px 0px; ">CAL.</th>
            <th style="padding: 10px 0px; ">Kg.</th>
            <th style="padding: 10px 0px; ">Factor</th>
            <th style="padding: 10px 0px; ">N° O.P.</th>
            <th style="padding: 10px 0px; min-width: 100px;">Fecha de O.P.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Cliente</th>
            <th style="padding: 10px 0px;  min-width: 100px;">Medida</th>
            <th style="padding: 10px 0px; min-width: 120px;">Descripción</th>
            <th style="padding: 10px 0px; min-width: 100px;">Acabado</th>
            <th style="padding: 10px 0px; ">Cant.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Precio</th>
            <th style="padding: 10px 0px; min-width: 110px;">Fecha<br>Entrega</th>
            <th style="padding: 10px 0px; ">Herramental</th>
            <th style="padding: 10px 0px; min-width: 120px;">Tratamiento</th>
            <th style="padding: 10px 0px; m"></th>
        </tr>
        <tr>
            <th colspan="15" class="txt-center">
                Máquina 4
            </th>
        </tr>
    </thead>
    <tbody>
        <?php 
            for ($i=0; $i < count($maquina_4); $i++) { 
                echo '<tr>';
                    echo '<td>'.$maquina_4[$i]['calibre'].'</td>';
                    echo '<td>'.($maquina_4[$i]['factor']*$maquina_4[$i]['cantidad_elaborar']).'</td>';
                    echo '<td>'.$maquina_4[$i]['factor'].'</td>';
                    echo '<td>'.$maquina_4[$i]['Id_Folio'].'</td>';
                    echo '<td>'.$maquina_4[$i]['Fecha'].'</td>';
                    echo '<td>'.$maquina_4[$i]['Clientes'].'</td>';
                    echo '<td>'.$maquina_4[$i]['medida'].'</td>';
                    echo '<td>'.$maquina_4[$i]['descripcion'].'</td>';
                    echo '<td>'.$maquina_4[$i]['acabados'].'</td>';
                    echo '<td>'.$maquina_4[$i]['cantidad_elaborar'].'</td>';
                    echo '<td>$ '.$maquina_4[$i]['precio_millar'].'</td>';
                    echo '<td>'.$maquina_4[$i]['Fecha_entrega'].'</td>';
                    echo '<td>'.$maquina_4[$i]['Herramental'].'</td>';
                    echo '<td>'.$maquina_4[$i]['tratamiento'].'</td>';
                    echo '<td>'.$maquina_4[$i]['TOTAL'].'</td>';
                echo '</tr>';
            }
        ?>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th style="padding: 10px 0px; ">CAL.</th>
            <th style="padding: 10px 0px; ">Kg.</th>
            <th style="padding: 10px 0px; ">Factor</th>
            <th style="padding: 10px 0px; ">N° O.P.</th>
            <th style="padding: 10px 0px; min-width: 100px;">Fecha de O.P.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Cliente</th>
            <th style="padding: 10px 0px;  min-width: 100px;">Medida</th>
            <th style="padding: 10px 0px; min-width: 120px;">Descripción</th>
            <th style="padding: 10px 0px; min-width: 100px;">Acabado</th>
            <th style="padding: 10px 0px; ">Cant.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Precio</th>
            <th style="padding: 10px 0px; min-width: 110px;">Fecha<br>Entrega</th>
            <th style="padding: 10px 0px; ">Herramental</th>
            <th style="padding: 10px 0px; min-width: 120px;">Tratamiento</th>
            <th style="padding: 10px 0px; "></th>
        </tr>
        <tr>
            <th colspan="15" class="txt-center">
                Máquina 5
            </th>
        </tr>
    </thead>
    <tbody>
        <?php 
            for ($i=0; $i < count($maquina_5); $i++) { 
                echo '<tr>';
                    echo '<td>'.$maquina_5[$i]['calibre'].'</td>';
                    echo '<td>'.($maquina_5[$i]['factor']*$maquina_5[$i]['cantidad_elaborar']).'</td>';
                    echo '<td>'.$maquina_5[$i]['factor'].'</td>';
                    echo '<td>'.$maquina_5[$i]['Id_Folio'].'</td>';
                    echo '<td>'.$maquina_5[$i]['Fecha'].'</td>';
                    echo '<td>'.$maquina_5[$i]['Clientes'].'</td>';
                    echo '<td>'.$maquina_5[$i]['medida'].'</td>';
                    echo '<td>'.$maquina_5[$i]['descripcion'].'</td>';
                    echo '<td>'.$maquina_5[$i]['acabados'].'</td>';
                    echo '<td>'.$maquina_5[$i]['cantidad_elaborar'].'</td>';
                    echo '<td>$ '.$maquina_5[$i]['precio_millar'].'</td>';
                    echo '<td>'.$maquina_5[$i]['Fecha_entrega'].'</td>';
                    echo '<td>'.$maquina_5[$i]['Herramental'].'</td>';
                    echo '<td>'.$maquina_5[$i]['tratamiento'].'</td>';
                    echo '<td>'.$maquina_5[$i]['TOTAL'].'</td>';
                echo '</tr>';
            }
        ?>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th style="padding: 10px 0px; ">CAL.</th>
            <th style="padding: 10px 0px; ">Kg.</th>
            <th style="padding: 10px 0px; ">Factor</th>
            <th style="padding: 10px 0px; ">N° O.P.</th>
            <th style="padding: 10px 0px; min-width: 100px;">Fecha de O.P.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Cliente</th>
            <th style="padding: 10px 0px;  min-width: 100px;">Medida</th>
            <th style="padding: 10px 0px; min-width: 120px;">Descripción</th>
            <th style="padding: 10px 0px; min-width: 100px;">Acabado</th>
            <th style="padding: 10px 0px; ">Cant.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Precio</th>
            <th style="padding: 10px 0px; min-width: 110px;">Fecha<br>Entrega</th>
            <th style="padding: 10px 0px; ">Herramental</th>
            <th style="padding: 10px 0px; min-width: 120px;">Tratamiento</th>
            <th style="padding: 10px 0px; "></th>
        </tr>
        <tr>
            <th colspan="15" class="txt-center">
                Máquina 6
            </th>
        </tr>
    </thead>
    <tbody>
        <?php 
            for ($i=0; $i < count($maquina_6); $i++) { 
                echo '<tr>';
                    echo '<td>'.$maquina_6[$i]['calibre'].'</td>';
                    echo '<td>'.($maquina_6[$i]['factor']*$maquina_6[$i]['cantidad_elaborar']).'</td>';
                    echo '<td>'.$maquina_6[$i]['factor'].'</td>';
                    echo '<td>'.$maquina_6[$i]['Id_Folio'].'</td>';
                    echo '<td>'.$maquina_6[$i]['Fecha'].'</td>';
                    echo '<td>'.$maquina_6[$i]['Clientes'].'</td>';
                    echo '<td>'.$maquina_6[$i]['medida'].'</td>';
                    echo '<td>'.$maquina_6[$i]['descripcion'].'</td>';
                    echo '<td>'.$maquina_6[$i]['acabados'].'</td>';
                    echo '<td>'.$maquina_6[$i]['cantidad_elaborar'].'</td>';
                    echo '<td>$ '.$maquina_6[$i]['precio_millar'].'</td>';
                    echo '<td>'.$maquina_6[$i]['Fecha_entrega'].'</td>';
                    echo '<td>'.$maquina_6[$i]['Herramental'].'</td>';
                    echo '<td>'.$maquina_6[$i]['tratamiento'].'</td>';
                    echo '<td>'.$maquina_6[$i]['TOTAL'].'</td>';
                echo '</tr>';
            }
        ?>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th style="padding: 10px 0px; ">CAL.</th>
            <th style="padding: 10px 0px; ">Kg.</th>
            <th style="padding: 10px 0px; ">Factor</th>
            <th style="padding: 10px 0px; ">N° O.P.</th>
            <th style="padding: 10px 0px; min-width: 100px;">Fecha de O.P.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Cliente</th>
            <th style="padding: 10px 0px;  min-width: 100px;">Medida</th>
            <th style="padding: 10px 0px; min-width: 120px;">Descripción</th>
            <th style="padding: 10px 0px; min-width: 100px;">Acabado</th>
            <th style="padding: 10px 0px; ">Cant.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Precio</th>
            <th style="padding: 10px 0px; min-width: 110px;">Fecha<br>Entrega</th>
            <th style="padding: 10px 0px; ">Herramental</th>
            <th style="padding: 10px 0px; min-width: 120px;">Tratamiento</th>
            <th style="padding: 10px 0px; "></th>
        </tr>
        <tr>
            <th colspan="15" class="txt-center">
                Máquina 7
            </th>
        </tr>
    </thead>
    <tbody>
        <?php 
            for ($i=0; $i < count($maquina_7); $i++) { 
                echo '<tr>';
                    echo '<td>'.$maquina_7[$i]['calibre'].'</td>';
                    echo '<td>'.($maquina_7[$i]['factor']*$maquina_7[$i]['cantidad_elaborar']).'</td>';
                    echo '<td>'.$maquina_7[$i]['factor'].'</td>';
                    echo '<td>'.$maquina_7[$i]['Id_Folio'].'</td>';
                    echo '<td>'.$maquina_7[$i]['Fecha'].'</td>';
                    echo '<td>'.$maquina_7[$i]['Clientes'].'</td>';
                    echo '<td>'.$maquina_7[$i]['medida'].'</td>';
                    echo '<td>'.$maquina_7[$i]['descripcion'].'</td>';
                    echo '<td>'.$maquina_7[$i]['acabados'].'</td>';
                    echo '<td>'.$maquina_7[$i]['cantidad_elaborar'].'</td>';
                    echo '<td>$ '.$maquina_7[$i]['precio_millar'].'</td>';
                    echo '<td>'.$maquina_7[$i]['Fecha_entrega'].'</td>';
                    echo '<td>'.$maquina_7[$i]['Herramental'].'</td>';
                    echo '<td>'.$maquina_7[$i]['tratamiento'].'</td>';
                    echo '<td>'.$maquina_7[$i]['TOTAL'].'</td>';
                echo '</tr>';
            }
        ?>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th style="padding: 10px 0px; ">CAL.</th>
            <th style="padding: 10px 0px; ">Kg.</th>
            <th style="padding: 10px 0px; ">Factor</th>
            <th style="padding: 10px 0px; ">N° O.P.</th>
            <th style="padding: 10px 0px; min-width: 100px;">Fecha de O.P.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Cliente</th>
            <th style="padding: 10px 0px;  min-width: 100px;">Medida</th>
            <th style="padding: 10px 0px; min-width: 120px;">Descripción</th>
            <th style="padding: 10px 0px; min-width: 100px;">Acabado</th>
            <th style="padding: 10px 0px; ">Cant.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Precio</th>
            <th style="padding: 10px 0px; min-width: 110px;">Fecha<br>Entrega</th>
            <th style="padding: 10px 0px; ">Herramental</th>
            <th style="padding: 10px 0px; min-width: 120px;">Tratamiento</th>
            <th style="padding: 10px 0px; "></th>
        </tr>
        <tr>
            <th colspan="15" class="txt-center">
                Máquina 8
            </th>
        </tr>
    </thead>
    <tbody>
        <?php 
            for ($i=0; $i < count($maquina_8); $i++) { 
                echo '<tr>';
                    echo '<td>'.$maquina_8[$i]['calibre'].'</td>';
                    echo '<td>'.($maquina_8[$i]['factor']*$maquina_8[$i]['cantidad_elaborar']).'</td>';
                    echo '<td>'.$maquina_8[$i]['factor'].'</td>';
                    echo '<td>'.$maquina_8[$i]['Id_Folio'].'</td>';
                    echo '<td>'.$maquina_8[$i]['Fecha'].'</td>';
                    echo '<td>'.$maquina_8[$i]['Clientes'].'</td>';
                    echo '<td>'.$maquina_8[$i]['medida'].'</td>';
                    echo '<td>'.$maquina_8[$i]['descripcion'].'</td>';
                    echo '<td>'.$maquina_8[$i]['acabados'].'</td>';
                    echo '<td>'.$maquina_8[$i]['cantidad_elaborar'].'</td>';
                    echo '<td>$ '.$maquina_8[$i]['precio_millar'].'</td>';
                    echo '<td>'.$maquina_8[$i]['Fecha_entrega'].'</td>';
                    echo '<td>'.$maquina_8[$i]['Herramental'].'</td>';
                    echo '<td>'.$maquina_8[$i]['tratamiento'].'</td>';
                    echo '<td>'.$maquina_8[$i]['TOTAL'].'</td>';
                echo '</tr>';
            }
        ?>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th style="padding: 10px 0px; ">CAL.</th>
            <th style="padding: 10px 0px; ">Kg.</th>
            <th style="padding: 10px 0px; ">Factor</th>
            <th style="padding: 10px 0px; ">N° O.P.</th>
            <th style="padding: 10px 0px; min-width: 100px;">Fecha de O.P.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Cliente</th>
            <th style="padding: 10px 0px;  min-width: 100px;">Medida</th>
            <th style="padding: 10px 0px; min-width: 120px;">Descripción</th>
            <th style="padding: 10px 0px; min-width: 100px;">Acabado</th>
            <th style="padding: 10px 0px; ">Cant.</th>
            <th style="padding: 10px 0px; min-width: 80px;">Precio</th>
            <th style="padding: 10px 0px; min-width: 110px;">Fecha<br>Entrega</th>
            <th style="padding: 10px 0px; ">Herramental</th>
            <th style="padding: 10px 0px; min-width: 120px;">Tratamiento</th>
            <th style="padding: 10px 0px; "></th>
        </tr>
        <tr>
            <th colspan="15" class="txt-center">
                Máquina 9
            </th>
        </tr>
    </thead>
    <tbody>
        <?php 
            for ($i=0; $i < count($maquina_9); $i++) { 
                echo '<tr>';
                    echo '<td>'.$maquina_9[$i]['calibre'].'</td>';
                    echo '<td>'.($maquina_9[$i]['factor']*$maquina_9[$i]['cantidad_elaborar']).'</td>';
                    echo '<td>'.$maquina_9[$i]['factor'].'</td>';
                    echo '<td>'.$maquina_9[$i]['Id_Folio'].'</td>';
                    echo '<td>'.$maquina_9[$i]['Fecha'].'</td>';
                    echo '<td>'.$maquina_9[$i]['Clientes'].'</td>';
                    echo '<td>'.$maquina_9[$i]['medida'].'</td>';
                    echo '<td>'.$maquina_9[$i]['descripcion'].'</td>';
                    echo '<td>'.$maquina_9[$i]['acabados'].'</td>';
                    echo '<td>'.$maquina_9[$i]['cantidad_elaborar'].'</td>';
                    echo '<td>$ '.$maquina_9[$i]['precio_millar'].'</td>';
                    echo '<td>'.$maquina_9[$i]['Fecha_entrega'].'</td>';
                    echo '<td>'.$maquina_9[$i]['Herramental'].'</td>';
                    echo '<td>'.$maquina_9[$i]['tratamiento'].'</td>';
                    echo '<td>'.$maquina_9[$i]['TOTAL'].'</td>';
                echo '</tr>';
            }
        ?>
    </tbody>
</table>