<div id="modal-filtrar" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Filtros</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-filtrar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form-filtros">
            <div class="contenedor_filtros">
                <h3>Filtrar Orden de Compra</h3>
                <input type="text" name="tabla" id="tabla" value="v_salidas_almacen" hidden>
                <div class="filtro fecha">
                    <input type="radio" data-radio="radio" name="buscar_por" id="salida" value="salida">
                    <label class="lbl-radio" id="lbl_radio_salida" for="salida">Buscar Orden de Compra:</label>
                    <input class="input" type="number" name="f_salida" id="f_salida" disabled>
                    <input type="radio" data-radio="radio" name="buscar_por" id="rango_salidas" value="rango_salida">
                    <label class="lbl-radio" id="lbl_radio_rango_salida" for="rango_salidas">Filtrar por rango de Orden de Compra: </label>
                    <div class="d-grid g-2">
                        <input class="input" type="number" name="f_r_salida_m" id="f_r_salida_m" disabled>

                        <input class="input" type="number" name="f_r_salida_M" id="f_r_salida_M" disabled>
                    </div>
                </div>
                <h3>Filtrar por fecha:</h3>
                <div class="filtro fecha">
                    <input type="radio" data-radio="radio" name="buscar_por" id="fecha" value="fecha">
                    <label class="lbl-radio" id="lbl_radio_fecha" for="fecha" value="fecha">Filtrar por fecha especifica:</label>
                    <input class="input" type="date" name="f_fecha" id="f_fecha" disabled>
                    <input type="radio" data-radio="radio" name="buscar_por" id="fecha_mes" value="fecha_mes">
                    <label class="lbl-radio" id="lbl_radio_fecha_mes" for="fecha_mes">Filtrar por mes: </label>
                    <select class="input" name="f_fecha_mes" id="f_fecha_mes" disabled>
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
                    <input type="radio" data-radio="radio" name="buscar_por" id="fecha_anio" value="fecha_anio">
                    <label class="lbl-radio" id="lbl_radio_fecha_anio" for="fecha_anio">Filtrar por año: </label>
                    <input class="input" type="number" name="f_fecha_anio" id="f_fecha_anio" disabled>
                    <input type="radio" data-radio="radio" name="buscar_por" id="rango_fecha" value="rango_fecha">
                    <label class="lbl-radio" id="lbl_radio_rango_fecha" for="rango_fecha">Filtrar por rango de fecha: </label>
                    <div class="d-grid g-2">
                        <input class="input" type="date" name="f_r_fecha_m" id="f_r_fecha_m" disabled>
                        <input class="input" type="date" name="f_r_fecha_M" id="f_r_fecha_M" disabled>
                    </div>
                </div>
                <h3>Filtrar por proveedor:</h3>
                <div class="filtro fecha">
                    <input type="radio" data-radio="radio" name="buscar_por" id="proveedor_b" value="proveedor_b">
                    <label class="lbl-radio" id="lbl_radio_proveedor_b" for="proveedor_b">Buscar proveedor:</label>
                    <select name="f_proveedor_b" id="f_proveedor_b" class="input" disabled>
                        <option value="">Selecciona un proveedor</option>
                    </select>
                </div>
                <h3>Filtrar por empresa:</h3>
                <div class="filtro fecha">
                    <input type="radio" data-radio="radio" name="buscar_por" id="empresa_b" value="empresa_b">
                    <label class="lbl-radio" id="lbl_radio_empresa_b" for="empresa_b">Buscar empresa:</label>
                    <select name="f_empresa_b" id="f_empresa_b" class="input" disabled>
                        <option value="">Selecciona una empresa</option>
                    </select>
                </div>
                <div class="d-flex flex-column">
                    <button class="btn">Buscar</button>
                </div>
                <div class="d-grid g-2">
                    <label class="btn btn-transparent txt-center" id="limpiar-filtros">Limpiar filtros</label>
                    <label class="btn btn-transparent txt-center" data-modal="modal-filtrar">Cancelar</label>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="modal-historial" class="modal modal-izquierda width-05">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2 id="orden_de_compra">Orden de Compra: </h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-historial">close</button>
    </div>
    <div class="contenido_modal">
        <table class="table table_salida lista_salida" id="table">
            <thead>
                <th style="min-width: 100px;">Codigo</th>
                <th style="min-width: 160px;">Producto</th>
                <th style="min-width: 100px;">Cantidad</th>
                <th style="min-width: 100px;">Precio</th>
                <?php if ($_SESSION['cm9s'] == 'Administrativo') { ?>
                    <th style="min-width: 60px;"></th>
                    <th style="min-width: 60px;"></th>
                    <th style="min-width: 60px;"></th>
                <?php } ?>
            </thead>
            <tbody id="body_historial"></tbody>
        </table>
    </div>
</div>