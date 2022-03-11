<!DOCTYPE html>
<html lang="en">

<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Proveedores</title>
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
                        <h1>Lista de Proveedores</h1>
                    </div>
                    <!-- boton de buscar e imprimir -->
                    <div class="d-flex justify-right align-content-center">
                        <button class="material-icons btn btn-icon-self" id="btn-form-control" data-modal="modal-ingresar">local_shipping</button>
                    </div>
                </div>
                <!-- Tabla -->
                <div class="tabla tarjeta" style="padding: 0;">
                    <table class="table table_clientes lista_clientes" id="listaClientes">
                        <thead>
                            <!-- <th> Numero de identificacion</th> -->
                            <th style="min-width: 200px;">Proveedor</th>
                            <th style="min-width: 400px;">Direccion</th>
                            <th>Ciudad</th>
                            <th style="min-width: 150px;">Telefono</th>
                            <th>Correo</th>
                            <th></th>
                            <th></th>

                        </thead>
                        <tbody id="body_proveedores" class="body body_clientes"></tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>

    <?php
    require_once 'public/modules/ventas/proveedores_modal.php';
    ?>

    <script src="../public/js/fmtor_libreria.js"></script>
    <script src="../public/js/ventas/functions_proveedor.js"></script>
</body>

</html>