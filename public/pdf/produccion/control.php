<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Control de Producción</title>
    <link rel="stylesheet" href="http://localhost/sistema_fmtor/public/css/formato.css">
</head>
<body>
    <div class="reporte reporte_producción">
        <div class="encabezado">
            <table>
                <thead>
                    <th colspan="6">CONTROL DE PRODUCCIÓN</th>
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
            <?php require_once 'modules_pdf/v_forjado.php'; ?>
            <?php require_once 'modules_pdf/v_ranurado.php'; ?>
            <?php require_once 'modules_pdf/v_rolado.php'; ?>
            <?php require_once 'modules_pdf/v_shank.php'; ?>
            <?php require_once 'modules_pdf/v_cementado.php'; ?>
            <?php require_once 'modules_pdf/v_acabado.php'; ?>
        </div>
    </div>
</body>
</html>