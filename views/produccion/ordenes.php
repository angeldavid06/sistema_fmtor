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
                <div class="tarjeta d-flex justify-right">
                    <button class="btn btn-icon-self btn_filtrar_open material-icons" data-modal="modal-filtrar">filter_alt</button>
                    <button class="btn btn-icon-self material-icons">print</button>
                </div>
                <div class="tarjeta">
                    <div class="main">
                        <div class="row-con">
                            <div class="tabla">
                                <table>
                                    <thead>
                                        <th>CAL.</th>
                                        <th>Kg.</th>
                                        <th>Factor</th>
                                        <th>N° O.P.</th>
                                        <th>Fecha de O.P.</th>
                                        <th>Cliente</th>
                                        <th>Medida</th>
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
                <div id="modal-filtrar" class="modal modal-derecha">
                    <div class="titulo_modal d-flex justify-between align-content-center">
                        <h2>Filtros</h2>
                        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-filtrar">close</button>
                    </div>
                    <div class="contenido_modal">
                        <form id="form-formatos">
                            <div class="contenedor_filtros">
                                <h2>Formatos pre establecidos</h2>
                                <select name="seleccion_formato" id="seleccion_formato">
                                    <option value="0">Ordenes de Producción</option>
                                    <option value="1">Reporte Diario</option>
                                    <option value="2">Reporte Diario por Máquina</option>
                                </select>
                            </div>
                        </form>
                        <form id="form-filtros">
                            <div class="contenedor_filtros">
                                <input type="text" name="tabla" id="tabla" value="ordenes" hidden>
                                <h2>Filtrar Ordenes de Producción</h2>
                                <h3>Filtrar por O.P.:</h3>
                                <div class="filtro fecha">
                                    <input type="checkbox" data-check="f_op" class="checkbox" name="check_op" id="check_op">
                                    <label class=lbl-checkboxk" id="lbl_check_op"  for="check_op">Buscar O.P.:</label>
                                    <input class="input" type="number" name="f_op" id="f_op" disabled>
                                    <input type="checkbox" data-check="f_r_op" data-rango="true" class="checkbox" name="check_rango_op" id="check_rango_op">
                                    <label class="lbl-checkbox" id="lbl_check_rango_op"  for="check_rango_op">Filtrar por rango de O.P.: </label>
                                    <div class="d-flex justify-between align-content-center">
                                        <input class="input" type="number" name="f_r_op_m" id="f_r_op_m" disabled>
                                        <p>-</p>
                                        <input class="input" type="number" name="f_r_op_M" id="f_r_op_M" disabled>
                                    </div>
                                </div>
                                <h3>Filtrar por fecha:</h3>
                                <div class="filtro fecha">
                                    <input type="checkbox" data-check="f_fecha" class="checkbox" name="check_fecha" id="check_fecha">
                                    <label class="lbl-checkbox" id="lbl_check_fecha" for="check_fecha">Filtrar por fecha especifica:</label>
                                    <input class="input" type="date" name="f_fecha" id="f_fecha" disabled>
                                    <input type="checkbox" data-check="f_mes" class="checkbox" name="check_fecha_mes" id="check_fecha_mes">
                                    <label class="lbl-checkbox" id="lbl_check_fecha_mes" for="check_fecha_mes">Filtrar por mes: </label>
                                    <select class="input" name="f_mes" id="f_mes" disabled>
                                        <option value="01">Enero</option>
                                        <option value="02">Febrero</option>
                                        <option value="03">Marzo</option>
                                        <option value="04">Abril</option>
                                        <option value="05">Mayo</option>
                                        <option value="06">Junio</option>
                                        <option value="07">Julio</option>
                                        <option value="08">Agosto</option>
                                        <option value="09">Septiembre</option>
                                        <option value="10">Octubre</option>
                                        <option value="11">Noviembre</option>
                                        <option value="12">Diciembre</option>
                                    </select>
                                    <input type="checkbox" data-check="f_anio" class="checkbox" name="check_fecha_anio" id="check_fecha_anio">
                                    <label class="lbl-checkbox" id="lbl_check_fecha_anio" for="check_fecha_anio">Filtrar por año: </label>
                                    <input class="input" type="number" name="f_anio" id="f_anio" disabled>
                                    <input type="checkbox" data-check="f_r_fecha" data-rango="true" class="checkbox" name="check_rango_fecha" id="check_rango_fecha">
                                    <label class="lbl-checkbox" id="lbl_check_rango_fecha" for="check_rango_fecha">Filtrar por rango de fecha: </label>
                                    <div class="d-flex justify-between align-content-center">
                                        <input class="input" type="date" name="f_r_fecha_m" id="f_r_fecha_m" disabled>
                                        <p>-</p>
                                        <input class="input" type="date" name="f_r_fecha_M" id="f_r_fecha_M" disabled>
                                    </div>
                                </div>
                                <h3>Filtrar por cliente:</h3>
                                <div class="filtro fecha">
                                    <input type="checkbox" data-check="f_cliente" class="checkbox" name="check_cliente" id="check_cliente">
                                    <label class="lbl-checkbox" id="lbl_check_cliente" for="check_cliente">Buscar cliente:</label>
                                    <input class="input" type="text" name="f_cliente" id="f_cliente" disabled>
                                </div>
                                <h3>Filtrar por estado:</h3>
                                <div class="filtro fecha">
                                    <input type="checkbox" data-check="f_estado" class="checkbox" name="check_estado" id="check_estado">
                                    <label class="lbl-checkbox" id="lbl_check_estado" for="check_estado">Selecciona el estado de las O.P.:</label>
                                    <select name="f_estado" id="f_estado" disabled>
                                        <option value="FORJADO">FORJADO</option>
                                        <option value="RANURADO">RANURADO</option>
                                        <option value="ROLADO">ROLADO</option>
                                        <option value="SHANK">SHANK</option>
                                        <option value="CEMENTADO">CEMENTADO</option>
                                        <option value="ACABADO">ACABADO</option>
                                        <option value="TERMINADO">TERMINADO</option>
                                        <option value="CANCELADO">CANCELADO</option>
                                    </select>
                                </div>
                                <div class="d-flex flex-column">
                                    <button class="btn">Buscar</button>
                                    <label class="btn btn-transparent txt-center" data-modal="modal-filtrar">Cancelar</label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js?1.2"></script>
    <!-- <script src="../../public/js/origin.js"></script>
    <script src="../../public/js/filtros.js"></script> -->
    <script src="../../public/js/produccion/ordenes.js?1.2"></script>
</body>
</html>