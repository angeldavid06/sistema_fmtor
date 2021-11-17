<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Página Principal</title>
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
    <div class="contenedor">
        <a href="#top" class="btn btn-icon btn-flotante" id="btn-subir">
            <i class="material-icons">expand_less</i> 
            Subir
        </a>
        <?php require_once 'public/modules/menus/produccion.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
                <h1>Máquinas de Producción</h1>
                <div class="tarjeta-transparente d-grid g2-8-2">
                    <div class="d-grid g-2">
                        <input type="month" name="fecha_reporte" id="fecha_reporte">
                        <select name="pzas_kilos" id="pzas_kilos">
                            <option value="">Selecciona el tipo de reporte</option>
                            <option value="kilos">Kilos</option>
                            <option value="pzas">Piezas</option>
                        </select>
                    </div>
                    <div class="d-flex align-content-center justify-right">
                        <button class="btn btn-icon">
                            <i class="material-icons">description</i>
                            Generar Documento
                        </button>
                    </div>
                </div>
                <!-- <div class="acordeon tarjeta-transparente">
                    <div class="acordeon_opcion">
                        <div class="titulo_acordeon">
                            <h3 data-acordeon="primero">Estado</h3>
                        </div>
                        <div id="primero" class="contenido_acordeon mostrar_contenido">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Día</th>
                                        <th>Máquina 1</th>
                                        <th>Máquina 2</th>
                                        <th>Máquina 3</th>
                                        <th>Máquina 4</th>
                                        <th>Máquina 5</th>
                                        <th>Máquina 6</th>
                                        <th>Máquina 7</th>
                                        <th>Máquina 8</th>
                                        <th>Máquina 9</th>
                                    </tr>
                                </thead>
                                <tbody id="body_estados">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js"></script>
    <script src="../../public/js/produccion/maquinas.js?1.9"></script>
</body>
</html>