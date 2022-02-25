<!DOCTYPE html>
<html lang="en">

<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Salidas de Almacen</title>
</head>

<body>
    <div class="contenedor">
        <a href="#top" class="btn btn-icon btn-flotante btn-icon-self material-icons" id="btn-subir">expand_less
        </a>
        <?php require_once 'public/modules/menus/menu_usuario.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
                <div class="tarjeta-transparente d-grid g-2" style="padding: 0;">
                    <div class="d-grid g-1">
                        <h1>Salida de Almacen </h1>
                    </div>
                    <div class="d-flex justify-right align-content-center">
                        <button title="Recargar" class="material-icons btn btn-icon-self btn-transparent" data-recarga="true">loop</button>
                        <button title="Nueva Salida de Almacen" class="material-icons btn btn-icon-self btn-transparent" data-modal="modal-ingresar">add</button>
                        <button title="Filtrar Información" class="material-icons btn btn-icon-self btn-transparent" data-modal="modal-filtrar">filter_alt</button>
                        <button title="Generar Reporte" class="material-icons btn btn-icon-self">description</button>
                    </div>
                </div>
                <div class="tabla tarjeta" style="padding: 0;">
                    <table class="table table_salida lista_salida" id="table">
                        <thead>
                            <th style="min-width: 80px;">N° de salida </th>
                            <th style="min-width: 150px;">Cliente</th>
                            <th style="min-width: 100px;">Fecha</th>
                            <!-- <th>Cantidad</th>
                            <th style="min-width: 150px;">N° parte de cliente </th>
                            <th style="min-width: 100px;">Pedido Cliente</th>
                            <th>Medida</th>
                            <th style="min-width: 150px;">Descripcion </th>
                            <th>Acabado</th>
                            <th style="min-width: 100px;">Costo</th>
                            <th style="min-width: 120px;">Numero de Dibujo </th>
                            <th>Material </th>
                            <th>O.P</th>
                            <th style="min-width: 100px;">Fecha de entrega</th> -->
                            <th></th>
                            <th></th>
                            <th style="min-width: 80px;"></th>
                            <th style="min-width: 80px;"></th>
                            <th style="min-width: 80px;"></th>
                        </thead>
                        <tbody class="body body_salida"></tbody>
                    </table>
                </div>
            </div>
        </div>
        <?php require_once 'public/modules/ventas/salidas_almacen_modal.php'; ?>
        <?php require_once 'public/modules/ventas/salidas_modal.php'; ?>
</body>
<script src="../public/js/fmtor_libreria.js?1.2"></script>
<script src="../public/js/ventas/functions_salida.js?1.3"></script>
<script src="../public/js/ventas/filtros.js"></script>
<script src="../public/js/ventas/no_tornillos.js"></script>
</body>
</body>

</html>