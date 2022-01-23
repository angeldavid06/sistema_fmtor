<div id="modal-ingresar" class="modal modal-izquierda">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Nuevo Registro</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-ingresar">close</button>
    </div>
    <div class="contenido_modal">
    <form id="form-control">
        <input type="text" name="op" id="op" hidden>
        <input type="text" name="estado" id="estado" hidden>
        <div class="d-grid g-2">
            <div class="d-grid g-1 grid-gap-0">
                <p>Número de máquina:</p>
                <input class="input no_maquina" type="number" name="no_maquina" id="no_maquina">
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <p>Número de botes:</p>
                <input class="input" type="number" name="no_botes" id="no_botes" placeholder="0">
            </div>
        </div>
        <div class="d-grid g-2">
            <div class="d-grid g-1 grid-gap-0">
                <p>Kg. entregados:</p>
                <input class="input" type="text" name="kg" id="kg" placeholder="00.00">
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <p>Pzas. entregadas:</p>
                <input class="input" type="number" name="pzas" id="pzas" placeholder="0">
            </div>
        </div>
        <div class="d-grid g-2">
            <div class="d-grid g-1 grid-gap-0">
                <p>Fecha:</p>
                <input class="input" type="date" name="fecha" id="fecha" placeholder="Ingresa la fecha de entrega">
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <p>Turno:</p>
                <input class="input "type="text" name="turno" id="turno" placeholder="Ingresa el turno">
            </div>
        </div>
        <p>Observaciones:</p>
        <select class="input" name="observaciones" id="observaciones">
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
            <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-ingresar">Cancelar</label>
        </div>
    </form>
    </div>
</div>
<div id="modal-actualizar" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Actualizar Registro</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-actualizar">close</button>
    </div>
    <div class="contenido_modal">
    <form id="form-control-actualizar">
        <input type="text" name="a_estado" id="a_estado" hidden>
        <input type="text" name="a_op" id="a_op" hidden>
        <div class="d-grid g-2">
            <div class="d-grid g-1 grid-gap-0">
                <p>Número de máquina:</p>
                <input class="input no_maquina" type="number" name="a_no_maquina" id="a_no_maquina" placeholder="Ingresa el número de máquina">
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <p>Número de botes:</p>
                <input class="input" type="number" name="a_no_botes" id="a_no_botes" placeholder="Ingresa el número de botes entregados">
            </div>
        </div>
        <div class="d-grid g-2">
            <div class="d-grid g-1 grid-gap-0">
                <p>Kg. entregados:</p>
                <input class="input" type="text" name="a_kg" id="a_kg" placeholder="Ingresa los kg. entregados">
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <p>Pzas. entregadas:</p>
                <input class="input" type="number" name="a_pzas" id="a_pzas" placeholder="Ingresa la cantidad de pzas. entregadas">
            </div>
        </div>
        <div class="d-grid g-2">
            <div class="d-grid g-1 grid-gap-0">
                <p>Fecha:</p>
                <input class="input" type="date" name="a_fecha" id="a_fecha" placeholder="Ingresa la fecha de entrega">
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <p>Turno:</p>
                <input class="input "type="text" name="a_turno" id="a_turno" placeholder="Ingresa el turno">
            </div>
        </div>
        <!-- <textarea name="observaciones" id="observaciones" cols="30" rows="10" placeholder="Ingresa las observaciones"></textarea> -->
        <p>Observaciones:</p>
        <select class="input" name="a_observaciones" id="a_observaciones">
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
        <div class="opciones d-flex flex-column">
            <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Actualizar</button>
            <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-actualizar">Cancelar</label>
        </div>
    </form>
    </div>
</div>

<div id="modal-ingresar-diario" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Nuevo Registro</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-ingresar-diario">close</button>
    </div>
    <div class="contenido_modal">
    <form id="form-control-diario">
        <div class="d-grid g-2">
            <div class="d-grid g-1 grid-gap-0">
                <p>Orden de Producción:</p>
                <input class="input" type="text" name="op" id="op" placeholder="00000">
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <p>Estados de Producción:</p>
                <select class="input" name="estado" id="estado">
                    <option value="">Selecciona un estado de producción:</option>
                    <option value="1">FORJADO</option>
                    <option value="2">RANURADO</option>
                    <option value="3">ROLADO</option>
                    <option value="4">SHANK</option>
                    <option value="5">CEMENTADO</option>
                    <option value="6">ACABADO</option>
                </select>
            </div>
        </div>
        <div class="d-grid g-2">
            <div class="d-grid g-1 grid-gap-0">
                <p>Número de máquina:</p>
                <input class="input" type="number" name="no_maquina" id="no_maquina">
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <p>Número de botes:</p>
                <input class="input" type="number" name="no_botes" id="no_botes" placeholder="0">
            </div>
        </div>
        <div class="d-grid g-2">
            <div class="d-grid g-1 grid-gap-0">
                <p>Kg. entregados:</p>
                <input class="input" type="text" name="kg" id="kg" placeholder="00.00">
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <p>Pzas. entregadas:</p>
                <input class="input" type="number" name="pzas" id="pzas" placeholder="0">
            </div>
        </div>
        <div class="d-grid g-2">
            <div class="d-grid g-1 grid-gap-0">
                <p>Fecha:</p>
                <input class="input" type="date" name="fecha" id="fecha" placeholder="Ingresa la fecha de entrega">
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <p>Turno:</p>
                <input class="input "type="text" name="turno" id="turno" placeholder="Ingresa el turno">
            </div>
        </div>
        <p>Observaciones:</p>
        <select class="input" name="observaciones" id="observaciones">
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
            <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-ingresar-diario">Cancelar</label>
        </div>
    </form>
    </div>
</div>