<?php
    session_start();

    require_once "config/conexion.php";

    class Model {
        public $db;

        public function __construct(){
            $this->db= conexion::conectar();
        }

        public function mostrar ($tabla){
            $sql="SELECT * FROM $tabla";
            $mostrar = $this->db->query($sql);
            $objeto = self::getAssoc($mostrar);
            return $objeto;
        }

        public function insertar ($tabla,$columnas,$valores){
            $sql="INSERT INTO $tabla($columnas) VALUES ($valores)";
            $insert = $this->db->query($sql);
            return $insert;
        }

        public function actualizar ($tabla,$valores,$condicion) {
            $sql="UPDATE $tabla set $valores WHERE $condicion";
            $actualizar = $this->db->query($sql);
            return $actualizar;
        }

        public function eliminar ($tabla,$condicion) {
            $sql="DELETE FROM $tabla WHERE $condicion";
            $eliminar = $this->db->query($sql);
            return $eliminar;
        }
        
        public function buscar ($tabla,$condicion) {
            $sql = "SELECT * FROM $tabla WHERE $condicion";
            $buscar = $this->db->query($sql);
            $assoc = self::getAssoc($buscar);
            return $assoc;
        }
        
        public function buscar_personalizado ($tabla,$campos,$condicion) {
            $sql = "SELECT $campos FROM $tabla WHERE $condicion";
            $buscar = $this->db->query($sql);
            $assoc = self::getAssoc($buscar);
            return $assoc;
        }

        public function validar_password ($tabla,$condicion) {
            $sql = "SELECT password FROM $tabla WHERE $condicion";
            $validar_password = $this->db->query($sql);
            $assoc = self::getAssoc($validar_password);
            return $assoc;
        }

        public function getAssoc ($query) {
            $assoc = array();
            if (is_object($query)) {
                while($fila = $query->fetch_assoc()) {
                    $assoc[] = $fila;
                }
            } 
            return $assoc;
        }
    }

?>