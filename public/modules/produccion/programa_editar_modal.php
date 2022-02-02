<div id="modal-programa_insertar" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Nueva asignación de O.P.</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-programa_insertar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="op_programa">
            <div class="d-grid g-1 grid-gap-0">
                <label style="margin-top: 0;" for="">O.P.:</label>
                <input class="input" type="text" name="op" id="op">
                <label style="margin-top: 0;" for="">Fecha_entrega:</label>
                <input class="input" type="text" name="fecha_entrega" id="fecha_entrega">
                <label style="margin-top: 0;" for="">Herramental:</label>
                <input class="input" type="text" name="herramental" id="herramental">
                <label style="margin-top: 0;" for="">No. Máquina:</label>
                <input class="input" type="number" name="no_maquina" id="no_maquina">
                <label style="margin-top: 0;" for="">Producto:</label>
                <select name="estado_produccion" id="estado_produccion">
                    <option value="">Selecciona el estado del producto</option>
                    <option value="herramental">SUSP. HERRAMENTAL</option>
                    <option value="mantenimiento">MANTENIMIENTO</option>
                    <option value="alambre">SUSP. ALAMBRE</option>
                    <option value="linea">EN LÍNEA</option>
                    <option value="maquina">MÁQUINAS</option>
                </select>
                <button class="btn">Continuar</button>
            </div>
        </form>
    </div>
</div>
<div id="modal-programa_editar" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Actualizar registro</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-programa_editar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="op_programa_editar">
            <div class="d-grid g-1 grid-gap-0">
                <input type="text" name="registro" id="registro" hidden>
                <label style="margin-top: 0;" for="">O.P.:</label>
                <input class="input" type="text" name="op_a" id="op_a">
                <label style="margin-top: 0;" for="">Fecha_entrega:</label>
                <input class="input" type="text" name="fecha_entrega_a" id="fecha_entrega_a">
                <label style="margin-top: 0;" for="">Herramental:</label>
                <input class="input" type="text" name="herramental_a" id="herramental_a">
                <label style="margin-top: 0;" for="">No. Máquina:</label>
                <input class="input" type="number" name="no_maquina_a" id="no_maquina_a">
                <label style="margin-top: 0;" for="">Producto:</label>
                <select name="estado_produccion_a" id="estado_produccion_a">
                    <option value="">Selecciona el estado del producto</option>
                    <option value="herramental">SUSP. HERRAMENTAL</option>
                    <option value="mantenimiento">MANTENIMIENTO</option>
                    <option value="alambre">SUSP. ALAMBRE</option>
                    <option value="linea">EN LÍNEA</option>
                    <option value="maquina">MÁQUINAS</option>
                </select>
                <button class="btn">Continuar</button>
            </div>
        </form>
    </div>
</div>