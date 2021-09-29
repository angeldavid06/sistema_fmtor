<?php

    class Conexion {
        public $servidor = '';
        public $usuario = '';
        public $password = '';
        public $db = '';

        public function conectar () {
            $conexion = mysqli_connect(
                $this->servidor,
                $this->usuario,
                $this->password,
                $this->db
            );
            
            return $conexion
        }
    }

?>