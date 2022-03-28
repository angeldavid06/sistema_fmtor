    <div id="modal-ingresar" class="modal modal-derecha width-04">
        <div class="titulo_modal d-flex justify-between align-content-center">
            <h2>Nueva Salida</h2>
            <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-ingresar">close</button>
        </div>
        <div class="contenido_modal">
            <form id="form_reg_salida">
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
                        <p>Cliente:</p>
                        <select class="input" name="Id_Clientes_2" id="Id_Clientes_2">
                            <option value="">Selecciona un cliente</option>
                        </select>
                    </div>
                    <input class="input" type="number" name="Cantidad_Tornillos" id="Cantidad_Tornillos" value="1" hidden>
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
                                <label title="Pegar información del tornillo 1" data-p="1" class="btn btn-icon-self material-icons">content_paste_go</label>
                            </div>
                        </div>
                        <div class="d-grid g-1">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Fecha de entrega :</p>
                                <input class="input" type="date" name="Fecha_entrega_1" id="Fecha_entrega_1">
                            </div>
                        </div>
                        <div class="d-grid g-2">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>No. Parte cliente:</p>
                                <input class="input" type="text" name="Codigo_1" id="Codigo_1" placeholder="Ingrese el codigo">
                            </div>
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Pedido Cliente:</p>
                                <input class="input" type="text" name="Pedido_pza_1" id="Pedido_pza_1">
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
                        <div class="d-grid g-2">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Factor:</p>
                                <input class="input" type="text" name="factor_1" id="factor_1">
                            </div>
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Acabado:</p>
                                <select class="input" name="Acabado_1" id="Acabado_1">
                                    <option value="">Selecciona un acabado</option>
                                    <option value="TROPICALIZADO">TROPICALIZADO</option>
                                    <option value="GALVANIZADO">GALVANIZADO Blanco</option>
                                    <option value="GALVANIZADO">GALVANIZADO Azul/GALVANIZADO Electrolitico Azul</option>
                                    <option value="ZINCADO NEGRO">ZINCADO NEGRO</option>
                                    <option value="NÍQUEL">NÍQUEL</option>
                                    <option value="PULIDO">PULIDO</option>
                                    <option value="PAVONADO">PAVONADO</option>
                                    <option value="LATÓNADO">LATÓNADO</option>
                                    <option value="COBRE">COBRE</option>
                                    <option value="VERDE VIEJO">VERDE VIEJO</option>
                                    <option value="VERDE OLIVO">VERDE OLIVO</option>
                                </select>
                            </div>
                        </div>
                        <div class="d-grid g-2">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Material:</p>
                                <input class="input" type="text" name="Material_1" id="Material_1">
                            </div>
                            <div class="d-flex justify-center align-content-center">
                                <div class="d-grid g-1 grid-gap-0">
                                    <p>Costo:</p>
                                    <input class="input" type="text" name="Precio_millar_1" id="Precio_millar_1">
                                </div>
                                <label class="btn btn-icon-self material-icons" title="Obtener Costo" style="margin: 0px 0px 0px 5px;">attach_money</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-grid g-1">
                    <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Registrar</button>
                </div>
                <div class="d-grid g-2">
                    <!-- <button data-btn="insertar" class="btn" id="btn-form-control-registrar">Registrar</button> -->
                    <label class="btn btn-transparent txt-center" id="btn-limpiar">Limpiar</label>
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
                <input class="input" type="text" name="Pedido_p" id="Pedido_p" hidden>
                <p style="padding: 0px 0px 10px 0px;" class="txt-right">Información general:</p>
                <div class="d-grid g-1">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Fecha de entrega :</p>
                        <input class="input" type="date" name="Fecha_entrega_p" id="Fecha_entrega_p">
                    </div>
                </div>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>No. Parte cliente:</p>
                        <input class="input" type="text" name="Codigo_p" id="Codigo_p" placeholder="Ingrese el codigo">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Pedido Cliente:</p>
                        <input class="input" type="text" name="Pedido_pza_p" id="Pedido_pza_p">
                    </div>
                </div>
                <p style="padding: 15px 0px 30px 0px;" class="txt-right" id="cantidad_tornillos_pedidos">Información del tornillo:</p>
                <div id="tornillos">
                    <div class="tornillo" id="tornillo-1">
                        <div class="d-grid g-2">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Cantidad (millares):</p>
                                <input class="input" type="text" name="Cantidad_millares_p" id="Cantidad_millares_p">
                            </div>
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Descripcion:</p>
                                <input type="text" class="input" name="Descripcion_p" id="Descripcion_p">
                            </div>
                        </div>
                        <div class="d-grid g-2">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Medida:</p>
                                <input class="input" type="text" name="Medida_p" id="Medida_p">
                            </div>
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Factor:</p>
                                <input class="input" type="text" name="factor_p" id="factor_p">
                            </div>
                        </div>
                        <div class="d-grid g-2">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Acabado:</p>
                                <select class="input" name="Acabado_p" id="Acabado_p">
                                    <option value="">Selecciona un acabado</option>
                                    <option value="TROPICALIZADO">TROPICALIZADO</option>
                                    <option value="GALVANIZADO">GALVANIZADO Blanco</option>
                                    <option value="GALVANIZADO">GALVANIZADO Azul/GALVANIZADO Electrolitico Azul</option>
                                    <option value="ZINCADO NEGRO">ZINCADO NEGRO</option>
                                    <option value="NÍQUEL">NÍQUEL</option>
                                    <option value="PULIDO">PULIDO</option>
                                    <option value="PAVONADO">PAVONADO</option>
                                    <option value="LATÓNADO">LATÓNADO</option>
                                    <option value="COBRE">COBRE</option>
                                    <option value="VERDE VIEJO">VERDE VIEJO</option>
                                    <option value="VERDE OLIVO">VERDE OLIVO</option>
                                </select>
                            </div>
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Material:</p>
                                <input class="input" type="text" name="Material_p" id="Material_p">
                            </div>
                        </div>
                        <div class="d-grid g-2">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Costo:</p>
                                <input class="input" type="text" name="Precio_millar_p" id="Precio_millar_p">
                            </div>
                        </div>
                        <p style="padding: 15px 0px 30px 0px;" class="txt-right">Orden de Producción:</p>
                        <div class="d-grid g-1">
                            <input type="checkbox" name="sin_op_p" id="sin_op_p">
                            <label class="lbl-checkbox" id="lbl_checkbox_salida" for="sin_op_p" style="margin: 0 0 15px 0;">Sin
                                O.P.:</label>
                        </div>
                        <div class="d-grid g-2">
                            <div class="d-grid g-1 grid-gap-0">
                                <p>No. de Dibujo:</p>
                                <input class="input" type="text" name="Dibujo_p" id="Dibujo_p" placeholder="Ingrese el numero de plano">
                            </div>
                            <div class="d-grid g-1 grid-gap-0">
                                <p>Cantidad a Producir (millares):</p>
                                <input class="input" type="number" name="cantidad_producir_p" id="cantidad_producir_p">
                            </div>
                        </div>
                        <div class="d-grid g-2">
                            <div class="d-flex align-content-bottom justify-left">
                                <input type="checkbox" name="tratamiento_p" id="tratamiento_p">
                                <label class="lbl-checkbox" for="tratamiento_p" style="margin: 0px 0px 30px 0px;">T/TERMICO</label>
                            </div>
                        </div>
                        <div class="d-grid g-2">
                            <div class="d-grid g-1 grid-gap-0">
                                <input type="checkbox" name="op_cancelar" id="op_cancelar">
                                <label class="lbl-checkbox" id="lbl_checkbox_salida" for="op_cancelar" style="margin: 0 0 15px 0;">Cancelar
                                    O.P.:</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="opciones d-flex flex-column">
                    <button data-btn="actualizar" class="btn" id="btn-form-control-actualizar">Actualizar</button>
                    <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-actualizar">Cancelar</label>
                </div>
            </form>
        </div>
    </div>


    <div id="modal-actualizar-salida" class="modal modal-derecha">
        <div class="titulo_modal d-flex justify-between align-content-center">
            <h2>Actualizar Salida</h2>
            <button class="btn btn-icon-self btn-transparent material-icons" id="close_modal" data-modal="modal-actualizar-salida">close</button>
        </div>
        <div class="contenido_modal">
            <form id="form_act_solo_salida">
                <!-- <p>Salida De Almacen:</p> -->
                <input class="input" type="text" name="Salida_e" id="Salida_e" hidden>
                <p style="padding: 0px 0px 30px 0px;" class="txt-right">Información general:</p>
                <div class="d-grid g-2">
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Fecha:</p>
                        <input class="input" type="date" name="Fecha_e" id="Fecha_e">
                    </div>
                    <div class="d-grid g-1 grid-gap-0">
                        <p>Cliente:</p>
                        <select name="Id_Clientes_2_e" id="Id_Clientes_2_e">
                            <option value="">Selecciona un cliente</option>
                        </select>
                    </div>
                </div>
                <div class="opciones d-flex flex-column">
                    <button data-btn="actualizar" class="btn" id="btn-form-control-actualizar">Actualizar</button>
                    <label class="btn btn-transparent txt-center" id="btn-form-control-cancel" data-modal="modal-actualizar-salida">Cancelar</label>
                </div>
            </form>
        </div>
    </div>