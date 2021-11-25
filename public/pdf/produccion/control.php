<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Control de Producción</title>
    <link rel="stylesheet" href="http://localhost/sistema_fmtor/public/css/formato.css?1.3">
</head>
<body>
    <!-- <div class="reporte reporte_producción">
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
        <div class="seguimiento"> -->
            <?php 
                // require_once 'modules_pdf/v_forjado.php'; 
                // require_once 'modules_pdf/v_ranurado.php'; 
                // require_once 'modules_pdf/v_rolado.php'; 
                // require_once 'modules_pdf/v_shank.php' ;
                // require_once 'modules_pdf/v_cementado.php'; 
                // require_once 'modules_pdf/v_acabado.php'; 
            ?>
        <!-- </div>
    </div> -->
    <table class="formato">
        <thead>
            <tr>
                <th class="th"></th>
            </tr>
            <tr>
                <th>Dibujo: 035-10-32</th>
                <th>Cantidad: 40,000</th>
                <th class="OP">Orden de Producción: OP10863</th>
            </tr>
            <tr>
                <th>Fecha: 04/08/2021</th>
                <th>Cliente: 296 MULTIELECTRICA</th>
                <th>Descripción: C/FIJ PH 10-32X1</th>
            </tr>
            <tr>
                <th colspan="3">TROPICALIZADO   0</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="td-sn-pd"><?php require_once 'modules_pdf/v_forjado.php'; ?></td>
                <td class="td-sn-pd"><?php require_once 'modules_pdf/v_ranurado.php';  ?></td>
                <td class="td-sn-pd"><?php require_once 'modules_pdf/v_rolado.php';  ?></td>
            </tr>
            <tr>
                <td class="td-sn-pd"><?php require_once 'modules_pdf/v_shank.php' ; ?></td>
                <td class="td-sn-pd"><?php require_once 'modules_pdf/v_cementado.php'; ?></td>
                <td class="td-sn-pd"><?php require_once 'modules_pdf/v_acabado.php';  ?></td>
            </tr>
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
                    <p>CONTROL DE PRODUCCIÓN</p>
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