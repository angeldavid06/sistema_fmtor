<?php

    class Conexion {
        public static function conectar () {
            $conexion = mysqli_connect(
                'localhost',
                'root',
                '',
                'unificacion'
            );
            return $conexion;
        }
    }

?>