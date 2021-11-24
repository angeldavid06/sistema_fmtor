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
<<<<<<< HEAD
                'db_rdg_fmtor'
=======
                'unificacion'
>>>>>>> ab262c7e2f052172979f4cc1e1f7e685595f931a
>>>>>>> 7b2d3b08abefb44e7e5b1c13811adc5cb883ea09
            );
            return $conexion;
        }
    }

?>