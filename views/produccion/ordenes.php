<!DOCTYPE html>
<html lang="es">
<head> 
    <?php require_once 'public/modules/head.php' ?>
    <title>Ordenes de Producción</title>
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
                    <div class="d-grid g-2">
                        <div class="d-flex align-content-center">
                            <!-- <label for="cantidad_resultados">Cantidad de resultados:</label>
                            <select data-select="" name="cantidad_resultados" id="cantidad_resultados">
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select> -->
                        </div>
                        <div class="d-flex align-content-center justify-right">
                            <button class="btn btn-transparent btn-icon-self material-icons-outlined">loop
                            </button>
                            <button class="btn btn-icon btn_filtrar_open" data-modal="modal-filtrar">
                                <i class="material-icons-outlined"  data-modal="modal-filtrar">filter_alt</i>
                                Filtrar
                            </button>
                            <button class="btn btn-icon" data-impresion="documento">
                                <i class="material-icons" data-impresion="documento">description</i>
                                Generar Documento
                            </button>
                        </div>
                    </div>
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
                                        <th>Acumulado<br>(Acabado)</th>
                                        <th>Estado</th>
                                    </thead>
                                    <tbody class="body"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <?php require_once 'public/modules/produccion/ordenes_modal.php'; ?>
                <?php require_once 'public/modules/produccion/plano_modal.php'; ?>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js"></script>
    <script src="../../public/js/produccion/filtros.js"></script>
    <script src="../../public/js/produccion/ordenes.js"></script>
</body>
</html>