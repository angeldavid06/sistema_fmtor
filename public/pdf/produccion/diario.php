<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>_</title>
    <link rel="stylesheet" href="http://localhost/sistema_fmtor/public/css/formato.css?1.4">
</head>
<body>
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
        <div class="d-grid g-3">
            <div class="d-flex align-content-bottom">
                <p>CLAVE: PRO-F-000</p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>VERSIÓN: 1</p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>FECHA DE APROBACIÓN: </p>
            </div>
        </div>
    </div>
</body>
</html>