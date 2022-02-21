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
            <tr>
                <th><?php echo  $data[0]['Id_Folio']; ?></th>
                <th>
                    Fecha: <?php echo  $data[0]['Fecha']; ?>
                </th>
                <th>
                    Cliente: <?php echo $data[0]['Id_Clientes_2']; ?>
                </th>
            </tr>
            <tr>
                <th colspan="11" style="background-color: rgb(144, 202, 249);">
                    <h2>SALIDA DE ALMACÉN DE PRODUCTO TERMINADO</h2>
                </th>
            </tr>
            <tr style="background-color: rgb(144, 202, 249);">
                <th>Cantidad</th>
                <th>Parte</th>
                <th>Pedido</th>
                <th>Medida</th>
                <th>Descripcion</th>
                <th>Acabado</th>
                <th>Costo</th>
                <th>Factura</th>
                <th>Empaque</th>
                <th>No.Plano</th>
                <th>Material</th>
            </tr>
        </thead>
        <tbody>
            <?php require_once 'salida/tablasalida.php' ?>
            <tr>
                <td style="border: none;" colspan="4"></td>
                <td style="border: none;" colspan="4"></td>
                <td style="border: none;" colspan="3"></td>
            </tr>
            <tr>
                <td style="border: none;" colspan="4"></td>
                <td style="border: none;" colspan="4"></td>
                <td style="border: none;" colspan="3"></td>
            </tr>
            <tr>
                <td style="border: none;" colspan="4"></td>
                <td style="border: none;" colspan="4"></td>
                <td style="border: none;" colspan="3"></td>
            </tr>
            <tr>
                <td class="txt-center" colspan="4">AUTORIZADO POR </td>
                <td class="txt-center" colspan="4">DESPACHADO POR </td>
                <td class="txt-center" colspan="3">RECIBIDO POR </td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td class="td"></td>
            </tr>
        </tfoot>
    </table>
    <table style="width: 100%">
        <caption></caption>
        <thead>

        </thead>
        <tbody style="min-height:50%;max-height:50%;">
            <!-- <tr>
                <th colspan="2"><b>
                        <h3><?php echo $Cantidad_millares ?></h3>
                    </b></th>
                <th colspan="2"><b>
                        <h3><?php echo $Codigo ?></h3>
                    </b></th>
                <th colspan="2"><b>
                        <h3><?php echo $Pedido_pza ?></h3>
                    </b></th>
                <th colspan="2"><b>
                        <h3><?php echo $Medida ?></h3>
                    </b></th>
                <th colspan="2"><b>
                        <h3><?php echo $Descripcion ?></h3>
                    </b></th>
                <th colspan="2"><b>
                        <h3><?php echo $Acabado ?></h3>
                    </b></th>
                <th colspan="2"><?php echo $Precio_millar ?></th>
                <th colspan="2"><?php echo $Factura ?></th>
                <th colspan="2"></th>
                <th colspan="2"><?php echo $Dibujo ?></th>
                <th colspan="2"><?php echo $Material ?></th>
            </tr> -->

        </tbody>
        <tfoot>

        </tfoot>
    </table>
    <br>
    <br>
    <br>
    <!-- <div class="nombre txt-left">
        <p>
        <h3>Fecha Entrega: <?php echo $Fecha_entrega; ?></p>
            <p>
            <h3>OP: <?php echo $Id_Folio; ?></p>
    </div>
 -->
    <div class="header">
        <div class="d-grid g-2">
            <div class="logo-formato">
                <img src="https://www.fmtor.com/public/img/logo_formato.png" alt="">
            </div>
            <div class="d-flex flex-wrap justify-right">
                <div class="titulo txt-right">
                    <p>FORJADORA MEXICANA DE TORNILLOS</p>
                    <span>S.A. DE C.V.</span>
                </div>
                <div class="nombre txt-right">
                    <p>SALIDA DE ALMACÉN</p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="d-grid g-4">
            <div class="d-flex align-content-bottom">
                <p>Clave: </p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>Versión: </p>
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