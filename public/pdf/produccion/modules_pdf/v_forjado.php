<table>
                <thead>
                    <tr>
                        <th colspan="5">FORJADO</th>
                    </tr>
                    <tr>
                        <th>Botes</th>
                        <th>Fecha</th>
                        <th>Pzas.</th>
                        <th>Pzas. Acumuladas</th>
                        <th>K.g.</th>
                    </tr>
                </thead>
                <tbody id="v_forjado">
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
                        
                        for ($i=0; $i < count($data['forjado']); $i++) {
                            if ($data['forjado'][$i]['fecha'] != $fecha && $fecha != '') {
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
                                
                                $kilo += $data['forjado'][$i]['kilos'];
                                $pza += $data['forjado'][$i]['pzas'];
                                $bote += $data['forjado'][$i]['botes'];

                                $fecha = $data['forjado'][$i]['fecha'];
                            } else {
                                $fecha = $data['forjado'][$i]['fecha'];
                                $kilo += $data['forjado'][$i]['kilos'];
                                $pza += $data['forjado'][$i]['pzas'];
                                $bote += $data['forjado'][$i]['botes'];

                                if (($i+1) == count($data['forjado'])) {
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


                        // while ($venta = $consultas->fetch_object()):
                        for ($i=0; $i < count($fechas); $i++) {
                            $fila = '<tr>'.
                                        '<td>'.$botes[$i].'</td>'.
                                        '<td>'.$fechas[$i].'</td>'.
                                        '<td>'.$pzas[$i].'</td>'.
                                        '<td>'.$total_pzas[$i].'</td>'.
                                        '<td>'.$kilos[$i].'</td>'.
                                    '</tr>';
                            echo $fila;
                        }
                        // while ($forjado = $data->fetch_object()) {
                        // }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4">Total:</td>
                        <td><?php echo $total_kilos; ?></td>
                    </tr>
                </tfoot>
            </table>