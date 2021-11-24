<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Control de Producción</title>
    <link rel="stylesheet" href="http://localhost/sistema_fmtor/public/css/formato.css?1.2">
</head>
<body>
    <div class="reporte ">
        <div class="encabezado">
            <table>
                <thead>
                    <th >ORDENES DE PRODUCCIÓN</th>
                </thead>
            </table>
        </div>
        <div class="seguimiento">
            <?php require_once 'modules_pdf/tabla_ordenes.php'; ?>
        </div>
    </div>
</body>
</html>