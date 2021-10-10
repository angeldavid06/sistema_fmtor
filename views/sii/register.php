<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
</head>
<body>
    <form id="form_reg_user">
        <label for="">Nombre</label><input type="text" name="nombre" id="nombre">
        <label for="">Apellido Paterno</label><input type="text" name="apellidoP" id="apellidoP">
        <label for="">Apellido Materno</label><input type="text" name="apellidoM" id="apellidoM">
        <label for="">Fecha de Nacimiento</label><input type="date" name="fechaNacimiento" id="fechaNacimiento">
        <label for="">Telefono</label><input type="text" name="telefono" id="telefono">
        <label for="">Correo Electronico</label><input type="text" name="correo" id="correo">
        <label for="">Fecha de Ingreso</label><input type="date" name="fechaIngreso" id="fechaIngreso">
        <label for="">CURP</label><input type="text" name="curp" id="curp">
        <label for="">RFC</label><input type="text" name="rfc" id="rfc">
        <label for="">NSS</label><input type="text" name="nss" id="nss">
        <label for="">Estado</label><input type="text" name="estado" id="estado">
        <label for="">Usuario</label><input type="text" name="usuario" id="usuario">
        <label for="">Contraseña</label><input type="password" name="contrasena" id="contrasena">
        <select name="nombrePuesto" id="nombrePuesto">
            <?php while($puesto = $data->fetch_object()): ?>
                <option value="<?=$puesto->id_puesto;?>"><?=$puesto->nombrePuesto;?></option>
            <?php endwhile;?>
        </select>
        <button>ingresar</button>
        </form>

        <footer>
            <script src="../../public/js/sii/register.js"></script>
            <script src="../../public/js/fmtor_libreria.js?1.2"></script>
        </footer>
</body>
</html>