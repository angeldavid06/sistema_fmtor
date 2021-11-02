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
                        <a href="http://localhost:8080/sistema_fmtor/ventas/main/cotizacion"
                            class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">fact_check</i>
                            Cotizacion 
                        </a>
                        <a href="http://localhost:8080/sistema_fmtor/ventas/main/salidas"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">open_in_browser</i>
                            Salidas de Almacen
                        </a>
                        <a href="http://localhost:8080/sistema_fmtor/ventas/main/controlp"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">precision_manufacturing</i>
                            Control de Produccion 
                        </a>
                        <a href="http://localhost:8080/sistema_fmtor/ventas/main/oproduccion"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">receipt_long</i>
                            Orden de Produccion
                        </a>
                        <a href="http://localhost:8080/sistema_fmtor/ventas/main/reportes"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">report_problem</i>
                            Reportes
                        </a>
                        <a href="http://localhost:8080/sistema_fmtor/ventas/main/costos"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">monetization_on</i>
                            Costos
                        </a>
                        
                        <a href="http://localhost:8080/sistema_fmtor/ventas/main/clientes"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">face</i>
                            Lista Clientes 
                        </a>

                       
                       
                        
                    </nav>
                </main>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js"></script>
</body>
</html>