<?php require_once 'public/modules/sesion_depto.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Estado de las O.P.</title>
</head>
<body>
    <div class="contenedor">
        <a href="#top" class="btn btn-icon-self btn-flotante material-icons" id="btn-subir">
            expand_less
        </a>
        <?php require_once 'public/modules/menus/menu_usuario.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
                <div class="d-grid g2-7-3">
                    <div style="padding-top: 0px;" class="tarjeta-transparente">
                        <h1>Estado de las Ordenes de Producción</h1>
                    </div>
                    <div style="padding-top: 0px;" class="tarjeta-transparente d-flex justify-right align-content-center flex-wrap">
                        <button class="btn-impresion btn btn-icon btn-transparent" data-impresion="documento">
                            <i class="material-icons">description</i>
                            Generar Documento 
                        </button>
                    </div>
                </div>
                <div class="tarjeta-transparente d-grid g-1" id="estados">
                </div>
            </div>
        </div>
    </div>
    <script src="../public/js/fmtor_libreria.js"></script>
    <script src="../public/js/produccion/estado_op.js"></script>
</body>
</html>