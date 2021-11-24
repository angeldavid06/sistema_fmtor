<?php

    class Conexion {
        public static function conectar () {
            $conexion = mysqli_connect(
                'localhost',
                'root',
                '',
<<<<<<< HEAD
                'db_rdg_fmtor'
=======
                'unificacion'
>>>>>>> ab262c7e2f052172979f4cc1e1f7e685595f931a
            );
            return $conexion;
        }
    }

?>