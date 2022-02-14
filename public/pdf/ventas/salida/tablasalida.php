<?php

$Salida = " ";
$Id_Clientes_2 = " ";
$Razon_social     = " ";
$Fecha  = " ";
$Cantidad_millares = " ";
$Codigo = " "; 
$Pedido_pza = " ";
$Medida = " ";
$Descripcion       = " ";
$Acabado           = " ";
$Precio_millar     = " ";
$Factura           = " ";
$Dibujo            =" ";
$Material          = " ";
$Id_Folio          = " ";
$Fecha_entrega     = " ";

    for ($i=0; $i < count($data); $i++) { 
        

        $Salida = $data[$i]['Salida'];
        $Id_Clientes_2  = $data[$i]['Id_Clientes_2'];
       
        $Fecha    = $data[$i]['Fecha'];
        $Cantidad_millares = $data[$i]['Cantidad_millares'];
        $Codigo = $data[$i]['Codigo'];
        $Pedido_pza        = $data[$i]['Pedido_pza'];
        $Medida            = $data[$i]['Medida'];
        $Descripcion       = $data[$i]['Descripcion'];
        $Acabado           = $data[$i]['Acabado'];
        $Precio_millar     = $data[$i]['Precio_millar'];
        $Factura           = $data[$i]['Factura'];
        $Dibujo            = $data[$i]['Dibujo'];
        $Material          = $data[$i]['Material'];
        $Id_Folio          = $data[$i]['Id_Folio'];   
        $Fecha_entrega     = $data[$i]['Fecha_entrega'];
        
               

       /*echo '<tr>'.
        
        '<td>'.$data[$i]['Cantidad_millares'].'</td>'.
        '<td>'.$data[$i]['Pedido_pza'].'</td>'.
        '<td>'.$data[$i]['Medida'].'</td>'.
        '<td>'.$data[$i]['Descripcion'].'</td>'.
        '<td>'.$data[$i]['Acabado'].'</td>'.
        '<td>'.$data[$i]['Precio_millar'].'</td>'.
        '<td>'.$data[$i]['Empaque'].'</td>'. 
              
            '</tr>';*/
    }
?>