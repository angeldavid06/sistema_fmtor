<?php 
    if ($_SESSION['ZGVwdG8='] != 'Ventas' && $_SESSION['cm9s'] != 'SuperUsuario') {
        header('Location: ' . $this->url_server . '/usuario/principal');
    }
?>
<div class="d-grid g-2">
    <div class="d-grid d-1">
        <h1>Reportes</h1>
    </div>
    <div class="d-flex justify-right align-content-center">
        <!-- <button class="material-icons btn btn-icon-self" id="btn-form-control" data-modal="modal-registrar">app_registration</button> -->
        <button class="btn btn-icon btn-transparent">
            <i class="material-icons">print</i>
            Generar Reporte
        </button>
        <button title="Recargar" class="material-icons btn btn-icon-self btn-transparent" data-recarga="true">loop</button>
        <button data-modal="modal-filtrar" class="btn btn-icon-self btn-transparent material-icons">filter_alt</button>
    </div>
</div>
<div class="tabla tarjeta" style="padding: 0;">
    <table id="table" class="table table_salida lista_salida">
        <thead>
            <th style="min-width: 80px;">N° de salida </th>
            <th style="min-width: 220px;">Cliente</th>
            <th style="min-width: 100px;">Fecha</th>
            <th>Cantidad</th>
            <th style="min-width: 150px;">N° parte de cliente </th>
            <th style="min-width: 100px;">Pedido Cliente</th>
            <th style="min-width: 100px;">Medida</th>
            <th style="min-width: 150px;">Descripcion </th>
            <th style="min-width: 130px;">Acabado</th>
            <th style="min-width: 150px;">Costo</th>
            <th style="min-width: 120px;">Numero de Dibujo </th>
            <th>Material </th>
            <th>O.P</th>
            <th style="min-width: 100px;">Fecha de entrega</th>
        </thead>
        <tbody class="body body_reporte"></tbody>
        <tfoot class="tfoot"></tfoot>
    </table>
</div>
<?php require_once 'public/modules/ventas/reporte_modal.php'; ?>
<script src="../public/js/ventas/functions_reportes.js?1.3"></script>
<script src="../public/js/ventas/filtro_reporte.js"></script>