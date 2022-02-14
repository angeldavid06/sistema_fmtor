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
                   <a href="https://www.fmtor.com/ventas/main/clientes"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">face</i>
                            Lista Clientes 
                        </a>
                       <a href="https://www.fmtor.com/ventas/main/cotizacion"
                            class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">fact_check</i>
                            Cotizacion 
                        </a>
                       <a href="https://www.fmtor.com/ventas/main/salidas"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">open_in_browser</i>
                            Salidas de Almacen
                        </a>
                        
                        <a href="https://www.fmtor.com/ventas/main/orden"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">border_color</span></i>
                            Orden de Producciòn
                        </a>
                        
                       <a href="https://www.fmtor.com/ventas/main/tarjeta"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">account_tree</i>
                            Tarjeta de Flujo
                        </a>
                       
                       <a href="https://www.fmtor.com/ventas/main/reportes"
                        class="tarjeta d-flex align-content-center">
                            <i class="material-icons icon">report_problem</i>
                            Reportes
                        </a>
                        
                       
                       
                       
                        
                    </nav>
                </main>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js"></script>
</body>
</html>