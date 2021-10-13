<?php

    class Conexion {
        public static function conectar () {
            $conexion = mysqli_connect(
                'localhost',
                'root',
                '',
<<<<<<< HEAD
                'db_rdg'
=======
                'db_scp'
>>>>>>> 4e175a54165f735ae5b8b577ffb24f9177377f33
            );
            return $conexion;
        }
    }

?>