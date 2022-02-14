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
                    <h1>Ordenes de Produccion </h1>
                </div>
                <!-- boton de buscar e imprimir -->
                <div class="tarjeta-transparente d-flex align-content-center">
                    <input type="number" name="Id_Folio" id="id_folio" data-control="" placeholder="Buscar la OP"> 
                    <button class="btn btn-icon-self material-icons"id="clave">search</button>
                </div>
                <!-- Tabla -->
                <div class="tabla tarjeta">
                    <table class="table table_orden lista_orden" id="listaOrden">
                        <thead>
                            <th>O.P</th>
                            <th style="min-width: 180px;">Cliente</th>
                            <th>Costo</th>
                            <th style="min-width: 100px;">Fecha </th>
                            <th style="min-width: 150px;">Descripcion</th>
                            <th>Medida</th>
                            <th>Cantidad</th>
                            <th>Acabado</th>
                            <th>Codigo o Parte Cliente</th>
                            <th>T/Termico</th>
                            <th style="min-width: 100px;">Plano</th>
                            <th>Material</th>
                            <th style="min-width: 100px;">Fecha de entrega</th>
                            <th>Salida</th>
                            <th>Agrega Tratamiento de Orden</th>
                            <th>Orden de Produccion</th>
                            <th>Control de Produccion</th>
                        </thead>
                        <tbody class="body body_orden"></tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>

    <?php require_once 'public/modules/ventas/orden_modal.php'; ?>

    <script src="../public/js/fmtor_libreria.js?1.2"></script>
    <script src="../public/js/ventas/functions_orden.js?1.3"></script>
</body>

</html>