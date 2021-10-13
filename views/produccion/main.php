<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Producción</title>
</head>
<body>
    <div class="contenedor principal">
        <a href="#top" class="btn btn-icon btn-flotante" id="btn-subir">
            <i class="material-icons">expand_less</i> 
            Subir
        </a>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/depto.php'; ?>
            <div class="informacion">
                <h2>Producción</h2>
                <main>
                    <nav class="d-grid g-2">
                        <a href="http://localhost/sistema_fmtor/produccion/main/ordenes"
                            class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">engineering</i>
                            ORDENES DE PRODUCCIÓN
                        </a>
                        <a href="http://localhost/sistema_fmtor/produccion/main/control"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">supervisor_account</i>
                            CONTROL DE PRODUCCIÓN
                        </a>
                        <a href="http://localhost/sistema_fmtor/produccion/main/maquinas"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">precision_manufacturing</i>
                            REPORTE POR MÁQUINA
                        </a>
                        <a href="http://localhost/sistema_fmtor/produccion/main/estados"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">verified</i>
                            ESTADOS DE O.P.
                        </a>
                    </nav>
                </main>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js"></script>
</body>
</html>