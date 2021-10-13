<?php

    class Conexion {
        public static function conectar () {
            $conexion = mysqli_connect(
                'localhost:3307',
                'root',
                '',
                'db_scp'
            );
            return $conexion;
        }
    }

?>