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
        color: black;
    }
</style>
<body>
    <table class="formato">
        <thead>
            <tr>
                <th class="th"></th>
            </tr>
            <tr>
                <th class="th-estado" style="padding: 10px 0px; ">CAL.</th>
                <th class="th-estado" style="padding: 10px 0px; ">Kg.</th>
                <th class="th-estado" style="padding: 10px 0px; ">Factor</th>
                <th class="th-estado" style="padding: 10px 0px; ">N° O.P.</th>
                <th class="th-estado" style="padding: 10px 0px; min-width: 80px;">Fecha de O.P.</th>
                <th class="th-estado" style="padding: 10px 0px; min-width: 60px;">Cliente</th>
                <th class="th-estado" style="padding: 10px 0px;  min-width: 80px;">Medida</th>
                <th class="th-estado" style="padding: 10px 0px; min-width: 120px;">Descripción</th>
                <th class="th-estado" style="padding: 10px 0px; min-width: 80px;">Acabado</th>
                <th class="th-estado" style="padding: 10px 0px; ">Cant.</th>
                <th class="th-estado" style="padding: 10px 0px; min-width: 60px;">Precio</th>
                <th class="th-estado" style="padding: 10px 0px; min-width: 80px;">Fecha<br>Entrega</th>
                <th class="th-estado" style="padding: 10px 0px; ">Herramental</th>
                <th class="th-estado" style="padding: 10px 0px; min-width: 120px;">Tratamiento</th>
                <th class="th-estado" style="padding: 10px 0px; "></th>
            </tr>
        </thead>
        <tbody>
            <?php require_once 'modules_pdf/tabla_programa_forjado.php';  ?>
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
                <p>VERSIÓN: 2</p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>FECHA DE APROBACIÓN: </p>
            </div>
        </div>
    </div>
</body>
</html>