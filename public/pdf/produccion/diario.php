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
    <!-- <div class="reporte reporte_diario">
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
        <div class="seguimiento"> -->
            <?php 
                // require_once 'modules_pdf/tabla_diario.php'; 
            ?>
        <!-- </div>
    </div> -->
        <table class="formato">
        <thead>
            <tr>
                <th class="th"></th>
            </tr>
            <tr>
                <th colspan="2">Fecha: </th>
                <th colspan="4">Turno: </th>
                <th colspan="4">Departamento: </th>
            </tr>
            <tr>
                <th colspan="10"></th>
            </tr>
            <tr>
                <th>Fecha</th>
                <th>Turno</th>
                <th>Departamento</th>
                <th>O.P.</th>
                <th>CLIENTE</th>
                <th>KILOS</th>
                <th>PIEZAS PRODUCIDAS</th>
                <th>NO. MÁQUINA</th>
                <th>DESCRIPCIÓN</th>
                <th>OBSERVACIONES</th>
            </tr>
        </thead>
        <tbody>
            <?php require_once 'modules_pdf/tabla_diario.php';  ?>
        </tbody>
        <tfoot>
            <tr>
                <td class="td"></td>
            </tr>
        </tfoot>
    </table>
    <div class="header">
        <div class="d-grid g-2">
            <div class="logo-formato">
                <img src="http://localhost/sistema_fmtor/public/img/logo_formato.png" alt="">
            </div>
            <div class="d-flex flex-wrap justify-right">
                <div class="titulo txt-right">
                    <p>FORJADORA MEXICANA DE TORNILLOS</p>
                    <span>S.A. DE C.V.</span>
                </div>
                <div class="nombre txt-right">
                    <p>REPORTE DIARIO DE PRODUCCIÓN</p>
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