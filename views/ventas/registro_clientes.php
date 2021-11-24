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
            <div class="tarjeta">
                <body>

<section id="container"> 

<div class="form_register"></div>
 <h1> Registro Cliente</h1>
 <hr>
 <div class="alert">
     <?php echo isset ($alert)? $alert : ''; ?>
 </div>

 <form action="" method="post">

<label for="identificacion"> Numero de identificacion </label>
<input type= "number" name="identificacion" id="identificacion  " placeholder="Numero de identificacion">

<label for ="nombre"> Nombre del Cliente  </label>
<input type= "text" name="nombre" id="nombre " placeholder="Nombre Completo">

<label for ="razon"> Razon Social  </label>
<input type= "text" name="razon" id="razon " placeholder="Razon Social ">

<label for ="calle"> Calle </label>
<input type= "text" name="calle" id="calle " placeholder="Calle ">

<label for ="colonia"> Colonia </label>
<input type= "text" name="colonia" id="colonia " placeholder="Colonia  ">

<label for ="cp"> Codigo Postal </label>
<input type= "text" name="cp" id="cp " placeholder="Codigo Postal ">

<label for ="alcaldia"> Alcaldia </label>
<input type= "text" name="alcaldia" id="alcaldia " placeholder="Alcaldia  ">

 <label for ="telefono"> Numero de Contacto   </label>
    <input type= "number" name="telefono" id="telefono " placeholder="Numero de Contacto  ">


<input type="submit" value="Guardar cliente" class="btn btn-icon btn_save">
</form>
</div>
</section>
</div>
</div>
        </div>
    </div>

    <script src="../../public/js/fmtor_libreria.js"></script>
</body>
</html>