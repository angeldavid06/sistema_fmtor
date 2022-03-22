<div id="modal-actualizar" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Agrega Tratamiento de Orden </h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-actualizar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form_act_orden">

            <input type="number" name="id_folio_edit" id="id_folio_edit" hidden>
            <p>T/Termico:</p>
            <input class="input" type="text" name="Tratamiento_edit" id="Tratamiento_edit" placeholder="Ingrese el tratamiento">


            <div class="opciones d-flex flex-column">
                <button data-btn="actualizar" class="btn" id="btn-form-control-actualizar">Actualizar</button>
                <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-actualizar">Cancelar</label>
            </div>
        </form>
    </div>
</div>
<div id="modal-filtrar" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Filtros</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-filtrar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form-filtros">
            <div class="contenedor_filtros">
                <h3>Filtrar Ordenes de Producción</h3>
                <div class="filtro fecha">
                    <input type="radio" data-radio="radio" name="buscar_por_fecha" id="op" value="op">
                    <label class="lbl-radio" id="lbl_radio_op" for="op">Buscar O.P.:</label>
                    <input class="input" type="number" name="f_op" id="f_op" disabled>
                    <input type="radio" data-radio="radio" name="buscar_por_fecha" id="rango_op" value="rango_op">
                    <label class="lbl-radio" id="lbl_radio_rango_op" for="rango_op">Filtrar por rango de O.P.: </label>
                    <div class="d-grid g-2">
                        <input class="input" type="number" name="f_r_op_m" id="f_r_op_m" disabled>

                        <input class="input" type="number" name="f_r_op_M" id="f_r_op_M" disabled>
                    </div>
                </div>
                <h3>Filtrar por fecha:</h3>
                <div class="filtro fecha">
                    <input type="radio" data-radio="radio" name="buscar_por_fecha" id="fecha" value="fecha">
                    <label class="lbl-radio" id="lbl_radio_fecha" for="fecha" value="fecha">Filtrar por fecha especifica:</label>
                    <input class="input" type="date" name="f_fecha" id="f_fecha" disabled>
                    <input type="radio" data-radio="radio" name="buscar_por_fecha" id="fecha_mes" value="fecha_mes">
                    <label class="lbl-radio" id="lbl_radio_fecha_mes" for="fecha_mes">Filtrar por mes: </label>
                    <input type="month" class="input" name="f_fecha_mes" id="f_fecha_mes" disabled>
                    <input type="radio" data-radio="radio" name="buscar_por_fecha" id="fecha_anio" value="fecha_anio">
                    <label class="lbl-radio" id="lbl_radio_fecha_anio" for="fecha_anio">Filtrar por año: </label>
                    <input class="input" type="number" name="f_fecha_anio" id="f_fecha_anio" disabled>
                    <input type="radio" data-radio="radio" name="buscar_por_fecha" id="rango_fecha" value="rango_fecha">
                    <label class="lbl-radio" id="lbl_radio_rango_fecha" for="rango_fecha">Filtrar por rango de fecha: </label>
                    <div class="d-grid g-2">
                        <input class="input" type="date" name="f_r_fecha_m" id="f_r_fecha_m" disabled>
                        <input class="input" type="date" name="f_r_fecha_M" id="f_r_fecha_M" disabled>
                    </div>
                </div>
                <h3>Filtrar por cliente:</h3>
                <div class="filtro fecha">
                    <input type="radio" data-radio="radio" name="buscar_por" id="cliente" value="cliente">
                    <label class="lbl-radio" id="lbl_radio_cliente" for="cliente">Buscar cliente:</label>
                    <select name="f_cliente" id="f_cliente" class="input" disabled></select>
                    <!-- <input class="input" type="text" name="f_cliente" id="f_cliente" disabled> -->
                </div>
                <h3>Filtrar por estado:</h3>
                <div class="filtro fecha">
                    <input type="radio" data-radio="radio" name="buscar_por" id="estado" value="estado">
                    <label class="lbl-radio" id="lbl_radio_estado" for="estado">Selecciona el estado de las O.P.:</label>
                    <select class="input" name="f_estado" id="f_estado" disabled>
                        <option value="FORJADO">FORJADO</option>
                        <option value="RANURADO">RANURADO</option>
                        <option value="ROLADO">ROLADO</option>
                        <option value="SHANK">SHANK</option>
                        <option value="CEMENTADO">CEMENTADO</option>
                        <option value="ACABADO">ACABADO</option>
                        <option value="PENDIENTE">PENDIENTE</option>
                        <option value="TERMINADO">TERMINADO</option>
                        <option value="CANCELADA">CANCELADO</option>
                    </select>
                </div>
                <div class="d-flex flex-column">
                    <div class="d-grid g-1">
                        <button class="btn">Buscar</button>
                    </div>
                    <div class="d-grid g-2">
                        <label class="btn btn-transparent txt-center" data-limpiar="limpiar">Limpiar Filtros</label>
                        <label class="btn btn-transparent txt-center" data-modal="modal-filtrar">Cancelar</label>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="modal-ingresar" class="modal modal-izquierda">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Nueva Orden de Producción</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-ingresar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form_reg_proveedor">
            <p>Salida:</p>
            <input class="input " type="text" name="Proveedor" id="Proveedor" placeholder="Ingresar nombre del Proveedor">
            <p>Plano:</p>
            <input class="input " type="text" name="Direccion" id="Direccion" placeholder="Ingresar la Direccion">
            <p>Cantidad a producir:</p>
            <input class="input " type="text" name="Ciudad" id="Ciudad" placeholder="Ingresar la Ciudad">
            <p>Tratamiento :</p>
            <input class="input" type="text" name="Telefono" id="Telefono" placeholder="Ingrese numero de contacto">
            <div class="opciones d-flex flex-column">
                <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Registrar</button>
                <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-ingresar">Cancelar</label>
            </div>
        </form>
    </div>
</div>