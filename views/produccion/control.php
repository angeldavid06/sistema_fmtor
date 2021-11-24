<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Registro Diario de Producción</title>
</head>
<body>
    <div class="contenedor">
        <a href="#top" class="btn btn-icon btn-flotante btn-icon-self material-icons" id="btn-subir">expand_less
        </a>
        <?php require_once 'public/modules/menus/produccion.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
<<<<<<< HEAD
                <h1>Registro Diario de Producción</h1>
                <div class="d-grid g2-8-2 tarjeta-transparente">
                    <div>
                        <input type="number" name="op_control" id="op_control" data-control="" placeholder="Orden de Producción">
                    </div>
                    <div class="d-flex align-content-center justify-right" >
                        <button class="btn btn-icon" data-impresion="documento">
                            <i class="material-icons" data-impresion="documento">description</i>
                            Generar documento
                        </button>
=======
                <h1>Control de Producción</h1>
                <div class="d-grid g-3">
                    <div class="info_general hidden">
                        <div class="tarjeta info">
                            <h3>Información de la O.P.</h3>
                            <p>Código Del Dibujo:</p>
                            <label class="cod_dibujo"></label>
                            <p>Cliente:</p>
                            <label class="cliente"></label>
                            <p>Fecha:</p>
                            <label class="fecha"></label>
                            <p>Cantidad:</p>
                            <label class="cantidad"></label>
                            <p>Descripción:</p>
                            <label class="descripcion"></label>
                        </div>
                    </div>
                    <div class="info_control" style="grid-area: 1 / 2 / 2 / 4;">
                        <div class="tarjeta-transparente estados">
                            <div class="options d-flex align-content-center">
                                <input type="number" name="op_control" id="op_control" data-control="" placeholder="Orden de Producción">
                                <button class="btn btn-icon-self material-icons">print</button>
                            </div>
                            <div class="botones d-flex">
                                <button class="btn btn-transparent boton_estado" data-estado="v_forjado" data-titulo="FORJADO" data-id="1">FORJADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_ranurado" data-titulo="RANURADO" data-id="2">RANURADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_rolado" data-titulo="ROLADO" data-id="3">ROLADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_shank" data-titulo="SHANK" data-id="4">SHANK</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_cementado" data-titulo="CEMENTADO" data-id="5">CEMENTADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_acabado" data-titulo="ACABADO" data-id="6">ACABADO</button>
                            </div>
                        </div>
                        <div class="estado_tabla d-flex align-content-center tarjeta">
                            <div class="titulo d-flex align-content-center">
                                <button class="material-icons btn btn-icon-self" id="btn-form-control">add</button>
                                <h2 class="titulo_estado">No seleccionado</h2>
                            </div>
                            <div class="info_total d-flex align-content-center justify-right">
                                <p class="factor">Factor: 00.00</p>
                                <p class="total_acumuladas">Pzas. Acumuladas: 0000</p>
                                <p class="total_kg">Total Kg: 000.00</p>
                            </div>
                        </div>
                        <div class="tabla tarjeta">
                            <table class="table table-control estado_v_forjado">
                                <thead>
                                    <th></th>
                                    <th>Botes</th>
                                    <th>Fecha</th>
                                    <th>Pzas. Producidas</th>
                                    <th>Kg</th>
                                    <th>Máquina</th>
                                </thead>
                                <tbody class="body body_v_forjado"></tbody>
                            </table>
                            <table class="table table-control estado_v_ranurado">
                                <thead>
                                    <th></th>
                                    <th>Botes</th>
                                    <th>Fecha</th>
                                    <th>Pzas. Producidas</th>
                                    <th>Kg</th>
                                    <th>Máquina</th>
                                </thead>
                                <tbody class="body body_v_ranurado"></tbody>
                            </table>
                            <table class="table table-control estado_v_rolado">
                                <thead>
                                    <th></th>
                                    <th>Botes</th>
                                    <th>Fecha</th>
                                    <th>Pzas. Producidas</th>
                                    <th>Kg</th>
                                    <th>Máquina</th>
                                </thead>
                                <tbody class="body body_v_rolado"></tbody>
                            </table>
                            <table class="table table-control estado_v_shank">
                                <thead>
                                    <th></th>
                                    <th>Botes</th>
                                    <th>Fecha</th>
                                    <th>Pzas. Producidas</th>
                                    <th>Kg</th>
                                    <th>Máquina</th>
                                </thead>
                                <tbody class="body body_v_shank"></tbody>
                            </table>
                            <table class="table table-control estado_v_cementado">
                                <thead>
                                    <th></th>
                                    <th>Botes</th>
                                    <th>Fecha</th>
                                    <th>Pzas. Producidas</th>
                                    <th>Kg</th>
                                    <th>Máquina</th>
                                </thead>
                                <tbody class="body body_v_cementado"></tbody>
                            </table>
                            <table class="table table-control estado_v_acabado">
                                <thead>
                                    <th></th>
                                    <th>Botes</th>
                                    <th>Fecha</th>
                                    <th>Pzas. Producidas</th>
                                    <th>Kg</th>
                                    <th>Máquina</th>
                                </thead>
                                <tbody class="body body_v_acabado"></tbody>
                            </table>
                        </div>
>>>>>>> ab262c7e2f052172979f4cc1e1f7e685595f931a
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
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="info_control ov_x_auto">
                        <div class="tarjeta-transparente estados">
                            <div class="botones ov_x_auto d-flex">
                                <button class="btn btn-transparent boton_estado" data-estado="v_forjado" data-titulo="FORJADO" data-id="1">FORJADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_ranurado" data-titulo="RANURADO" data-id="2">RANURADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_rolado" data-titulo="ROLADO" data-id="3">ROLADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_shank" data-titulo="SHANK" data-id="4">SHANK</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_cementado" data-titulo="CEMENTADO" data-id="5">CEMENTADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_acabado" data-titulo="ACABADO" data-id="6">ACABADO</button>
                            </div>
                        </div>
                        <div class="estado_tabla tarjeta d-grid g2-6-4">
                            <div class="titulo d-flex align-content-center">
                                <button class="material-icons btn btn-icon-self" id="btn-form-control" data-modal="modal-ingresar">add</button>
                                <h2 class="titulo_estado">No seleccionado</h2>
                            </div>
                            <div class="info_total d-flex justify-between align-content-center justify-right">
                                <p class="factor">Factor: <br> 00.00</p>
                                <p class="total_acumuladas">Pzas. Acumuladas: <br> 0000</p>
                                <p class="total_kg">Total Kg: <br> 000.00</p>
                            </div>
                        </div>
                        <div class="tarjeta ov_hidden">
                            <div class="tabla d-flex nowrap">
                                <!-- Cambiar todo a una sola tabla -->
                                <table class="table table-control">
                                    <thead>
                                        <th width="100px">Botes</th>
                                        <th>Fecha</th>
                                        <th>Pzas. Producidas</th>
                                        <th>Kg.</th>
                                        <th width="100px">Máquina</th>
                                        <th width="80px"></th>
                                        <th width="80px"></th>
                                    </thead>
                                    <tbody class="body"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <?php require_once 'public/modules/produccion/control_modal.php'; ?>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js?2.1"></script>
    <script src="../../public/js/produccion/control.js?2.5"></script>
    <script src="../../public/js/produccion/estados.js?2.3"></script>
</body>
</html>