<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="style=devmin-width:ice;max-width:30%-style, inmin-width:iti;max-width:30%al-scale=1.0">
    <title>.</title>
    <link rel="stylesheet" href="https://www.fmtor.com/public/css/formato.css?1.3">
</head>

<body>

    <table class="formato">
        <thead>
            <tr>
                <th class="th"></th>
            </tr>
        </thead>

        <body>
    </table>

    <table border="1" style="width: 100%">
        <?php require_once 'tarjeta/tablatarjeta.php' ?>
        <thead>
            <tr>
                <th colspan="2" style="background-color: rgb(204, 209, 209 );">OP:<br> <?php echo  $Id_Folio; ?> </th>
                <th>FACT MP <br> " " </th>
                <th> MATERIAL: <br> <?php echo  $Codigo; ?></th>
                <th colspan="2">No.Parte <br> <?php echo  $Codigo; ?></th>
                <th colspan="2" style="background-color: rgb(130,224,170);">
                    <h3>T/Termico: <br> <?php echo  $Tratamiento; ?>
                </th>
                <th colspan="2">
                    <h3>Bote: <br> <?php echo  $Bote; ?>
                </th>
            </tr>
        </thead>
        <tbody style="min-height:100%;max-height:100%;">
            <tr>

                <th colspan="7">
                    <h3> Descripcion <?php echo  $Descripcion; ?> <?php echo  $Medida; ?> <?php echo  $Acabado; ?>
                </th>
                <th colspan="2" style="background-color: rgb(255, 255, 0);">
                    <h3> Dibujo: <br> <?php echo  $Dibujo; ?> </td>

            </tr>
            <tr>

                <th colspan="4">
                    <h3>Cliente: <p> <?php echo  $Id_Clientes_2; ?>
                </th>
                <th colspan="3">
                    <h3>Salida: <p> <?php echo  $Salida; ?></td>
                <th colspan="2"> Fecha <br><?php echo  $Fecha; ?> </td>

            </tr>
        </tbody>

        <tbody style="min-height:100%;max-height:100%;">
            <tr>
                <td colspan="2">
                    <h3>PZAS <br>
                </td>
                <td>
                    <h3>FORJADO <br>
                </td>
                <td colspan="2">
                    <h3>TURNO <br>
                </td>
                <td colspan="2">
                    <h3>PZAS
                </td>
                <td>
                    <h3>CEMENTADO <br>
                </td>
                <td>
                    <h3>TURNO <br>
                </td>

            </tr>
            <tr>
                <td colspan="2">
                    <h3>KG
                </td>
                <td style="background-color: rgb(218, 247, 166);">
                    <h3>FECHA: <br> MAQUINA:
                </td>
                <td colspan="2" style="background-color: rgb(218, 247, 166);">
                    <h3>FACTOR: <br> AUTORIZO:
                </td>
                <td colspan="2">
                    <h3>KG
                </td>
                <td style="background-color: rgb(218, 247, 166);">
                    <h3>FECHA: <br> MAQUINA:
                </td>
                <td colspan="2" style="background-color: rgb(218, 247, 166);">
                    <h3>FACTOR: <br> AUTORIZO:
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <h3>PZAS
                </td>
                <td>
                    <h3>RANURADO <br>
                </td>
                <td colspan="2">
                    <h3>TURNO <br>
                </td>
                <td colspan="2">
                    <h3>PZAS
                </td>
                <td>
                    <h3>ACABADO <br>
                </td>
                <td>
                    <h3>TURNO <br>
                </td>

            </tr>
            <tr>
                <td colspan="2">
                    <h3>KG
                </td>
                <td style="background-color: rgb(218, 247, 166);">
                    <h3>FECHA: <br> MAQUINA:
                </td>
                <td colspan="2" style="background-color: rgb(218, 247, 166);">
                    <h3>FACTOR: <br> AUTORIZO:
                </td>
                <td colspan="2">
                    <h3>KG
                </td>
                <td style="background-color: rgb(218, 247, 166);">
                    <h3>FECHA: <br> MAQUINA:
                </td>
                <td colspan="2" style="background-color: rgb(218, 247, 166);">
                    <h3>FACTOR: <br> AUTORIZO:
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <h3> PZAS
                </td>
                <td>
                    <h3>ROLADO <br>
                </td>
                <td colspan="2">
                    <h3>TURNO <br>
                </td>
                <td colspan="2">
                    <h3>PZAS
                </td>
                <td colspan="2">
                    <h3>ALMACEN <br>
                </td>


            </tr>
            <tr>
                <td colspan="2">
                    <h3>KG
                </td>
                <td style="background-color: rgb(218, 247, 166);">
                    <h3>FECHA: <br> MAQUINA:
                </td>
                <td colspan="2" style="background-color: rgb(218, 247, 166);">
                    <h3>FACTOR: <br> AUTORIZO:
                </td>
                <td colspan="2">
                    <h3>KG
                </td>
                <td colspan="2" style="background-color: rgb(218, 247, 166);">
                    <h3>FECHA: <br> FACTOR:
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <h3>PZAS
                </td>
                <td colspan="3">
                    <h3>SHANK <br>
                </td>
                <td colspan="2">
                    <h3>TURNO <br>
                </td>
                <th>CONTROL DE CALIDAD</td>
                <th>TOTAL A PRODUCIR </td>



            </tr>
            <tr>
                <td colspan="2">
                    <h3>KG
                </td>
                <td colspan="3" style="background-color: rgb(218, 247, 166);">
                    <h3>FECHA: <br> MAQUINA:
                </td>
                <td colspan="2" style="background-color: rgb(218, 247, 166);">
                    <h3>FACTOR: <br> AUTORIZO:
                </td>
                <th>
                    </td>
                <th style="background-color: rgb(41, 128, 185);"> <?php echo  $Cantidad_millares; ?></td>
            </tr>
        </tbody>

    </table>
    <br>
    <br>

    <table border="1" style="width: 100%">
        <tbody style="min-height:100%;max-height:100%;">

            <tr>

                <th style="background-color: rgb(204, 209, 209 );"> </th>
                <th colspan="4" style="background-color: rgb(204, 209, 209 );">FORJADO</th>
                <th colspan="2" style="background-color: rgb(204, 209, 209 );">ROLADO</th>
                <th colspan="2" style="background-color: rgb(204, 209, 209 );">RANURADO</th>
            </tr>

            <tr>
                <td>
                    <h3>HORA <br>
                </td>
                <td>
                    <h5>LONG DE VASTAGO <br>
                </td>
                <td>
                    <h5>DIAM VASTAGO <br>
                </td>
                <td>
                    <h5>ALTURA DE CABEZA <br>
                </td>
                <td>
                    <h5>DIAMETRO DE CABEZA <br>
                </td>
                <td>
                    <h5>LONG CUERDA <br>
                </td>
                <td>
                    <h5>CUERDA <br>
                </td>
                <td>
                    <h5>RANURA <br>
                </td>
                <td>
                    <h5>ANCHO DE RANURA <br>
                </td>
            </tr>

            <tr>
                <td>
                    <h5>7:00AM-7:30AM <br>
                </td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
            </tr>

            <tr>
                <td>
                    <h5>7:30AM-8:00AM
                </td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
            </tr>


            <tr>
                <td>
                    <h5>8:00AM-8:30AM
                </td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
            </tr>

            <tr>
                <td>
                    <h5>8:30AM-9:00AM
                </td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
            </tr>
            <tr>
                <td>
                    <h5>9:00AM-9:30AM
                </td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
            </tr>
            <tr>
                <td>
                    <h5>9:30AM-10:00AM
                </td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
            </tr>
            <tr>
                <td>
                    <h5>10:00AM-10:30AM
                </td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
            </tr>
            <tr>
                <td>
                    <h5>10:30AM-11:00AM
                </td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
            </tr>
            <tr>
                <td>
                    <h5>11:00AM-11:30AM
                </td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
            </tr>
            <tr>
                <td>
                    <h5>11:30AM-12:00PM
                </td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
            </tr>
            <tr>
                <td>
                    <h5>12:00PM-12:30PM
                </td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
            </tr>
            <tr>
                <td>
                    <h5>12:30PM-1:00PM
                </td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
            </tr>
            <tr>
                <td>
                    <h5>1:00PM-1:30PM
                </td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
            </tr>
            <tr>
                <td>
                    <h5>1:30PM-2:00PM
                </td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
            </tr>
            <tr>
                <td>
                    <h5>2:30PM-3:00PM
                </td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
            </tr>
            <tr>
                <td>
                    <h5>2:30PM-3:00PM
                </td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
            </tr>

            <tr>
                <td>
                    <h5>3:00PM-3:30PM
                </td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
            </tr>
            <tr>
                <td>
                    <h5>:30PM-4:00PM
                </td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
            </tr>
            <tr>
                <td>
                    <h5>4:00PM-4:30PM
                </td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
                <td>1°</td>
            </tr>

            <tr>
                <td>
                    <h5>4:30PM-5:00PM
                </td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
                <td>2°</td>
            </tr>
        </tbody>
    </table>

    <table border="1" style="width: 190%; height:200%">



    </table>






    <div class="header">
        <div class="d-grid g-2">
            <div class="logo-formato">
                <img src="https://www.fmtor.com/public/img/logo_formato.png" alt="">
            </div>
            <div class="d-flex flex-wrap justify-right">
                <div class="titulo txt-right">
                    <p>FORJADORA MEXICANA DE TORNILLOS</p>
                    <span>S.A. DE C.V. <br></span>
                </div>
                <div class="nombre txt-right">
                    <p>Tarjeta de Flujo<br> </p>
                </div>

            </div>
        </div>
    </div>
    <div class="footer">
        <div class="d-grid g-4">
            <div class="d-flex align-content-bottom">
                <p>Clave: FOR-VEN-06 </p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>Versión: 0 </p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>Fecha de validación: </p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>Página: </p>
            </div>
        </div>
    </div>
</body>

</html>