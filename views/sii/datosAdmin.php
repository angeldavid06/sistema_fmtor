<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Principal</title>
    <link rel="stylesheet" href="../../public/css/default.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
    <div class="contenedor">
        <a href="#top" class="btn btn-icon btn-flotante" id="btn-subir">
            <i class="material-icons">expand_less</i> 
            Subir
        </a>
        <?php require_once 'public/modules/menus/sii.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
                <h1>Datos Personales</h1>
                <div class="d-grid g-2">
                    <input type="search" name="" id="buscadorSII">
                </div>
               
                <div class="tarjeta">
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Fecha de Nacimiento</th>
                            <th>Telefono</th>
                            <th>Correo</th>
                            <th>CURP</th>
                            <th>RFC</th>
                            <th>NSS</th>
                            <th>Estado</th>
                            <th>fecha de Ingreso</th>
                        </tr>
                    </thead>
                    <tbody class="t_body">
                        <!-- <tr>
                            <td><h5 id="nombre"></h5></td>
                            <td><h5 id="apellidoP"></h5></td>
                            <td><h5 id="apellidoM"></h5></td>
                            <td><h5 id="fechaNacimiento"></h5></td>
                            <td><h5 id="telefono"></h5></td>
                            <td><h5 id="correo"></h5></td>
                            <td><h5 id="CURP"></h5></td>
                            <td><h5 id="RFC"></h5></td>
                            <td><h5 id="NSS"></h5></td>
                            <td><h5 id="estado"></h5></td>
                            <td><h5 id="fechaIngreso"></h5></td>
                        </tr> -->
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js"></script>
    <script src="../../public/js/sii/datosPersonales.js?1.4"></script>
</body>
</html>