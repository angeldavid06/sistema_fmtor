<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>.</title>
    <link rel="stylesheet" href="http://localhost/sistema_fmtor/public/css/formato.css?1.4">
</head>
<style>
    .herramental {
        background: #F20505;
        color: white;
    }
    .herramental td {
        color: white;
    }
    .mantenimiento {
        background: #F20505;
        color: white;
    }
    .mantenimiento td {
        color: white;
    }
    .linea {
        background: #FFFF00;
        color: black;
    }
    .linea td {
        color: black;
    }
    .maquina {
        background: #AA9BBF; 
        color: white;
    }
    .maquina td {
        color: white;
    }
</style>
<body>
    <table class="formato">
        <thead>
            <tr>
                <th class="th"></th>
            </tr>
        </thead>
        <tbody>
            <td style="border: none;" >
                <?php require_once 'modules_pdf/tabla_programa_forjado.php';  ?>
            </td>
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
                    <p>PROGRAMA DE FORJADO</p>
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