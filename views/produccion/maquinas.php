<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Página Principal</title>
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
                <div class="tarjeta-transparente d-grid g2-9-1">
                    <div class="d-grid g-2">
                        <input type="month" name="fecha_reporte" id="fecha_reporte">
                        <select name="pzas_kilos" id="pzas_kilos">
                            <option value="">Selecciona el tipo de reporte</option>
                            <option value="kilos">Kilos</option>
                            <option value="pzas">Piezas</option>
                        </select>
                    </div>
                    <div class="d-flex align-content-center justify-right">
                        <button class="btn btn-icon-self material-icons">description</button>
                    </div>
                </div>
                <div class="acordeon tarjeta-transparente">
                    <div class="acordeon_opcion">
                        <div class="titulo_acordeon">
                            <h3 data-acordeon="estado">Semanas</h3>
                        </div>
                        <div id="estado" class="contenido_acordeon mostrar_contenido">
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
                                <tbody id="body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="acordeon tarjeta-transparente">
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
                </div>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js"></script>
    <script src="../../public/js/produccion/maquinas.js?1.1"></script>
</body>
</html>