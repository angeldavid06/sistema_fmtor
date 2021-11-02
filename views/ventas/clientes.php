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
        <?php require_once 'public/modules/menus/ventas.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
<<<<<<< HEAD
                <h1>Lista de clientes</h1>
                <div class="tarjeta">
    <table class =" table table-light ">
        <thead class ="thead-dark">

        <a href="registro_clientes." class= "btn_icon btn">Registrar cliente</a><p>
        <form action="buscar_clientes.php" method="get" class="form_search"> 

	<input type="text" name="busqueda" id="busqueda" placeholder="Buscar">
	<input type="submit" value="Buscar" class="btn btn-icon btn_search"><p>
</form>
            <tr>
                <th>Numero de identificacion </th>
                <th>Nombre del Clienter</th>
                <th>Razon Social </th>
                <th>Calle </th>
                <th>Colonia  </th>
                <th>C.P </th>
                <th>Alcaldia</th>
                <th>Numero de contacto  </th>
                <th>Acciones</th>

             </tr>
             
         </thead>
        </table>
        </div>
</div>
        </div>
    </div>

=======
                <h1>Ordenes de Produccion </h1>
                <div class="tarjeta">
                </div>
            </div>
        </div>
    </div>
>>>>>>> 4993f99d8607ea7c4b3c5cd431400b679f275718
    <script src="../../public/js/fmtor_libreria.js"></script>
</body>
</html>