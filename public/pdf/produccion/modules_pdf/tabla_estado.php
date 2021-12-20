<?php

    $meses = array();
    $cantidad_de_dias = array();
    $rango_semanas = array();
    $aux_semanas = array();
    $mes = '';
    $fecha = '';

    if (count($data) > 0) {
        $fecha_hora = explode(' ',$data[0]['Fecha']);
        $fecha = explode('-',$fecha_hora[0]);
        if (($fecha[1]-1) < 1) {
            $meses[] = [$fecha[0]-1,12];
            $cantidad_de_dias[] = date('t', strtotime(($fecha[0]-1).'-'.'12-1'));
        } else {
            $meses[] = [$fecha[0],($fecha[1]-1)];
            $cantidad_de_dias[] = date('t', strtotime(($fecha[0]).'-'.($fecha[1]-1).'-1'));
        }
    }
    
    for ($i=0; $i < count($data); $i++) {
        $fecha = explode(' ',$data[$i]['Fecha']);
        if (explode('-',$fecha[0])[1] != $mes) {
            $meses[] = [explode('-',$fecha[0])[0],explode('-',$fecha[0])[1]];
            $cantidad_de_dias[] = date('t', strtotime($fecha[0]));
            $mes = explode('-',$fecha[0])[1];
        }
    }
    
    if (count($data) > 0) {
        $fecha_hora = explode(' ',$data[count($data)-1]['Fecha']);
        $fecha = explode('-',$fecha_hora[0]);
        if (($fecha[1]+1) > 12) {
            $meses[] = [$fecha[0]+1,1];
            $cantidad_de_dias[] = date('t', strtotime(($fecha[0]+1).'-'.'1-1'));
        } else {
            $meses[] = [$fecha[0],$fecha[1]+1];
            $cantidad_de_dias[] = date('t', strtotime(($fecha[0]).'-'.($fecha[1]+1).'-1'));
        }
    }

    // echo '<pre>';
    //     var_dump($cantidad_de_dias);
    // echo '</pre>';
    // echo '<pre>';
    //     var_dump($meses);
    // echo '</pre>';
    
    for ($i=0; $i < count($cantidad_de_dias); $i++) {
        for ($j=1; $j <= $cantidad_de_dias[$i]; $j++) { 
            $dia = date('l', strtotime($meses[$i][0].'-'.$meses[$i][1].'-'.$j));
            if (($i == 0 && $j == 1) || $dia == 'Saturday') {
                $aux_semanas[] = $meses[$i][0].'-'.$meses[$i][1].'-'.$j;
            }
            
            if ($dia == 'Sunday') {
                $rango_semanas[] = $aux_semanas;
                $aux_semanas = array();
                $aux_semanas[] = $meses[$i][0].'-'.$meses[$i][1].'-'.$j;
            }
        }
    }

    // echo '<pre>';
    //     var_dump($rango_semanas);
    // echo '</pre>';

    if (('2021-11-05' >= '2021-10-28') && ('2021-11-05' <= '2021-11-10')) {
        echo 'Hola';
    } else {
        echo ' Mal';
    }

    // for ($i=0; $i < count($data); $i++) { 
    //     for ($j=0; $j < count($rango_semanas); $j++) { 
    //         $fecha_hora = explode(' ',$data[$i]['Fecha']);
    //         $fecha = explode('-',$fecha_hora[0]);
    //         if ($fecha[2] < 10) {
    //             $fecha[2] = intval($fecha[2]);
    //         } 

    //         if (($rango_semanas[$j][0] <= $fecha[0].'-'.$fecha[1].'-'.$fecha[2]) && ($rango_semanas[$j][1] >= $fecha[0].'-'.$fecha[1].'-'.$fecha[2])) {
    //             echo '<tr><td>'.$fecha[2].'</td><td>'.$fecha[0].'-'.$fecha[1].'-'.$fecha[2].'</td><td>'.$rango_semanas[$j][0].'</td><td>'.$rango_semanas[$j][1].'<td></tr>';
    //             $j = count($rango_semanas);
    //         }
    //     }
    // }
?>