<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>.</title>
    <link rel="stylesheet" href="http://localhost/sistema_fmtor/public/css/formato.css?1.3">
        <style>

        .Mantenimiento {
            color: white;
            background-color: #FF0000;
            text-align: center;
        }
    
        .Falta_de_Alambre {
            background-color: #0000FF;
            text-align: center;
        }
    
        .Ajuste {
            background-color: #CC0099;
            text-align: center;
        }
    
        .Herramental {
            background-color: #00FF00;
            color: black;
            font-weight: 500;
            text-align: center;
        }
    
        .Festivo {
            background-color: #00FFCC;
            color: black;
            font-weight: 500;
            text-align: center;
        }
    
        .Falto_Operador {
            background-color: #666699;
            text-align: center;
        }
    
        .No_se_libero_Tornillo_Laton {
            background-color: #FFC000;
            text-align: center;
        }
    
        .No_hubo_punch {
            background-color: #6B16AA;
            text-align: center;
        }
    
        .Sin_OP {
            background-color: gray;
            text-align: center;
        }
    
        .Ajuste_OTM {
            background-color: #548235;
            text-align: center;
        }
    
        .H_Quebrado {
            background-color: #F4B084;
            text-align: center;
        }
    </style>
</head>
<body>
    <table class="formato">
        <thead>
            <tr>
                <th class="th"></th>
            </tr>
            <tr>
                <th colspan="14">TIPO DE REPORTE: <?php echo strtoupper($_GET['kilos_pzas']); ?></th>
            </tr>
            <tr>
                    <th class="th-estado"  rowspan="2">Día</th>
                    <th class="th-estado"  colspan="9">REPORTE DIARIO POR MAQUINA</th>
                    <th class="th-estado" ></th>
                    <th class="th-estado"  colspan="2">REGISTRO DIARIO DE PRODUCCIÓN</th>
                </tr>
                <tr>
                    <th class="th-estado">1</th>
                    <th class="th-estado">2</th>
                    <th class="th-estado">3</th>
                    <th class="th-estado">4</th>
                    <th class="th-estado">5</th>
                    <th class="th-estado">6</th>
                    <th class="th-estado">7</th>
                    <th class="th-estado">8</th>
                    <th class="th-estado">9</th>
                    <th class="th-estado"></th>
                    <th class="th-estado" colspan="2">FORJADO</th>
            </tr>
        </thead>
        <tbody>
            <?php require_once 'modules_pdf/tabla_maquinas.php';  ?>
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
                    <p>REPORTE DIARIO DE PRODUCCIÓN POR MÁQUINA</p>
                </div>
            </div>
        </div>
    </div>
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