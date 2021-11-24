<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Control de Producción</title>
    <link rel="stylesheet" href="http://localhost/sistema_fmtor/public/css/formato.css?1.3">
    <link rel="stylesheet" href="https://use.typekit.net/oov2wcw.css">
</head>
<body>
    <!-- <div class="reporte ">
        <div class="encabezado">
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
                                <p>ORDENES DE PRODUCCIÓN</p>
                            </div>
                        </th>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="seguimiento"> -->
            <?php 
                // require_once 'modules_pdf/tabla_ordenes.php'; 
            ?>
        <!-- </div>
    </div>
    <footer>
        <h1>Hola</h1>
    </footer> -->
    <table class="formato">
        <thead>
            <tr>
                <th colspan="13" class="th"></th>
            </tr>
            <tr>
                <th class="th-normal">CAL.</th>
                <th class="th-normal">Kg.</th>
                <th class="th-normal">Factor</th>
                <th class="th-normal">N° O.P.</th>
                <th class="th-normal">Fecha de O.P.</th>
                <th class="th-normal">Cliente</th>
                <th class="th-normal">Descripción</th>
                <th class="th-normal">Acabado</th>
                <th class="th-normal">Cant</th>
                <th class="th-normal">Precio</th>
                <th class="th-normal">Total</th>
                <th class="th-normal">Acumulado</th>
                <th class="th-normal">Estado</th>
            </tr>
        </thead>
        <tbody class="informacion">
            <?php 
                require_once 'modules_pdf/tabla_ordenes.php'; 
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
                            <p>ORDENES DE PRODUCCIÓN</p>
                        </div>
                    </th>
                </tr>
            </thead>
        </table>
    </div>
    <div class="footer">
        <div class="d-grid g-4">
            <div class="pie">
                <p>Código:</p>
            </div>
            <div class="pie">
                <p>Vesión:</p>
            </div>
            <div class="pie">
                <p>Fecha de Aprobación:</p>
            </div>
            <div class="pie">
                <p>Página:</p>
            </div>
        </div>
    </div>
</body>
</html>