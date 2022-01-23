<?php require_once 'public/modules/sesion_depto.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Control de Producción</title>
</head>
<body>
    <div class="contenedor">
        <a href="#top" class="btn btn-icon btn-flotante btn-icon-self material-icons" id="btn-subir">expand_less
        </a>
        <?php require_once 'public/modules/menus/produccion.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
                <div class="d-grid g2-5-5">
                    <div style="padding-top: 0px;" class="tarjeta-transparente">
                        <h1>Control de Producción</h1>
                    </div>
                    <div style="padding-top: 0px;" class="tarjeta-transparente d-flex justify-right align-content-center flex-wrap">
                        <button title="Generar Control de Producción" class="btn-impresion btn btn-icon btn-transparent" data-impresion="control">
                            <i class="material-icons" data-impresion="control">calendar_view_month</i>
                            Control de Producción
                        </button>
                        <button title="Generar Control de Producción" class="btn-impresion btn btn-icon btn-transparent" data-impresion="control_vacio">
                            <i class="material-icons" data-impresion="control_vacio">calendar_view_month</i>
                            Control (Vacio)
                        </button>
                    </div>
                </div>
                <div class="tarjeta-transparente">
                    <div class="d-flex align-content-center">
                        <input type="number" name="op_control" id="op_control" data-control="" placeholder="Orden de Producción">
                        <button title="Buscar información" id="informacion_op" class="btn btn-icon-self material-icons">search</button>
                        <?php if ($_SESSION['rol'] == 'Administrativo') { ?>
                            <button data-modal="modal-ingresar" title="Nuevo registro diario" class="material-icons btn btn-icon-self" id="btn-form-control">add</button>
                        <?php } ?>
                    </div>
                </div>
                <div class="d-grid g2-2-8">
                    <div class="position-relative">
                        <div class="acordeon tarjeta-transparente position-sticky">
                            <div class="acordeon_opcion">
                                <div class="titulo_acordeon">
                                    <h3 data-acordeon="informacion">Información de la O.P.</h3>
                                </div>
                                <div id="informacion" class="contenido_acordeon info mostrar_contenido">
                                    <label>Código Del Dibujo:</label>
                                    <label>Cliente:</label>
                                    <label>Fecha:</label>
                                    <label>Cantidad:</label>
                                    <label>Descripción:</label>
                                    <label>Factor:</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="info_control ov_x_auto">
                        <div class="tarjeta-transparente estados">
                            <div class="botones ov_x_auto d-flex">
                            </div>
                        </div>
                        <div class="estado_tabla tarjeta d-grid g2-5-5">
                            <div class="titulo d-flex align-content-center">
                                <h2 class="titulo_estado">No seleccionado</h2>
                            </div>
                            <div class="d-flex align-content-center justify-between">
                                <div style="width: 200px;" class="d-flex align-content-center">
                                    <input style="width: 130px;" type="text" name="factor_control" id="factor_control" placeholder="Factor: 0.0">
                                    <?php if ($_SESSION['rol'] == 'Administrativo') { ?>
                                        <button title="Actualizar el factor" id="nuevo_factor" class="btn btn-icon-self material-icons">update</button>
                                    <?php } ?>
                                </div>
                                <p style="padding: 0px;" class="total_acumuladas">Pzas. Acumuladas: <br> 0000</p>
                                <p style="padding: 0px;" class="total_kg">Total Kg: <br> 000.00</p>
                            </div>
                        </div>
                        <div class="tarjeta ov_hidden">
                            <div class="tabla d-flex nowrap">
                                <!-- Cambiar todo a una sola tabla -->
                                <table class="table table-control">
                                    <thead>
                                        <th width="100px">Botes</th>
                                        <th>Fecha</th>
                                        <th>Observaciones</th>
                                        <th>Pzas. Producidas</th>
                                        <th>Kg.</th>
                                        <th width="100px">Máquina</th>
                                        <?php if ($_SESSION['rol'] == 'Administrativo') { ?>
                                            <th width="80px"></th>
                                            <th width="80px"></th>
                                        <?php } ?>
                                    </thead>
                                    <tbody class="body"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <?php
                    if ($_SESSION['rol'] == 'Administrativo') {
                        require_once 'public/modules/produccion/control_modal.php';
                        require_once 'public/modules/produccion/diario_modal.php';
                    } 
                ?>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js"></script>
    <script src="../../public/js/produccion/control.js"></script>
    <?php if ($_SESSION['rol'] == 'Administrativo') { ?>
        <script src="../../public/js/produccion/render_control_admin.js"></script>
    <?php } else { ?>
        <script src="../../public/js/produccion/render_control_usuario.js"></script>
    <?php } ?>
    <script src="../../public/js/produccion/estados.js"></script>
</body>
</html>