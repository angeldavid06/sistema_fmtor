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
                    <h1>Salida de Almacen </h1>
                </div>
                <div class="tarjeta-transparente d-flex align-content-center">
                    <input type="number" name="id_folio" id="id_folio" data-control="" placeholder="Ingrese el numero de salida">
                    <button class="btn btn-icon-self material-icons"id="clave">search</button>
                    <!-- boton de agregar -->
                    <button class="material-icons btn btn-icon-self" id="btn-form-control" data-modal="modal-ingresar">group_add</button>
                </div>
             
                <div class="tabla tarjeta">
                    <table class="table table_salida lista_salida" id="listaSalida">
                        <thead>
                            <th> N° de salida </th>
                            <th> Cliente</th>
                            <th style="min-width: 100px;"> Fecha</th>
                            <th> Cantidad</th>
                            <th> N° parte de cliente </th>
                            <th> Pedido Cliente</th>
                            <th> Medida</th>
                            <th style="min-width: 150px;"> Descripcion </th>
                            <th> Acabado</th>
                            <th> Costo</th>
                            <th> Factura </th>
                            <th style="min-width: 100px;"> Numero de Dibujo </th>
                            <th> Material </th>
                            <th> O.P</th>
                            <th style="min-width: 100px;"> Fecha de entrega</th>
                              <th> Editar </th>
                            <th> Salida de Almacen</th>
                        </thead>
                        <tbody class="body body_salida"></tbody>
                    </table>
                </div>

</body>
<?php require_once 'public/modules/ventas/salidas_modal.php'; ?>


<script src="../public/js/fmtor_libreria.js?1.2"></script>

<script src="../public/js/ventas/functions_salida.js?1.3"></script>
</body>
</body>

</html>