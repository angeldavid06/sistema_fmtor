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
        <br>
        <br>

        <body>
    </table>
    <table border="1" style="width: 100%">
        <caption></caption>
        <colgroup>
            <col style="min-width: 20%; max-width:30%;">
            <col style="min-width: 40%; max-width:30%;">
            <col style="min-width: 40%; max-width:30%;">
        </colgroup>

        <?php require_once 'orden/tablaorden.php' ?>
        <thead>
            <tr>
                <th colspan="14" style="background-color: rgb(204, 209, 209 );">
                    <h2>ORDEN DE PRODUCCION
                </th>
            </tr>
            <tr>
                <th style="min-width:30%;max-width:30%;"><b>
                        <h3>Folio
                    </b></th>
                <th style="min-width:30%;max-width:30%;"><b>
                        <h3>Cliente
                    </b></th>
                <th style="min-width:30%;max-width:30%;"><b>
                        <h3>Precio
                    </b></th>
                <th style="min-width:30%;max-width:30%;"><b>
                        <h3>Fecha
                    </b></th>
                <th style="min-width:30%;max-width:30%;"><b>
                        <h3>Descripcion
                    </b></th>
                <th style="min-width:30%;max-width:30%;"><b>
                        <h3>Medida
                    </b></th>
                <th style="min-width:30%;max-width:30%;"><b>
                        <h3>Cantidad
                    </b></th>
                <th style="min-width:30%;max-width:30%;"><b>
                        <h3>Acabado
                    </b></th>
                <th style="min-width:30%;max-width:30%;"><b>
                        <h3>Codigo
                    </b></th>
                <th style="background-color: rgb(130,224,170);"><b>
                        <h3>Tratamiento
                    </b></th>
                <th style="background-color: rgb(41, 128, 185);"><b>
                        <h3>Fecha de entrega
                    </b></th>
                <th style="background-color: rgb(255, 255, 0);"><b>
                        <h3>Dibujo
                    </b></th>
                <th style="min-width:30%;max-width:30%;"><b>
                        <h3>Salida
                    </b></th>
        </thead>
        <tbody style="min-height:100%;max-height:100%;">
            <tr>
                <th style="min-width:30%;max-width:30%;"><?php echo $Id_Folio; ?> </th>
                <th style="min-width:30%;max-width:30%;"><?php echo $Id_Clientes_2 ?> </th>
                <th style="min-width:30%;max-width:30%;"><?php echo $Precio_millar ?> </th>
                <th style="min-width:30%;max-width:30%;"><?php echo $Fecha ?> </th>
                <th style="min-width:30%;max-width:30%;"><?php echo $Descripcion ?> </th>
                <th style="min-width:30%;max-width:30%;"><?php echo $Medida ?> </th>
                <th style="min-width:30%;max-width:30%;"><?php echo $Cantidad_millares ?> </th>
                <th style="min-width:30%;max-width:30%;"><?php echo $Acabado ?> </th>
                <th style="min-width:30%;max-width:30%;"><?php echo $Codigo ?> </th>
                <th style="background-color: rgb(130,224,170);"><?php echo $Tratamiento ?> </th>
                <th style="background-color: rgb(41, 128, 185);"><?php echo $Fecha_entrega ?> </th>
                <th style="background-color: rgb(255, 255, 0);"><?php echo $Dibujo ?> </th>
                <th style="min-width:30%;max-width:30%;"><?php echo $Salida ?> </th>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="6"> <br>AUTORIZADO POR</th>
                <th colspan="8"> <br>AGENTE</th>
            </tr>

        </tfoot>
    </table>
    <br>
    <br>
    <br>
    <br>
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
                    <p>ORDEN DE PRODUCCION<br> </p>
                </div>

            </div>
        </div>
    </div>
    <div class="footer">
        <div class="d-grid g-4">
            <div class="d-flex align-content-bottom">
                <p>Clave:FOR-VEN-05</p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>Versión:0</p>
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