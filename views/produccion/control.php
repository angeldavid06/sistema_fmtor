<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Página Principal</title>
</head>
<body>
    <div class="contenedor">
        <a href="#top" class="btn btn-icon btn-flotante btn-icon-self material-icons" id="btn-subir">expand_less
        </a>
        <?php require_once 'public/modules/menus/produccion.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
                <h1>Control de Producción</h1>
                <div class="d-flex align-content-center tarjeta-transparente">
                    <input type="number" name="op_control" id="op_control" data-control="" placeholder="Orden de Producción">
                    <button class="btn btn-icon-self material-icons">print</button>
                </div>
                <div class="d-grid g2-2-8">
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
                    <div class="info_control ov_x_auto">
                        <div class="tarjeta-transparente estados">
                            <div class="botones ov_x_auto d-flex">
                                <button class="btn btn-transparent boton_estado active" data-estado="v_forjado" data-titulo="FORJADO" data-id="1">FORJADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_ranurado" data-titulo="RANURADO" data-id="2">RANURADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_rolado" data-titulo="ROLADO" data-id="3">ROLADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_shank" data-titulo="SHANK" data-id="4">SHANK</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_cementado" data-titulo="CEMENTADO" data-id="5">CEMENTADO</button>
                                <button class="btn btn-transparent boton_estado" data-estado="v_acabado" data-titulo="ACABADO" data-id="6">ACABADO</button>
                            </div>
                        </div>
                        <div class="estado_tabla tarjeta d-grid g2-3-7">
                            <div class="titulo d-flex align-content-center">
                                <button class="material-icons btn btn-icon-self" id="btn-form-control" data-modal="modal-ingresar">add</button>
                                <h2 class="titulo_estado">No seleccionado</h2>
                            </div>
                            <div class="info_total d-flex align-content-center justify-right">
                                <p class="factor">Factor: 00.00</p>
                                <p class="total_acumuladas">Pzas. Acumuladas: 0000</p>
                                <p class="total_kg">Total Kg: 000.00</p>
                            </div>
                        </div>
                        <div class="tarjeta">
                            <div class="tabla">
                                <table class="table table-control estado_v_forjado">
                                    <thead>
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
                                        <th>Botes</th>
                                        <th>Fecha</th>
                                        <th>Pzas. Producidas</th>
                                        <th>Kg</th>
                                        <th>Máquina</th>
                                    </thead>
                                    <tbody class="body body_v_acabado"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="modal-ingresar" class="modal modal-derecha">
                    <div class="titulo_modal d-flex justify-between align-content-center">
                        <h2>Nuevo Registro</h2>
                        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-ingresar">close</button>
                    </div>
                    <div class="contenido_modal">
                    <form id="form-control">
                        <input type="text" name="estado" id="estado" hidden>
                        <input type="text" name="op" id="op" hidden>
                        <p>Número de máquina:</p>
                        <input class="input" type="number" name="no_maquina" id="no_maquina" placeholder="Ingresa el número de máquina">
                        <p>Número de botes:</p>
                        <input class="input" type="number" name="no_botes" id="no_botes" placeholder="Ingresa el número de botes entregados">
                        <p>Fecha:</p>
                        <input class="input" type="date" name="fecha" id="fecha" placeholder="Ingresa la fecha de entrega">
                        <p>Pzas. entregadas:</p>
                        <input class="input" type="number" name="pzas" id="pzas" placeholder="Ingresa la cantidad de pzas. entregadas">
                        <p>Kg. entregados:</p>
                        <input class="input" type="text" name="kg" id="kg" placeholder="Ingresa los kg. entregados">
                        <p>Turno:</p>
                        <input type="text" name="turno" id="turno" placeholder="Ingresa el turno">
                        <p>Observaciones:</p>
                        <textarea name="observaciones" id="observaciones" cols="30" rows="10" placeholder="Ingresa las observaciones"></textarea>
                        <div class="opciones d-flex flex-column">
                            <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Registrar</button>
                            <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-ingresar">Cancelar</label>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js?1.1"></script>
    <script src="../../public/js/produccion/control.js"></script>
    <script src="../../public/js/produccion/estados.js?1.1"></script>
</body>
</html>