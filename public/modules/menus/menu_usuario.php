<div class="menu hidde_menu" id="menu">
    <div class="informacion">
        <div class="foto">
            <img src="data:image/jpg;base64,<?php echo base64_encode($_SESSION['foto'])?>" alt="">
        </div>
        <div class="nombre">
            <p>
                <?php echo $_SESSION['nombre_usuario']; ?>
            </p>
            <p>
                <?php echo $_SESSION['puesto']; ?>
            </p>
        </div>
    </div>
    <div class="categoria_menu">
        <nav class="opciones">
            <a href="http://localhost/sistema_fmtor/usuario/principal">
                <i class="material-icons">apps</i>
                Menú pricipal
            </a>
        </nav>
        <div class="titulo_categoria_menu">
            <p>General</p>
        </div>
        <nav class="opciones">
            <a href="http://localhost/sistema_fmtor/produccion/main/ordenes">
                <i class="material-icons-round">person</i>
                Información Personal
            </a>
            <a href="http://localhost/sistema_fmtor/produccion/main/ordenes">
                <i class="material-icons-round">person</i>
                Caja de Ahorro
            </a>
            <a href="http://localhost/sistema_fmtor/produccion/main/ordenes">
                <i class="material-icons-round">person</i>
                Prestamos
            </a>
        </nav>
        <?php 
            if ($_SESSION['depto'] == 'Produccion' || $_SESSION['rol'] == 'SuperUsuario') {
                require_once 'produccion.php';
            }
        ?>
        <div class="titulo_categoria_menu">
            <p>Ayuda</p>
        </div>
        <nav>
            <a href="">
                <i class="material-icons-round">help</i>
                Ayuda
            </a>
            <a href="" id="cerrar-sesion">
                <i class="material-icons-round">logout</i>
                Cerrar Sesión
            </a>
        </nav>
    </div>
</div>