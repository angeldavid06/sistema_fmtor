<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte Diario de Producción</title>
    <link rel="stylesheet" href="http://localhost/sistema_fmtor/public/css/formato.css?1.3">
</head>
<body>
    <table class="formato">
        <thead>
            <tr>
                <th colspan="13" class="th"></th>
            </tr>
            <tr>
                <th class="th-normal">Fecha</th>
                <th class="th-normal">Turno</th>
                <th class="th-normal">Departamento</th>
                <th class="th-normal">O.P.</th>
                <th class="th-normal">CLIENTE</th>
                <th class="th-normal">KILOS</th>
                <th class="th-normal">PIEZAS PRODUCIDAS</th>
                <th class="th-normal">NO. MÁQUINA</th>
                <th class="th-normal">DESCRIPCIÓN</th>
                <th class="th-normal">OBSERVACIONES</th>
            </tr>
        </thead>
        <tbody class="informacion">
            <?php 
                require_once 'modules_pdf/tabla_diario.php'; 
            ?>
        </tbody>
        <tfoot>
            <td class="tf"></td>
        </tfoot>
    </table>
    <div class="header">
        <table>
            <thead>
                <tr class="d-flex justify-between">
                    <th class="d-flex align-content-top justify-left" width="270px">
                        <img width="270px" src="http://localhost/sistema_fmtor/public/img/logo_formato.png" alt="" srcset="">
                    </th>
                    <th class="d-flex align-content-center flex-wrap justify-right txt-right">
                        <div class="empresa">
                            <p>FORJADORA MEXICANADA DE TORNILLOS</p>
                            <span>S.A. DE C.V.</span>
                        </div>
                        <div class="titulo">
                            <p>REGISTRO DIARIO DE PRODUCCIÓN</p>
                        </div>
                    </th>
                </tr>
            </thead>
        </table>
    </div>
    <div class="footer">
        <div class="d-grid g-4">
            <div class="pie">
                <p>Código: PRO-F-000</p>
            </div>
            <div class="pie">
                <p>Vesión: </p>
            </div>
            <div class="pie">
                <p>Fecha de Aprobación: 00-00-0000</p>
            </div>
            <div class="pie">
                <p>Página: 1 - 1</p>
            </div>
        </div>
    </div>
</body>
</html>