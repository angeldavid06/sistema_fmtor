<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Ordenes de Compra</title>
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
                        <h1>Ordenes de Compra</h1>
                    </div>
                    <div class="d-flex justify-right align-content-center">
                        <button title="Recargar" class="material-icons btn btn-icon-self btn-transparent" data-recarga="true">loop</button>
                        <button title="Nueva Salida de Almacen" class="material-icons btn btn-icon-self btn-transparent" data-modal="modal-ingresar">add</button>
                        <button title="Filtrar Información" class="material-icons btn btn-icon-self btn-transparent" data-modal="modal-filtrar">filter_alt</button>
                        <!-- <button title="Generar Reporte" class="material-icons btn btn-icon-self">description</button> -->
                    </div>
                </div>
                <div class="tabla tarjeta" style="padding: 0;">
                    <table class="table table_salida lista_salida">
                        <thead>
                            <th style="min-width: 80px;"># O.C. </th>
                            <th style="min-width: 100px;">Fecha</th>
                            <th>Empresa</th>
                            <th>Solicitado por:</th>
                            <th>Proveedor:</th>
                            <th style="max-width: 80px;"></th>
                            <th style="max-width: 80px;"></th>
                            <th style="max-width: 80px;"></th>
                        </thead>
                        <tbody id="body" class="body body_salida"></tbody>
                        <tfoot class="tfoot"></tfoot>
                    </table>
                </div>
            </div>
        </div>
        <?php require_once 'public/modules/ventas/compras_modal.php'; ?>
        <script src="../public/js/fmtor_libreria.js"></script>
        <script src="../public/js/ventas/functions_compra.js"></script>
        <script src="../public/js/ventas/compra_pedidos.js"></script>
</body>
</body>
</body>

</html>