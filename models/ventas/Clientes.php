<?php
   require_once "config/conexion.php";
    
     class Clientes extends Model{

         public $id_Clientes;
         public $Nombre;
         public $Razon_social;
         public $Calle;
         public $Colonia;
         public $c_p;
         public $alcaldia;
         public $Telefono ;
         


         public function __construct(){
             parent::__construct();
         }

         public function getIdCliente(){
             return $this->Id_Cliente;
         }

         public function getNombre(){
             return $this->Nombre;
         }

         public function getRazon_social(){
             return $this->Razon_social;
         }

         public function getCalle(){
             return $this->Calle;
            
         }

         public function getColonia(){
             return $this->Colonia;
         }

         public function getCp(){
             return $this->c_p;
         }

         public function getAlcaldia(){
             return $this->Alcaldia;
         }

         public function getTelefono(){
             return $this->id_Telefono;
         }

        
        
         public function setIdCliente(){
            $this->Id_Clientes=$id_Clientes;
        }

        public function getNombre(){
            $this->Nombre=$nombre;
        }

        public function getRazon_social(){
            $this->Razon_social=$razon_social;
        }

        public function getCalle(){
            $this->Calle=$calle;
           
        }

        public function getColonia(){
            $this->Colonia=$colonia;
        }

        public function getCp(){
            $this->c_p=$cp;
        }

        public function getAlcaldia(){
            $this->Alcaldia=$alcaldia;
        }
        public function getTelefono(){
            $this->Telefono=$telefono;
        }
    }
       
        

         


?>