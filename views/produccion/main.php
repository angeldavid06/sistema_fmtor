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
                <h2>Acciones rápidas</h2>
                <div class="tarjeta-transparente">
                    <div class="d-flex flex-nowrap justify-left">
                        <button class="btn btn-transparent btn-icon">
                            <i class="material-icons-round">description</i>
                            Ordenes de Producción
                        </button>
                        <button class="btn btn-transparent btn-icon">
                            <i class="material-icons-round">add</i>
                            Control de Producción
                        </button>
                        <button class="btn btn-transparent btn-icon">
                            <i class="material-icons-round">description</i>
                            Reporte Diario de Producción
                        </button>
                    </div>
                </div>
                <div class="tarjeta-transparente">
                    <h2>Producción</h2>
                    <main>
                        <nav class="d-grid g-2">
                            <a href="http://localhost/sistema_fmtor/produccion/main/ordenes"
                                class="tarjeta d-flex align-content-center">
                                <i class="material-icons-round icon">engineering</i>
                                ORDENES DE PRODUCCIÓN
                            </a>
                            <a href="http://localhost/sistema_fmtor/produccion/main/control"
                            class="tarjeta d-flex align-content-center">
                                <i class="material-icons-round icon">supervisor_account</i>
                                CONTROL DE PRODUCCIÓN
                            </a>
                            <a href="http://localhost/sistema_fmtor/produccion/main/maquinas"
                            class="tarjeta d-flex align-content-center">
                                <i class="material-icons-round icon">precision_manufacturing</i>
                                MÁQUINAS DE PRODUCCIÓN
                            </a>
                            <a href="http://localhost/sistema_fmtor/produccion/main/estados"
                            class="tarjeta d-flex align-content-center">
                                <i class="material-icons-round icon">new_releases</i>
                                ESTADO DE LAS ORDENES DE PRODUCCIÓN
                            </a>
                        </nav>
                    </main>
                </div>
            </div>
        </div>
    </div>
    <div class="alert d-flex justify-between align-content-bottom alert-rojo">
        <div class="contenido d-flex align-content-center">
            <i class="material-icons">warning</i>
            <p class="txt-left">Título </p>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js"></script>
</body>
</html>