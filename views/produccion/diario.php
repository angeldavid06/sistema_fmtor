<?php require_once 'public/modules/sesion_depto.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Registro Diario de Producción</title>
</head>
<body>
    <div class="contenedor">
        <a href="#top" class="btn btn-icon btn-flotante btn-icon-self material-icons" id="btn-subir">expand_less
        </a>
        <?php require_once 'public/modules/menus/menu_usuario.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
                <div class="d-grid g2-5-5">
                    <div style="padding-top: 0px;" class="tarjeta-transparente">
                        <h1>Registro Diario de Producción</h1>
                    </div>
                    <div style="padding-top: 0px;" class="tarjeta-transparente d-flex justify-right align-content-center flex-wrap">
                        <?php if ($_SESSION['cm9s'] == 'Administrativo') { ?>
                            <button data-modal="modal-ingresar-diario" title="Nuevo registro diario" class="material-icons btn btn-icon-self" id="btn-form-control">add</button>
                        <?php } ?>
                    </div>
                </div>
                <div class="tarjeta-transparente">
                    <div class="d-grid g-2">
                        <div class="d-grid g-1 grid-gap-0">
                            <label for="fecha_reporte">Selecciona una fecha:</label>
                            <input type="date" name="fecha_reporte" id="fecha_reporte">
                        </div>
                        <div class="d-grid g-1 grid-gap-0">
                            <label for="select_estado">Estados de producción</label>
                            <select name="select_estado" id="select_estado">
                                <option value="">Selecciona un estado de producción:</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="tarjeta">
                    <table>
                        <thead>
                            <tr>
                                <th>Turno</th>
                                <th>Id_Folio</th>
                                <th>Cliente</th>
                                <th>Kilos</th>
                                <th>Pzas</th>
                                <th>Maquina</th>
                                <th>Descripción</th>
                                <th>Observaciones</th>
                                <?php if ($_SESSION['cm9s'] == 'Administrativo') { ?>
                                    <th style="min-width: 80px;"></th>
                                    <th style="min-width: 80px;"></th>
                                <?php } ?>
                            </tr>
                        </thead>
                        <tbody id="body">
                        </tbody>
                    </table>
                </div>
                <?php
                    if ($_SESSION['cm9s'] == 'Administrativo') {
                        require_once 'public/modules/produccion/control_modal.php';
                    } 
                ?>
            </div>
        </div>
    </div>
    <script src="../public/js/fmtor_libreria.js"></script>
    <?php if ($_SESSION['cm9s'] == 'Administrativo') { ?>
        <script src="../public/js/produccion/render_diario_admin.js"></script>
    <?php } else { ?>
        <script src="../public/js/produccion/render_diario_usuario.js"></script>
    <?php } ?>
    <script src="../public/js/produccion/diario.js"></script>
</body>
</html>