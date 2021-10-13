<!DOCTYPE html>
<html lang="en">
<head>
    <title>Registro</title>
</head>
<body>
    <form id="form_reg_user">
        <label for="">Nombre</label>
            <input type="text" name="nombre" id="nombre">
        <label for="">Apellido Paterno</label>
            <input type="text" name="apellidoP" id="apellidoP">
        <label for="">Apellido Materno</label>
            <input type="text" name="apellidoM" id="apellidoM">
        <label for="">Fecha de Nacimiento</label>
            <input type="date" name="fechaNacimiento" id="fechaNacimiento">
        <label for="">Telefono</label>
            <input type="text" name="telefono" id="telefono">
        <label for="">Correo Electronico</label>
            <input type="text" name="correo" id="correo">
        <label for="">Fecha de Ingreso</label>
            <input type="date" name="fechaIngreso" id="fechaIngreso">
        <label for="">CURP</label>
            <input type="text" name="curp" id="curp">
        <label for="">RFC</label>
            <input type="text" name="rfc" id="rfc">
        <label for="">NSS</label>
            <input type="text" name="nss" id="nss">
        <label for="">Estado</label>
            <input type="text" name="estado" id="estado">
        <label for="">Usuario</label>
            <input type="text" name="usuario" id="usuario">
        <label for="">Contraseña</label>
            <input type="password" name="contrasena" id="contrasena">
        <select name="nombrePuesto" id="nombrePuesto">
            
        </select>
        
        <button>ingresar</button>
    </form>
    <br>
    <form action="only_user_register">
        <label for="usuario_only"></label><input type="text" name="usuario" id="usuario">
        <label for="password"></label><input type="password" name="password" id="password">
        <select name="nombreRol" id="nombreRol">
           
        </select>
        <button>Ingresar</button>
    </form>
    <script src="../../public/js/fmtor_libreria.js?1.2"></script>
    <script src="../../public/js/sii/register.js?1.1"></script>
    
</body>
</html>