<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte Diario de Producción</title>
    <link rel="stylesheet" href="http://localhost/sistema_fmtor/public/css/formato.css?1.2">
</head>
<body>
    <div class="reporte reporte_diario">
        <div class="encabezado">
            <table>
                <thead>
                    <th colspan="6">REPORTE DIARIO DE PRODUCCIÓN</th>
                </thead>
                <tbody>
                    <tr>
                        <td rowspan="4" colspan="0" class="logo">
                            <div></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Dibujo: 035-10-32</td>
                        <td>Cantidad: 40,000</td>
                        <td colspan="3" class="OP">Orden de Producción: OP10863</td>
                    </tr>
                    <tr>
                        <td>Fecha: 04/08/2021</td>
                        <td colspan="4">Cliente: 296 MULTIELECTRICA</td>
                    </tr>
                    <tr>
                        <td>Descripción:</td>
                        <td>C/FIJ PH</td>
                        <td>10-32X1</td>
                        <td>TROPICALIZADO</td>
                        <td>0</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="seguimiento">
            <?php require_once 'modules_pdf/tabla_diario.php'; ?>
        </div>
    </div>
</body>
</html>