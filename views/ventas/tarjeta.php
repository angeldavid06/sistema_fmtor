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
                <div class="tarjeta-transparente" style="padding: 0;">
                    <h1> Tarjeta de Flujo  </h1>
                </div>

                <div class="tarjeta-transparente d-flex align-content-center">
                <input type="text" name="Id_catalogo" id="id_tarjeta" data-control="" placeholder="Numero de la Tarjeta de Flujo">
                                <button class="btn btn-icon-self material-icons"id="clave">search</button>
                </div>
             
                <div class="tabla tarjeta">
                    <table class="table table_tarjeta lista_tarjeta" id="listaTarjeta">
                        <thead>
                            <th> O.P</th>
                            <th> N° parte de cliente </th>
                            <th> T/Termico </th>
                            <th> Bote </th>
                            <th style="min-width: 150px;"> Descripcion </th>
                            <th> Medida</th>
                            <th> Acabado</th>
                            <th> Numero de Dibujo </th>
                            <th> Cliente</th>
                            <th> Salida</th>
                            <th style="min-width: 100px;"> Fecha</th>
                            <th> Material</th>
                             <th> Agrega Bote </th>
                            <th> Tarjeta de Flujo </th>
                           
                        </thead>
                        <tbody class="body body_tarjeta"></tbody>
                    </table>
                </div>

</body>
<?php require_once 'public/modules/ventas/tarjeta_modal.php'; ?>


<script src="../public/js/fmtor_libreria.js?1.2"></script>

<script src="../public/js/ventas/functions_tarjeta.js?1.3"></script>
</body>
</body>

</html>