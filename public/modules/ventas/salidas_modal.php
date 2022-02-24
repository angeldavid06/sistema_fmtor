    <div id="modal-ingresar" class="modal modal-derecha abrir_modal width-05">
        <div class="titulo_modal d-flex justify-between align-content-center">
            <h2>Nueva Salida</h2>
            <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-ingresar">close</button>
        </div>
        <div class="contenido_modal">
            <form id="form_reg_salida">
                <div class="d-grid g-2">
                    <span data-pegar="pegar-cliente" class="btn btn-icon d-flex justify-center" title="Pegar información del portapapeles">
                        <i data-pegar="pegar-cliente" class="material-icons-round">content_paste_go</i>
                        Pegar información del cliente
                    </span>
                    <span data-pegar="pegar-todo" class="btn btn-transparent btn-icon d-flex justify-center" title="Pegar información del portapapeles">
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
                        <p>Fecha de entrega :</p>
                        <input class="input" type="date" name="Fecha_entrega" id="Fecha_entrega">
                    </div>
                </div>
                <p style="padding: 15px 0px 30px 0px;" class="txt-right">Información del cliente:</p>
                <div class="d-grid g-1">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Cliente:</p>
                        <select class="input" name="Id_Clientes_2" id="Id_Clientes_2">
                            <option value="">Selecciona un cliente</option>
                        </select>
                    </div>
                </div>
                <div class="d-grid g-3">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>No. Parte cliente:</p>
                        <input class="input" type="text" name="Codigo" id="Codigo" placeholder="Ingrese el codigo">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Pedido Cliente:</p>
                        <input class="input" type="text" name="Pedido_pza" id="Pedido_pza">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Cantidad de Tornillos:</p>
                        <input class="input" type="number" name="Cantidad_Tornillos" id="Cantidad_Tornillos" value="1">
                    </div>
                </div>
                <div class="d-grid g-2">
                    <div class="d-grid g-1">
                        <p style="padding: 15px 0px 30px 0px;" class="txt-left" id="cantidad_tornillos_pedidos">Información del tornillo (1):</p>
                    </div>
                    <div class="d-flex justify-right align-content-center">
                        <span data-tornillo="mas" class="btn btn-transparent btn-icon-self material-icons">add</span>
                        <span data-tornillo="menos" class="btn btn-transparent btn-icon-self material-icons">remove</span>
                    </div>
                </div>
                <div id="tornillos">
                    <div class="tornillo" id="tornillo-1">
                        <div class="d-grid g-2">
                            <div class="d-grid g-1">
                                <p style="padding: 15px 0px 30px 0px;" class="txt-left">TORNILLO 1:</p>
                            </div>
                            <div class="d-flex justify-right align-content-center">
                                <label data-pedido="1" class="btn btn-icon-self material-icons">content_paste_go</label>
                            </div>
                        </div>
                        <div class="d-grid g-3">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Cantidad (millares):</p>
                                <input class="input" type="text" name="Cantidad_millares_1" id="Cantidad_millares_1">
                            </div>
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Descripcion:</p>
                                <input type="text" class="input" name="Descripcion_1" id="Descripcion_1">
                            </div>
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Medida:</p>
                                <input class="input" type="text" name="Medida_1" id="Medida_1">
                            </div>
                        </div>
                        <div class="d-grid g-3">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Factor:</p>
                                <input class="input" type="text" name="factor_1" id="factor_1">
                            </div>
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Acabado:</p>
                                <select class="input" name="Acabado_1" id="Acabado_1">
                                    <option value="">Selecciona un acabado</option>
                                    <option value="GALVANIZADO">GALVANIZADO</option>
                                    <option value="PULIDO">PULIDO</option>
                                    <option value="ZINCADO NEGRO">ZINCADO NEGRO</option>
                                    <option value="ZINCADO ESPAÑOL">ZINCADO ESPAÑOL</option>
                                    <option value="TROPICALIZADO">TROPICALIZADO</option>
                                    <option value="PAVONADO">PAVONADO</option>
                                    <option value="INOXIDABLE">INOXIDABLE</option>
                                    <option value="NIQUELADO">NIQUELADO</option>
                                </select>
                            </div>
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Material:</p>
                                <input class="input" type="text" name="Material_1" id="Material_1">
                            </div>
                        </div>
                        <div class="d-grid g-3">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Costo:</p>
                                <input class="input" type="text" name="Precio_millar_1" id="Precio_millar_1">
                            </div>
                            <div class="d-flex align-content-bottom justify-left">
                                <input type="checkbox" name="tratamiento_1" id="tratamiento_1">
                                <label class="lbl-checkbox" for="tratamiento_1" style="margin: 0px 0px 30px 0px;">T/TERMICO</label>
                            </div>
                        </div>
                        <p style="padding: 15px 0px 30px 0px;" class="txt-right">Orden de Producción:</p>
                        <div class="d-grid g-1">
                            <input type="checkbox" name="sin_op_1" id="sin_op_1">
                            <label class="lbl-checkbox" id="lbl_checkbox_salida" for="sin_op_1" style="margin: 0 0 15px 0;">Sin
                                O.P.:</label>
                        </div>
                        <div class="d-grid g-2">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>No. de Dibujo:</p>
                                <input class="input" type="text" name="Dibujo_1" id="Dibujo_1" placeholder="Ingrese el numero de plano">
                            </div>
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Cantidad a Producir (millares):</p>
                                <input class="input" type="number" name="cantidad_producir_1" id="cantidad_producir_1">
                            </div>
                        </div>
                    </div>
                </div>
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
                <!-- <p>Salida De Almacen:</p> -->
                <input class="input" type="text" name="Salida_edit" id="Salida_edit" hidden>
                <p style="padding: 0px 0px 30px 0px;" class="txt-right">Información general:</p>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Fecha:</p>
                        <input class="input" type="date" name="Fecha_edit" id="Fecha_edit">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Fecha de entrega :</p>
                        <input class="input" type="date" name="Fecha_entrega_edit" id="Fecha_entrega_edit">
                    </div>
                </div>
                <p style="padding: 15px 0px 30px 0px;" class="txt-right">Información del cliente:</p>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Cliente:</p>
                        <!-- <input class="input" type="text" name="Id_Clientes_2_edit" id="Id_Clientes_2_edit"> -->
                        <!-- <input class="input" type="text" name="Id_Clientes_2" id="Id_Clientes_2"> -->
                        <select name="Id_Clientes_2_edit" id="Id_Clientes_2_edit">
                            <option value="">Selecciona un cliente</option>
                        </select>
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>No.Parte cliente:</p>
                        <input class="input" type="text" name="Codigo_edit" id="Codigo_edit" placeholder="Ingrese el codigo">
                    </div>
                </div>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Cantidad (millares):</p>
                        <input class="input" type="text" name="Cantidad_millares_edit" id="Cantidad_millares_edit">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Pedido Cliente:</p>
                        <input class="input" type="text" name="Pedido_pza_edit" id="Pedido_pza_edit">
                    </div>
                </div>
                <p style="padding: 15px 0px 30px 0px;" class="txt-right">Orden de Producción:</p>
                <!-- <div class="d-grid g-1">
                <input type="checkbox" name="salida_op" id="salida_op" value="sin_op">
                <label class="lbl-checkbox" id="lbl_checkbox_salida" for="salida_op" style="margin: 0 0 15px 0;">Sin O.P.:</label>
            </div> -->
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Cantidad a Producir (millares):</p>
                        <input class="input" type="number" name="cantidad_producir_edit" id="cantidad_producir_edit">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Factura:</p>
                        <input class="input" type="text" name="Factura_edit" id="Factura_edit">
                    </div>
                </div>
                <p style="padding: 15px 0px 30px 0px;" class="txt-right">Información del tornillo:</p>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>No. de Dibujo:</p>
                        <input class="input" type="text" name="Dibujo_edit" id="Dibujo_edit" placeholder="Ingrese el numero de plano">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Descripcion:</p>
                        <input type="text" class="input" name="Descripcion_edit" id="Descripcion_edit">
                    </div>
                </div>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Medida:</p>
                        <input class="input" type="text" name="Medida_edit" id="Medida_edit">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Factor:</p>
                        <input class="input" type="text" name="factor" id="factor">
                    </div>
                </div>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Acabado:</p>
                        <!-- <input class="input" type="text" name="Acabado_edit" id="Acabado_edit"> -->
                        <select class="input" name="Acabado_edit" id="Acabado_edit">
                            <option value="">Selecciona un acabado</option>
                            <option value="GALVANIZADO">GALVANIZADO</option>
                            <option value="PULIDO">PULIDO</option>
                            <option value="ZINCADO NEGRO">ZINCADO NEGRO</option>
                            <option value="ZINCADO ESPAÑOL">ZINCADO ESPAÑOL</option>
                            <option value="TROPICALIZADO">TROPICALIZADO</option>
                            <option value="PAVONADO">PAVONADO</option>
                            <option value="INOXIDABLE">INOXIDABLE</option>
                            <option value="NIQUELADO">NIQUELADO</option>
                        </select>
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Material:</p>
                        <input class="input" type="text" name="Material_edit" id="Material_edit">
                    </div>
                </div>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Costo:</p>
                        <input class="input" type="text" name="Precio_millar_edit" id="Precio_millar_edit">
                    </div>
                </div>
                <div class="opciones d-flex flex-column">
                    <button data-btn="actualizar" class="btn" id="btn-form-control-actualizar">Actualizar</button>
                    <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-actualizar">Cancelar</label>
                </div>
            </form>
        </div>
    </div>
    <div id="modal-historial" class="modal modal-izquierda">
        <div class="titulo_modal d-flex justify-between align-content-center">
            <h2>Historial </h2>
            <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-historial">close</button>
        </div>
        <div class="contenido_modal">
            <table class="table table_salida lista_salida" id="table">
                <thead>
                    <th></th>
                    <th style="min-width: 80px;">N° de salida </th>
                    <th style="min-width: 150px;">Cliente</th>
                    <th style="min-width: 100px;">Fecha</th>
                    <th>Cantidad</th>
                    <th style="min-width: 150px;">N° parte de cliente </th>
                    <th style="min-width: 100px;">Pedido Cliente</th>
                    <th>Medida</th>
                    <th style="min-width: 150px;">Descripcion </th>
                    <th>Acabado</th>
                    <th style="min-width: 100px;">Costo</th>
                    <th style="min-width: 120px;">Numero de Dibujo </th>
                    <th>Material </th>
                    <th>O.P</th>
                    <th style="min-width: 100px;">Fecha de entrega</th>
                    <th style="min-width: 80px;"></th>
                </thead>
                <tbody class="body body_salida"></tbody>
            </table>
        </div>
    </div>