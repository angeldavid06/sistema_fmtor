<div id="modal-registrar"class="modal modal-center">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Registrar Nuevo Reporte</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-registrar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form_reg_reporte" enctype="multipart/form-data"> 

        <p>Mes de creacion:</p>
        <input class="input" type="text" name="Mes_de_creacion" id="Mes_de_creacion" placeholder="Ingresa el Mes de creacion">
        <p>Reporte PDF:</p>
            <input class="input" type="file" name="ReportePDF" id="ReportePDF" placeholder="Ingrese el Reporte PDF">

            <div class="opciones d-flex flex-column">
                <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Registrar</button>
                
                <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-registrar">Cancelar</label>
            </div>
        </form>
    </div>
</div>
<div id="modal-actualizar" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
    <h2>Actualizar Reporte</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-actualizar">close</button>
    </div>
    <div class="contenido_modal">
                     <form id="form_act_reporte" enctype="multipart/form-data"> 
                         
        <input class="input"  hidden type="text" name="Id_reporte_edit" id="Id_reporte_edit" placeholder="Ingresa el Id_Iso">

        <p>Mes de creacion:</p>
        <input class="input" type="text" name="Mes_de_creacion_edit" id="Mes_de_creacion_edit" placeholder="Ingresa el Mes de creacion">
        
        <p>Reporte PDF:</p>
            <input class="input" type="file" name="ReportePDF_edit" id="ReportePDF_edit" placeholder="Ingrese el Reporte PDF">
       
        <div class="opciones d-flex flex-column">
            <button data-btn="actualizar" class="btn" id="btn-form-control-actualizar">Actualizar</button>
			
            <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-actualizar">Cancelar</label>
        </div>
    </form>
    </div>
</div>