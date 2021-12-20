<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>.</title>
    <link rel="stylesheet" href="http://localhost/sistema_fmtor/public/css/formato.css?1.3">
</head>
<body>
    <table class="formato">
        <thead>
            <tr>
                <th class="th"></th>
            </tr>
        </thead>
        <tbody>
            <?php require_once 'modules_pdf/tabla_estado.php'; ?>
        </tbody>
        <tfoot>
            <tr>
                <td class="td"></td>
            </tr>
        </tfoot>
    </table>
    <!-- <div class="header">
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
                    <p>ESTADO DE LAS ORDENES DE PRODUCCIÓN</p>
                </div>
            </div>
        </div>
    </div> -->
    <div class="footer">
        <div class="d-grid g-3">
            <div class="d-flex align-content-bottom">
                <p>Clave: </p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>Versión: </p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>Fecha de validación: </p>
            </div>
        </div>
    </div>
</body>
</html>