<table>
    <thead>
        <tr>
            <th colspan="3" class="th-estado">ACABADO</th>
            <th colspan="2" class="txt-left">Factor: <?php echo $data['factores'][5]['factor']; ?></th>
        </tr>
        <tr>
            <th>Bote</th>
            <th>Fecha</th>
            <th>Pzas.</th>
            <th width="50px">Pzas. Acumuladas</th>
            <th>K.g.</th>

    </thead>
    <tbody id="v_acabado">
        <?php
        $fechas = array();
        $kilos = array();
        $pzas = array();
        $botes = array();
        $total_pzas = array();


        $kilo = 0;
        $total_kilos = 0;
        $pza = 0;
        $suma_pzas = 0;
        $bote = 0;
        $fecha = '';


        for ($i = 0; $i < count($data['acabado']); $i++) {
            if ($data['acabado'][$i]['fecha'] != $fecha && $fecha != '') {
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

                $kilo += $data['acabado'][$i]['kilos'];
                $pza += $data['acabado'][$i]['pzas'];
                $bote += $data['acabado'][$i]['bote'];

                $fecha = $data['acabado'][$i]['fecha'];
            } else {

                $fecha = $data['acabado'][$i]['fecha'];
                $kilo += $data['acabado'][$i]['kilos'];
                $pza += $data['acabado'][$i]['pzas'];
                $bote += $data['acabado'][$i]['bote'];

                if (($i + 1) == count($data['acabado'])) {
                    $kilos[] = $kilo;
                    $pzas[] = $pza;
                    $botes[] = $bote;
                    $fechas[] = $fecha;
                    $total_kilos += $kilo;
                    $suma_pzas += $pza;
                    $total_pzas[] = $suma_pzas;
                }
            }
        }

        for ($i = 0; $i < count($fechas); $i++) {
            $fila = '<tr>' .
                '<td class="txt-right">' . $botes[$i] . '</td>' .
                '<td>' . $fechas[$i] . '</td>' .
                '<td class="txt-right">' . $pzas[$i] . '</td>' .
                '<td class="txt-right">' . $total_pzas[$i] . '</td>' .
                '<td class="txt-right">' . $kilos[$i] . '</td>' .
                '</tr>';
            echo $fila;
        }

        for ($i = count($fechas); $i < 11; $i++) {
            echo '<tr>' .
                '<td style="height: 10px;"></td>' .
                '<td style="height: 10px;"></td>' .
                '<td style="height: 10px;"></td>' .
                '<td style="height: 10px;"></td>' .
                '<td style="height: 10px;"></td>' .
                '<tr>';
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