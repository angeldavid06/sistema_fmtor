<table>
    <thead>
        <tr>
            <th colspan="5">ROLADO</th>
        </tr>
        <tr>
            <th>Botes</th>
            <th>Fecha</th>
            <th>Pzas.</th>
            <th>Pzas. Acumuladas</th>
            <th>K.g.</th>
        </tr>
    </thead>
    <tbody id="v_rolado">
        <?php 
        $fechas = array();
        $kilos = array();
        $pzas = array();
        $botes = array();
        $total_pzas = array();

        $kilo = 0;
        $total_kilos= 0;
        $pza = 0;
        $suma_pzas = 0;
        $bote = 0;
        $fecha= '';

        for($i=0; $i < count($data['rolado']); $i++){
            if($data['rolado'][$i]['fecha'] != $fecha && $fecha != ''){
                $kilos[] = $kilo;
                $pzas[] = $pza;
                $botes[] = $bote;
                $fechas[] = $fecha;
                $total_kilos += $kilo;
                $suma_pzas += $pza;
                $total_pzas[] = $suma_pzas;

                $kilo = 0;
                $pza = 0;
                $bote = 0;

                $kilo += $data['rolado'][$i]['kilos'];
                $pza += $data['rolado'][$i]['pzas'];
                $bote += $data['rolado'][$i]['botes'];


                $fecha= $data['rolado'][$i]['fecha'];
            } else {

                $fecha = $data['rolado'][$i]['fecha'];
                $kilo += $data['rolado'][$i]['kilos'];
                $pza += $data['rolado'][$i]['pzas'];
                $bote += $data['rolado'][$i]['botes'];

                    if(($i + 1) == count($data['rolado'])){
                        $kilos[] = $kilo;
                        $pzas[]= $pza;
                        $botes[]= $bote;
                        $fechas []= $fecha;
                        $total_kilos += $kilo;
                        $suma_pzas += $pza;
                        $total_pzas[] = $suma_pzas;
                    }   
            }
        }

        for($i = 0; $i < count($fechas); $i++){
            $fila='<tr>'.
                        '<td>'.$botes[$i].'</td>'.
                        '<td>'.$fechas[$i].'</td>'.
                        '<td>'.$pzas[$i].'</td>'.
                        '<td>'.$total_pzas[$i].'</td>'.
                        '<td>'.$kilos[$i].'</td>'.
                    '</tr>';
            echo $fila;
        }
     
        ?>
    </tbody>
        <tfoot>
            <tr>
                <td colspan="4">Total:</td>
                <td><?php echo $total_kilos; ?></td>

            </tr>
        </tfoot>
</table>