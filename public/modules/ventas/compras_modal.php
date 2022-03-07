    <div id="modal-ingresar" class="modal modal-derecha">
        <div class="titulo_modal d-flex justify-between align-content-center">
            <h2>Nueva Orden de Compra</h2>
            <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-ingresar">close</button>
        </div>
        <div class="contenido_modal">
            <form id="form_reg_orden">
                <div class="d-grid g-2">
                    <span style="margin: 0;" data-pegar="pegar-cliente" class="btn btn-icon d-flex justify-center" title="Pegar información del portapapeles">
                        <i data-pegar="pegar-cliente" class="material-icons-round">content_paste_go</i>
                        Pegar inf. cliente
                    </span>
                    <span style="margin: 0;" data-pegar="pegar-todo" class="btn btn-transparent btn-icon d-flex justify-center" title="Pegar información del portapapeles">
                        <i data-pegar="pegar-todo" class="material-icons-round">content_paste_go</i>
                        Pegar todo el pedido
                    </span>
                </div>
                <p style="padding: 15px 0px 30px 0px;" class="txt-right">Información general:</p>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Fecha:</p>
                        <input class="input" type="date" name="Fecha" id="Fecha">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Empresa:</p>
                        <select class="input" name="empresas" id="empresas">
                            <option value="">Selecciona la empresa</option>
                        </select>
                    </div>
                </div>
                <div class="d-grid g-1">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Proveedor:</p>
                        <select class="input" name="proveedores" id="proveedores">
                            <option value="">Selecciona un proveedor</option>
                        </select>
                    </div>
                </div>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Solicitado por:</p>
                        <input type="text" name="solicitado" id="solicitado">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Terminos de pago:</p>
                        <input type="text" name="terminos" id="terminos">
                    </div>
                </div>
                <div class="d-grid g-1 grid-gap-0">
                    <p>Contacto:</p>
                    <input type="text" name="contacto" id="contacto">
                </div>
                <div id="pedido_compra">
                    <p class="txt-right" style="padding: 20px 0px 20px 0px;">Producto</p>
                    <div class="d-grid g-2">
                        <div id="pedido_1" class="d-grid g-1 grid-gap-0">
                            <p>Código:</p>
                            <input type="number" name="" id="">
                        </div>
                        <div id="pedido_1" class="d-grid g-1 grid-gap-0">
                            <p>Producto:</p>
                            <input type="text" name="" id="">
                        </div>
                    </div>
                    <div class="d-grid g-2">
                        <div id="pedido_1" class="d-grid g-1 grid-gap-0">
                            <p>Cantidad:</p>
                            <input type="text" name="" id="">
                        </div>
                        <div id="pedido_1" class="d-grid g-1 grid-gap-0">
                            <p>Precio Unitario:</p>
                            <input type="text" name="" id="">
                        </div>
                    </div>
                </div>
                <div class="d-grid g-1">
                    <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Registrar</button>
                </div>
                <div class="d-grid g-2">
                    <label class="btn btn-transparent txt-center" id="btn-limpiar">Limpiar</label>
                    <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-ingresar">Cancelar</label>
                </div>
            </form>
        </div>
    </div>