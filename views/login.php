<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="../public/css/default.css?2.1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
    <div class="welcome">
        <div class="row-con hidden">
            <div class="left">
                <p>Bienvenido</p>
                <h1>Forjadora Mexicana de Tornillos, S.A. de C.V.</h1>
                <button class="btn btn-login-form">Iniciar Sesión</button>
            </div>
            <div class="center">
                <div class="card-sm card-sm-1">
                    <img class="tornillo tornillo-1" src="../public/img/tornillo-1.png" alt="" srcset="">
                </div>
                <div class="card-sm card-sm-2">
                    <img class="tornillo tornillo-2" src="../public/img/tornillo-2.png" alt="" srcset="">
                </div>
                <div class="card-sm card-sm-3">
                    <img class="tornillo tornillo-3" src="../public/img/tornillo-3.png" alt="" srcset="">
                </div>
            </div>
            <div class="form-login">
                <h1>Iniciar Sesión</h1>
                <form id="form_login">
                    <div class="inputs">
                        <label for="nombre">Nombre de usuario:</label>
                        <input type="text" name="nombre" id="nombre" placeholder="Ingresa el nombre de usuario">
                        <label for="password">Contraseña: </label>
                        <input type="password" name="password" id="password" placeholder="Ingresa la contraseña del usuario">
                    </div>
                    <div class="options">
                        <!-- <input type="checkbox" name="remember" id="remember">
                        <label for="remember" class="lbl-checkbox">Recordar contraseña</label> -->
                        <button class="btn">Ingresar</button>
                        <!-- <a href="">¿Olvidaste tu contraseña?</a> -->
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script src="../public/js/fmtor_libreria.js?2.3"></script>
    <script src="../public/js/login.js?2.1"></script>
</body>
</html>
