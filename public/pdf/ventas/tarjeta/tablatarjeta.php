<?php
$Id_Folio= " ";
$Codigo = " "; 
$Tratamiento = " ";
$Descripcion  = " ";
$Medida = " ";
$Bote = " ";
$Acabado = " ";
$Dibujo  = " ";
$Id_Clientes_2 = " ";
$Salida = " "; 
$Fecha  = " ";
$Cantidad_millares= " ";


    for ($i=0; $i < count($data); $i++) { 
         
        $Id_Folio = $data[$i]['Id_Folio'];
        $Codigo = $data[$i]['Codigo'];
        // $Tratamiento    = $data[$i]['Tratamiento'];
        $Descripcion    = $data[$i]['Descripcion'];
        $Medida         = $data[$i]['Medida'];
        $Acabado = $data[$i]['Acabado'];
        // $Dibujo         = $data[$i]['Dibujo'];
        // $Bote         = $data[$i]['Bote'];
        $Id_Clientes_2  = $data[$i]['Id_Clientes_2'];
        // $Salida         = $data[$i]['Id_Folio'];  
        $Fecha          = $data[$i]['Fecha'];
        $Cantidad_millares = $data[$i]['Cantidad_millares'];
    }
?>