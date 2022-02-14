 <!DOCTYPE html>
<html lang="en">

<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Página Principal</title>
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
                        <h1>Lista de Cotizacion</h1>
                    </div>
                    <div class="d-flex justify-right align-content-center">
                        <!-- boton de agregar -->
                        <button class="material-icons btn btn-icon-self" id="btn-form-control" data-modal="modal-ingresar">group_add</button>
                    </div>
                </div>

                <div class="tabla tarjeta">
                    <table class="table table_cotizacion lista_cotizacion" id="listaCotizacion">
                        <thead>
                            <th> Numero de identificacion</th>
                            <th> Fecha</th>
                            <th> Descripcion</th>
                            <th> Medida</th>
                            <th> Acabado</th>
                            <th> Cantidad por millares</th>
                            <th> Precio por millar </th>
                            <th> Cliente</th>
                            <th> Total </th>
                            <th> Importe </th>
                            <th> Iva </th>
                            <th> Total Neto </th>
                            <th> Empleado</th>
                            <th> Editar </th>
                            <th> Eliminar </th>
                            <th> Cotizacion </th>
                           
                        </thead>
                        <tbody class="body body_cotizacion"></tbody>
                    </table>
                </div>

</body>
<?php require_once 'public/modules/ventas/cotizacion_modal.php'; ?>

<script src="../public/js/fmtor_libreria.js?1.2"></script>
<script src="../public/js/ventas/functions_cotizacion.js?1.3"></script>
</body>
</body>

</html>