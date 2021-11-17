<!DOCTYPE html>
<html lang="es">
<head> 
    <?php require_once 'public/modules/head.php' ?>
    <title>Página Principal</title>
</head>
<body>
    <div class="contenedor">
        <a href="#top" class="btn btn-icon-self btn-flotante material-icons" id="btn-subir">expand_less
        </a>
        <?php require_once 'public/modules/menus/produccion.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
                <h1>Ordenes de Producción</h1>
                <div class="tarjeta-transparente d-flex justify-right">
                    <button class="btn btn-icon-self btn_filtrar_open material-icons" data-modal="modal-filtrar">filter_alt</button>
                    <button class="btn btn-icon-self material-icons">print</button>
                </div>
                <div class="tarjeta">
                    <div class="main">
                        <div class="row-con">
                            <div class="tabla">
                                <table>
                                    <thead class="cabecera">
                                        <th>CAL.</th>
                                        <th>Kg.</th>
                                        <th>Factor</th>
                                        <th>N° O.P.</th>
                                        <th>Fecha de O.P.</th>
                                        <th>Cliente</th>
                                        <th>Descripción</th>
                                        <th>Acabado</th>
                                        <th>Cant</th>
                                        <th>Precio</th>
                                        <th>Total</th>
                                        <th>Acumulado</th>
                                        <th>Estado</th>
                                    </thead>
                                    <tbody class="body"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <?php require_once 'public/modules/produccion/ordenes_modal.php'; ?>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js?1.4"></script>
    <script src="../../public/js/produccion/filtros.js?2.0"></script>
    <script src="../../public/js/produccion/ordenes.js?2.1"></script>
</body>
</html>