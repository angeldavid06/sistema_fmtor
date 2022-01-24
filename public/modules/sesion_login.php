<?php 

    if (isset($_SESSION['ZW1wbGVhZG8='])) {
        header('Location: http://localhost/sistema_fmtor/'.strtolower($_SESSION['depto']).'/main/mostrar');
    }

?>