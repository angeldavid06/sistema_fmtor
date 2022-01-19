<div id="modal-filtrar-registro" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Reporte Diario</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-filtrar-registro">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form-reporte-diario-sop">
            <div class="contenedor_filtros">
                <div class="d-grid g-1 grid-gap-0">
                    <label style="margin-top: 0;" id="lbl_diario_estado" for="diario_estado">Estado de producción:</label>
                    <select class="input" name="diario_estado_sn_op" id="diario_estado_sn_op">
                        <option value="">Selecciona el estado de producción</option>
                        <option value="1">FORJADO</option>
                        <option value="2">RANURADO</option>
                        <option value="3">ROLADO</option>
                        <option value="4">SHANK</option>
                        <option value="5">CEMENTADO</option>
                        <option value="6">ACABADO</option>
                    </select>
                </div>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Número de máquina:</p>
                        <input class="input" type="number" name="no_maquina_sn_op" id="no_maquina_sn_op" placeholder="0 - 9">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Número de botes:</p>
                        <input class="input" type="number" name="no_botes_sn_op" id="no_botes_sn_op" placeholder="0">
                    </div>
                </div>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Kg. entregados:</p>
                        <input class="input" type="text" name="kg_sn_op" id="kg_sn_op" placeholder="00.00">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Pzas. entregadas:</p>
                        <input class="input" type="number" name="pzas_sn_op" id="pzas_sn_op" placeholder="0">
                    </div>
                </div>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Fecha:</p>
                        <input class="input" type="date" name="fecha_sn_op" id="fecha_sn_op" placeholder="Ingresa la fecha de entrega">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Turno:</p>
                        <input class="input "type="text" name="turno_sn_op" id="turno_sn_op" placeholder="Ingresa el turno">
                    </div>
                </div>
                <p>Observaciones:</p>
                <select class="input" name="observaciones_sn_op" id="observaciones_sn_op">
                    <option value="">Observaciones disponibles</option>
                    <option value="Sin Observaciones">Sin Observaciones</option>
                    <option value="Mantenimiento">Mantenimiento</option>
                    <option value="Falta de Alambre">Falta de Alambre</option>
                    <option value="Ajuste">Ajuste</option>
                    <option value="Herramental">Herramental</option>
                    <option value="Festivo">Festivo</option>
                    <option value="Falto Operador">Falto Operador</option>
                    <option value="No se libero Tornillo Laton">No se libero Tornillo Laton</option>
                    <option value="No hubo punch">No hubo punch</option>
                    <option value="Sin OP">Sin OP</option>
                    <option value="Ajuste OTM">Ajuste OTM</option>
                    <option value="H-Quebrado">H-Quebrado</option>
                </select>
                <!-- <textarea class="input" name="observaciones" id="observaciones" cols="30" rows="10" placeholder="Ingresa las observaciones"></textarea> -->
                <div class="opciones d-flex flex-column">
                    <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Registrar</button>
                    <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-filtrar-registro">Cancelar</label>
                </div>
            </div>
        </form>
    </div>
</div>