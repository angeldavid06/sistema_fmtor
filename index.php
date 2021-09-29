<?php
    require_once 'autoload.php';

    if (isset($_GET['controller']) && class_exists($_GET['controller'])) {
        $controlador = $_GET['controller'];
        $obj = new $controlador();
        if (isset($_GET['action']) && method_exists($controlador,$_GET['action'])) {
            $metodo = $_GET['action'];
            $obj->$metodo();
        } else {
            echo 'el método no existe';
        }
    } else {
        require_once 'views/login.php';
    }
    
?> 