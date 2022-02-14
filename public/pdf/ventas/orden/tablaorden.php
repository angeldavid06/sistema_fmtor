<?php

$Id_Folio = ""; 
$Id_Clientes_2 = " ";
$Precio_millar     = " ";
$Fecha  = " ";
$Descripcion       = " ";
$Medida = " ";
$Cantidad_millares = " ";
$Acabado           = " ";
$Codigo = " ";
$Tratamiento= " ";
$Fecha_entrega     = " ";
$Dibujo = " ";
$Salida=" ";


    for ($i=0; $i < count($data); $i++) { 

        $Id_Folio = $data[$i]['Id_Folio'];
        $Id_Clientes_2  = $data[$i]['Id_Clientes_2'];
        $Precio_millar     = $data[$i]['Precio_millar'];
        $Fecha             = $data[$i]['Fecha'];
        $Descripcion       = $data[$i]['Descripcion'];
        $Medida            = $data[$i]['Medida'];
        $Cantidad_millares = $data[$i]['Cantidad_millares'];
        $Acabado           = $data[$i]['Acabado'];
        $Codigo            = $data[$i]['Codigo'];
        $Tratamiento       = $data[$i]['Tratamiento'];
        $Fecha_entrega     = $data[$i]['Fecha_entrega'];
        $Dibujo = $data[$i]['Dibujo'];
        $Salida           = $data[$i]['Salida'];
       /*echo '<tr>'.
        
        '<td>'.$data[$i]['Cantidad_millares'].'</td>'.
        '<td>'.$data[$i]['Pedido_pza'].'</td>'.
        '<td>'.$data[$i]['Medida'].'</td>'.
        '<td>'.$data[$i]['Descripcion'].'</td>'.
        '<td>'.$data[$i]['Acabado'].'</td>'.
        '<td>'.$data[$i]['Precio_millar'].'</td>'.
        '<td>'.$data[$i]['Salida'].'</td>'. 
              
            '</tr>';*/
    }
?>