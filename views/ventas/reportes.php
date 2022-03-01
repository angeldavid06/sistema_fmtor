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
                <h1>Reportes Mensuales </h1>
                <div class="options d-flex align-content-center">
                    <input type="number" name="Id_reporte" id="id_reporte" data-control="" placeholder="Buscar Formulario">
                    <button class="btn btn-icon-self material-icons" id="clave">search</button>
                    <!-- boton de agregar -->
                    <button class="material-icons btn btn-icon-self" id="btn-form-control" data-modal="modal-registrar">app_registration</button>
                </div>
                <div class="tabla tarjeta" style="padding: 0;">
                    <table class="table table_reporte lista_reporte">
                        <thead>
                            <th>Numero de reporte</th>
                            <th>Mes de creacion</th>
                            <th> Editar </th>
                            <th> Archivo </th>
                            <th> Eliminar </th>
                        </thead>
                        <tbody class="body body_reporte"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <?php require_once 'public/modules/ventas/reportes_modal.php'; ?>
    <?php require_once 'public/modules/ventas/reporte_modal.php'; ?>
    <script src="../public/js/fmtor_libreria.js?1.2"></script>
    <script src="../public/js/ventas/functions_reportes.js?1.3"></script>
</body>