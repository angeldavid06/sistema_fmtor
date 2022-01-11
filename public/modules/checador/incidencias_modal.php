<div id="modal-actualizar" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Actualizar Incidencias</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-actualizar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form_actualizar">
            <p>Numero de Incidencia:</p>
                <input class="input " type="text" name="id_incidencias" id="id_incidencias" placeholder="Ingresar numero de incidencia ">
            <p>Empleado:</p>
                <select name="id_empleado" id="id_empleado"> </select>
            <p>Incapacidad:</p>
                <select name="incapacidad" id="incapacidad">
                    <option value="0">Enfermedad General</option>
                    <option value="1">Riesgo de trabajo</option>
                    <option value="2">Finamiento</option>
                    <option value="3">Emergencia Familiar</option>
                    <option value="4">Falta dia completo</option>
                    <option value="5">Descanso por permiso</option>
                    <option value="6">Vacaciones</option>
                </select>
                <p>Inicio Incapacidad:</p>
            <input class="input" type="date" name="inicio_in" id="inicio_in" placeholder="Ingrese fecha inicio Incidencia">
            <p>Fin Incapacidad:</p>
            <input class="input " type="date" name="fin_in" id="fin_in" placeholder="Ingrese fecha fin Incidencia">
            <div class="opciones d-flex flex-column">
                <button data-btn="actualizar" class="btn" id="btn-form-actualizar">Actualizar</button>
                <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-actualizar">Cancelar</label>
            </div>
        </form>
    </div>
</div>


               <div id="modal-filtrar" class="modal modal-derecha">
                    <div class="titulo_modal d-flex justify-between align-content-center">
                        <h2>Filtros incidencias</h2>
                        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-filtrar">close</button>
                    </div>
                    <div class="contenido_modal">
                        <form id="form-formatos">
                            <div class="contenedor_filtros">
                                <h2></h2>
                                <input type="text" name="tabla" id="tabla" value="" hidden>
                                <select name="seleccion_formato" id="seleccion_formato">
                                    <option value="0">Editar Incidencias</option>
                                    <option value="1">Lista Incidencias</option>
                                </select>
                            </div>
                        </form>
                    </div>
                </div>