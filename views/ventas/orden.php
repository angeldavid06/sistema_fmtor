<?php
require_once 'public/modules/sesion_depto.php';
if ($_SESSION['ZGVwdG8='] != 'Ventas') {
    header('Location: ' . $this->url_server . '/usuario/principal');
}
?>
<div class="tarjeta-transparente d-grid g-2" style="padding: 0;">
    <div class="d-grid">
        <h1>Ordenes de Produccion </h1>
    </div>
    <div class="d-flex justify-right align-content-center">
        <button class="btn btn-icon-self material-icons" data-modal="modal-ingresar">add</button>
        <button class="btn btn-icon-self btn-transparent material-icons" data-recarga="true">loop</button>
        <button class="btn btn-icon-self btn-transparent material-icons" data-modal="modal-filtrar">filter_alt</button>
    </div>
</div>
<!-- Tabla -->
<div class="tabla tarjeta" style="padding: 0;">
    <table class="table table_orden lista_orden" id="listaOrden">
        <thead>
            <th></th>
            <th></th>
            <th></th>
            <th>Estado</th>
            <th>O.P</th>
            <th style="min-width: 180px;">Cliente</th>
            <th style="min-width: 150px;">Costo</th>
            <th style="min-width: 100px;">Fecha </th>
            <th style="min-width: 150px;">Descripcion</th>
            <th style="min-width: 100px;">Medida</th>
            <th style="min-width: 100px;">Cantidad</th>
            <th>Acabado</th>
            <!-- <th>Codigo o Parte Cliente</th> -->
            <th>T/Termico</th>
            <th style="min-width: 100px;">Plano</th>
            <th>Material</th>
            <th style="min-width: 100px;">Fecha de entrega</th>
            <th>Salida</th>
        </thead>
        <tbody class="body body_orden"></tbody>
    </table>
</div>
<?php require_once 'public/modules/ventas/orden_modal.php'; ?>
<script src="../public/js/ventas/functions_orden.js?1.3"></script>
<script src="../public/js/ventas/filtro_orden.js"></script>