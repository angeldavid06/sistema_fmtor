<div id="modal-ingresar" class="modal modal-izquierda">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Nueva Cotizacion</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-ingresar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form_reg_cotizacion">
            <p>Fecha:</p>
            <input class="input" type="date" name="Fecha" id="Fecha" placeholder="Ingresa la fecha de entrega">
            <p>Cliente:</p>
            <select name="Id_Clientes_1" id="Id_Clientes_1"> </select>
            <p>Descripcion:</p>
            <textarea name="Descripcion" id="Descripcion" cols="30" rows="10" placeholder="Ingrese el pedido "></textarea>
            <p>Acabados:</p>
            <input class="input" type="text" name="Acabado" id="Acabado" placeholder="Ingrese el acabado ">
            <p>Medida:</p>
            <input class="input" type="text" name="Medida" id="Medida" placeholder="Ingrese la medida">            
            <p>Cantidad millares:</p>
            <input class="input" type="text" name="Cantidad_millares" id="Cantidad_millares" placeholder="Ingrese la cantidad ordenada">
            <p>Precio por millar:</p>
            <input class="input" type="text" name="Precio_millar" id="Precio_millar" placeholder="Ingresa la cantidad de Precio por milla">
            <p>Total:</p>
            <input class="input" type="text" name="Total" id="Total" placeholder="Ingrese el  Total ">
            <p>Importe:</p>
            <input class="input" type="text" name="Importe" id="Importe" placeholder="Ingrese el importe">
            <p>iva:</p>
            <input class="input" type="text" name="iva" id="iva" placeholder="Ingrese el iva">
            <p>Total neto:</p>
            <input class="input" type="text" name="total_neto" id="total_neto" placeholder="Ingrese  el Total de la compra">
            <p>Especificaciones pedido :</p>
            <textarea name="Notas" id="Notas" cols="30" rows="10" placeholder="Ingresar las especificaciones del pedido "></textarea>
            <p>Nombre del empleado:</p>
            <input class="input" type="text" name="Empleado" id="Empleado" placeholder="Ingrese su nombre completo">
            <div class="opciones d-flex flex-column">
                <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Registrar</button>
                <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-ingresar">Cancelar</label>
            </div>
        </form>
    </div>
</div>

<div id="modal-actualizar" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Actualizar Cotizacion</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-actualizar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form_act_cotizacion">
        <input class="input"  hidden type="text" name="Id_Cotizacion_edit" id="Id_Cotizacion_edit" placeholder="Ingresa el Id_Certificado">
            <p>Fecha:</p>
            <input class="input" type="date" name="Fecha_edit" id="Fecha_edit" placeholder="Ingresa la fecha de entrega">
           
            <p>Cliente:</p>
            <select name="Id_Clientes_1_edit" id="Id_Clientes_1_edit"></select>
          
            <p>Descripcion:</p>
            <textarea name="Descripcion_edit" id="Descripcion_edit" cols="30" rows="10" placeholder="Ingrese el pedido "></textarea>
           
            <p>Acabados:</p>
            <input class="input" type="text" name="Acabado_edit" id="Acabado_edit" placeholder="Ingrese el acabado ">

            
            <p>Medida:</p>
            <input class="input" type="text" name="Medida_edit" id="Medida_edit" placeholder="Ingrese la medida">


            <p>Cantidad millares:</p>
            <input class="input" type="text" name="Cantidad_millares_edit" id="Cantidad_millares_edit" placeholder="Ingrese la cantidad ordenada">

            <p>Precio por millar:</p>
            <input class="input" type="text" name="Precio_millar_edit" id="Precio_millar_edit" placeholder="Ingresa la cantidad de Precio por milla">

            <p>Total:</p>
            <input class="input" type="text" name="Total_edit" id="Total_edit" placeholder="Ingrese Total de compra">
             <p>Importe:</p>
            <input class="input" type="text" name="Importe_edit" id="Importe_edit" placeholder="Ingrese el importe">
            <p>iva:</p>
            <input class="input" type="text" name="iva_edit" id="iva_edit" placeholder="Ingrese el iva">
            <p>Total neto:</p>
            <input class="input" type="text" name="total_neto_edit" id="total_neto_edit" placeholder="Ingrese  el Total de la compra">
            
            
            <p>Especificaciones pedido :</p>
            <textarea name="Notas_edit" id="Notas_edit" cols="30" rows="10" placeholder="Ingresar las especificaciones del pedido "></textarea>

            <p>Nombre del empleado:</p>
            <input class="input" type="text" name="Empleado_edit" id="Empleado_edit" placeholder="Ingrese su nombre completo">

            <div class="opciones d-flex flex-column">
                <button data-btn="actualizar" class="btn" id="btn-form-control-actualizar">Actualizar</button>
                <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-actualizar">Cancelar</label>
            </div>
        </form>
    </div>
</div>