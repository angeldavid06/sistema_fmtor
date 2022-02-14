<div id="modal-ingresar" class="modal modal-izquierda">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Agregar</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-ingresar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form_reg_salida">

      
            <p>Fecha:</p>
            <input class="input" type="date" name="Fecha" id="Fecha" >
            <p>Salida De Almacen:</p>
            <input class="input" type="text" name="Salida" id="Salida" placeholder="Numero de salida">
            <p>Cliente:</p>
            <input class="input" type="text" name="Id_Clientes_2" id="Id_Clientes_2">
            <p>Cantidad millares:</p>
            <input class="input" type="text" name="Cantidad_millares" id="Cantidad_millares">
            <p>No.Parte cliente:</p>
            <input class="input" type="text" name="Codigo" id="Codigo" placeholder="Ingrese el codigo">
            <p>Pedido Cliente:</p>
            <input class="input" type="text" name="Pedido_pza" id="Pedido_pza" >
            <p>Medida:</p>
            <input class="input" type="text" name="Medida" id="Medida" >
            <p>Descripcion:</p>
            <textarea name="Descripcion" id="Descripcion" cols="30" rows="10" ></textarea>
            <p>Acabado:</p>
            <input class="input" type="text" name="Acabado" id="Acabado">
            <p>Costo:</p>
            <input class="input" type="text" name="Precio_millar" id="Precio_millar" >
            <p>Factura:</p>
            <input class="input" type="text" name="Factura" id="Factura" >
            <p>No de Dibujo:</p>
            <input class="input" type="text" name="Dibujo" id="Dibujo" placeholder="Ingrese el numero de plano">
            <p>Material:</p>
            <input class="input" type="text" name="Material" id="Material">
             <p>O.P:</p>
            <input class="input" type="text" name="Id_Folio" id="Id_Folio" >
            <p>Fecha de entrega :</p>
            <input class="input" type="date" name="Fecha_entrega" id="Fecha_entrega" >

        <div class="opciones d-flex flex-column">
            <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Registrar</button>
            <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-ingresar">Cancelar</label>
        </div>
    </form>
    </div>
</div>

<div id="modal-actualizar" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Actualizar </h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-actualizar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form_act_salida">

        
            <p>Fecha:</p>
            <input class="input" type="date" name="Fecha_edit" id="Fecha_edit" >
            <p>Salida De Almacen:</p>
            <input class="input" type="text" name="Salida_edit" id="Salida_edit" placeholder="Numero de salida">
            <p>Cliente:</p>
            <input class="input" type="text" name="Id_Clientes_2_edit" id="Id_Clientes_2_edit">
            <p>Cantidad millares:</p>
            <input class="input" type="text" name="Cantidad_millares_edit" id="Cantidad_millares_edit" >
            <p>No.Parte cliente:</p>
            <input class="input" type="text" name="Codigo_edit" id="Codigo_edit" placeholder="Ingrese el codigo">
            <p>Pedido Cliente:</p>
            <input class="input" type="text" name="Pedido_pza_edit" id="Pedido_pza_edit">
            <p>Medida:</p>
            <input class="input" type="text" name="Medida_edit" id="Medida_edit" >
            <p>Descripcion:</p>
            <textarea name="Descripcion_edit" id="Descripcion_edit" cols="30" rows="10" ></textarea>
            <p>Acabado:</p>
            <input class="input" type="text" name="Acabado_edit" id="Acabado_edit">
            <p>Costo:</p>
            <input class="input" type="text" name="Precio_millar_edit" id="Precio_millar_edit" >
            <p>Factura:</p>
            <input class="input" type="text" name="Factura_edit" id="Factura_edit" >
            <p>No de Dibujo:</p>
            <input class="input" type="text" name="Dibujo_edit" id="Dibujo_edit" placeholder="Ingrese el numero de plano">
            <p>Material:</p>
            <input class="input" type="text" name="Material_edit" id="Material_edit" >
             <p>O.P:</p>
            <input class="input" type="text" name="Id_Folio_edit" id="Id_Folio_edit" >
            <p>Fecha de entrega :</p>
            <input class="input" type="date" name="Fecha_entrega_edit" id="Fecha_entrega_edit" >

         <div class="opciones d-flex flex-column">
                <button data-btn="actualizar" class="btn" id="btn-form-control-actualizar">Actualizar</button>
                <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-actualizar">Cancelar</label>
            </div>
        </form>
    </div>
</div>