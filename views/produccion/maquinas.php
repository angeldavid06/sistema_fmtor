<?php require_once 'public/modules/sesion_depto.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Máquinas de Producción</title>
    <style>

        .Mantenimiento {
            color: white;
            background-color: #FF0000;
            text-align: center;
        }
    
        .Falta_de_Alambre {
            background-color: #0000FF;
            color: white;
            text-align: center;
        }
    
        .Ajuste {
            background-color: #CC0099;
            color: white;
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
            color: white;
            text-align: center;
        }
    
        .No_se_libero_Tornillo_Laton {
            background-color: #FFC000;
            text-align: center;
        }
    
        .No_hubo_punch {
            background-color: #6B16AA;
            color: white;
            text-align: center;
        }
    
        .Sin_OP {
            background-color: gray;
            color: white;
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
    <div class="contenedor">
        <a href="#top" class="btn btn-icon-self material-icons btn-flotante" id="btn-subir">expand_less</a>
        <?php require_once 'public/modules/menus/menu_usuario.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
                <div class="d-grid g2-5-5">
                    <div style="padding-top: 0px;" class="tarjeta-transparente">
                        <h1>Máquinas de Producción</h1>
                    </div>
                    <div style="padding-top: 0px;" class="tarjeta-transparente d-flex justify-right align-content-center flex-wrap">
                        <button class="btn-impresion btn btn-icon btn-transparent" data-impresion="imprimir">
                            <i class="material-icons" data-impresion="imprimir">description</i>
                            Generar Documento
                        </button>
                    </div>
                </div>
                <div class="tarjeta-transparente">
                    <div class="d-grid g-3">
                        <input type="month" name="fecha_reporte" id="fecha_reporte" class="print-hidde">
                        <select name="pzas_kilos" id="pzas_kilos" class="print-hidde">
                            <option value="">Selecciona el tipo de reporte</option>
                            <option value="kilos">Kilos</option>
                            <option value="pzas">Piezas</option>
                        </select>
                        <select name="estado" id="estado" class="print-hidde">
                            <option value="">Selecciona un estado</option>
                            <option value="1">FORJADO</option>
                            <option value="2">RANURADO</option>
                            <option value="3">ROLADO</option>
                            <option value="4">SHANK</option>
                            <option value="6">ACABADO</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../public/js/fmtor_libreria.js"></script>
    <script src="../public/js/produccion/maquinas.js?2.7"></script>
</body>
</html>