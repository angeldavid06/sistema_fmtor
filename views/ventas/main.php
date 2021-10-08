<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Ventas</title>
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
                <h2>Ventas</h2>
                <main>
                    <nav class="d-grid g-2">
                        <a href="http://localhost/sistema_fmtor/produccion/main/control"
                            class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">insert_emoticon</i>
                            OPCIÓN DEL MENÚ
                        </a>
                        <a href="http://localhost/sistema_fmtor/produccion/main/ordenes"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">insert_emoticon</i>
                            OPCIÓN DEL MENÚ
                        </a>
                        <a href="http://localhost/sistema_fmtor/produccion/main/maquinas"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">insert_emoticon</i>
                            OPCIÓN DEL MENÚ
                        </a>
                        <a href="http://localhost/sistema_fmtor/produccion/main/estados"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">insert_emoticon</i>
                            OPCIÓN DEL MENÚ
                        </a>
                    </nav>
                </main>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js"></script>
</body>
</html>