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
                    Pegar inf. O. C.
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
                <input class="input" type="number" name="Cantidad_Tornillos" id="Cantidad_Tornillos" value="1" hidden>
            </div>
            <div class="d-grid g-2">
                <div class="d-grid g-1">
                    <p style="padding: 15px 0px 30px 0px;" class="txt-left" id="cantidad_tornillos_pedidos">Información del producto (1):</p>
                </div>
                <div class="d-flex justify-right align-content-center">
                    <span data-tornillo="mas" class="btn btn-transparent btn-icon-self material-icons">add</span>
                    <span data-tornillo="menos" class="btn btn-transparent btn-icon-self material-icons">remove</span>
                </div>
            </div>
            <div id="pedido_compra">
                <div id="pedido_1" class="pedido">
                    <div class="d-grid g-2">
                        <div class="d-grid g-1">
                            <p style="padding: 15px 0px 30px 0px;" class="txt-left">TORNILLO 1:</p>
                        </div>
                        <div class="d-flex justify-right align-content-center">
                            <label title="Pegar información del tornillo 1" data-p="1" class="btn btn-icon-self material-icons">content_paste_go</label>
                        </div>
                    </div>
                    <div class="d-grid g-2">
                        <div class="d-grid g-1 grid-gap-0">
                            <p>Código:</p>
                            <input type="number" name="codigo_1" id="codigo_1">
                        </div>
                        <div class="d-grid g-1 grid-gap-0">
                            <p>Producto:</p>
                            <input type="text" name="producto_1" id="producto_1">
                        </div>
                    </div>
                    <div class="d-grid g-2">
                        <div class="d-grid g-1 grid-gap-0">
                            <p>Cantidad:</p>
                            <input type="text" name="cantidad_1" id="cantidad_1">
                        </div>
                        <div class="d-grid g-1 grid-gap-0">
                            <p>Precio Unitario:</p>
                            <input type="text" name="precio_1" id="precio_1">
                        </div>
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
<div id="modal-historial" class="modal modal-izquierda width-05">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2 id="orden_de_compra">Orden de Compra: </h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-historial">close</button>
    </div>
    <div class="contenido_modal">
        <table class="table table_salida lista_salida" id="table">
            <thead>
                <th style="min-width: 60px;"></th>
                <th style="min-width: 60px;"></th>
                <th style="min-width: 100px;">Codigo</th>
                <th style="min-width: 150px;">Producto</th>
                <th style="min-width: 100px;">Cantidad</th>
                <th style="min-width: 100px;">Precio</th>
            </thead>
            <tbody id="body_historial"></tbody>
        </table>
    </div>
</div>
<div id="modal-actualizar" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Actualizar Orden de Compra</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-actualizar">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form_act_orden">
            <!-- <p style="padding: 15px 0px 30px 0px;" class="txt-right">Información general:</p> -->
            <input class="input" type="number" name="Id_Compra_p" id="Id_Compra_p" hidden>
            <div class="d-grid g-2">
                <div class="d-grid g-1 grid-gap-0">
                    <p>Fecha:</p>
                    <input class="input" type="date" name="Fecha_p" id="Fecha_p">
                </div>
                <div class="d-grid g-1 grid-gap-0">
                    <p>Empresa:</p>
                    <select class="input" name="empresas_p" id="empresas_p">
                        <option value="">Selecciona la empresa</option>
                    </select>
                </div>
            </div>
            <div class="d-grid g-1">
                <div class="d-grid g-1 grid-gap-0">
                    <p>Proveedor:</p>
                    <select class="input" name="proveedores_p" id="proveedores_p">
                        <option value="">Selecciona un proveedor</option>
                    </select>
                </div>
            </div>
            <div class="d-grid g-2">
                <div class="d-grid g-1 grid-gap-0">
                    <p>Solicitado por:</p>
                    <input type="text" name="solicitado_p" id="solicitado_p">
                </div>
                <div class="d-grid g-1 grid-gap-0">
                    <p>Terminos de pago:</p>
                    <input type="text" name="terminos_p" id="terminos_p">
                </div>
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <p>Contacto:</p>
                <input type="text" name="contacto_p" id="contacto_p">
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Registrar</button>
                <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-actualizar">Cancelar</label>
            </div>
        </form>
    </div>
</div>
<div id="modal-actualizar-tornillo" class="modal modal-derecha">
    <div class="titulo_modal d-flex justify-between align-content-center">
        <h2>Modificar producto</h2>
        <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-actualizar-tornillo">close</button>
    </div>
    <div class="contenido_modal">
        <form id="form_act_orden_pedido">
            <div id="pedido_compra">
                <div id="pedido_E">
                    <input type="number" name="id_pedido" id="id_pedido" hidden>
                    <div class="d-grid g-2">
                        <div class="d-grid g-1 grid-gap-0">
                            <p>Código:</p>
                            <input type="number" name="codigo_p" id="codigo_p">
                        </div>
                        <div class="d-grid g-1 grid-gap-0">
                            <p>Producto:</p>
                            <input type="text" name="producto_p" id="producto_p">
                        </div>
                    </div>
                    <div class="d-grid g-2">
                        <div class="d-grid g-1 grid-gap-0">
                            <p>Cantidad:</p>
                            <input type="text" name="cantidad_p" id="cantidad_p">
                        </div>
                        <div class="d-grid g-1 grid-gap-0">
                            <p>Precio Unitario:</p>
                            <input type="text" name="precio_p" id="precio_p">
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-grid g-1 grid-gap-0">
                <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Registrar</button>
                <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-actualizar-tornillo">Cancelar</label>
            </div>
        </form>
    </div>
</div>