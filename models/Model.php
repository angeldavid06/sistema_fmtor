<?php

    require_once "config/conexion.php";

    class Model {
        public $db;

        public function __construct(){
            $this->db= conexion::conectar();
        }

        public function mostrar ($tabla){
            $sql="SELECT * FROM $tabla ";
            $mostrar = $this->db->query($sql);
            return $mostrar;
        }

        public function insertar ($tabla,$columnas,$valores){
            $sql="INSERT INTO $tabla($columnas) VALUES ($valores)";
            $insert=$this->db->query($sql);
            return $insert;
        }

        public function actualizar ($tabla,$valores,$condicion) {
            $sql="UPDATE $tabla set $valores WHERE $condicion";
            $actu=$this->db->query($sql);
            return $actu;
        }

        public function eliminar ($tabla,$condicion) {
            $sql="DELETE FROM $tabla WHERE $condicion";
            $eliminar=$this->db->query($sql);
            return $eliminar;
        }
    }

?>