<?php
  require_once "Model.php";
    
     class Cotizacion extends Model{
         public $fecha;
         public $clave;
         public $descripcion;
         public $cantidad_millares;
         public $precio_millar;
         public $importe;
         public $iva;
         public $total;
         public $id_cliente;


         public function __construct(){
             parent::__construct();
         }

         public function getFecha(){
            return $this->fecha;
        }
         public function getClave(){
             return $this->clave;
         }
         public function getDescripcion(){
            return $this->descripcion;
        }
         public function getCantidad_millares(){
             return $this->cantidad_millares;
         }
         public function getPrecio_millar(){
            return $this->precio_millar;
        }
        public function getImporte(){
            return $this->importe;
        }
        public function getIva(){
            return $this->iva;
        }

        public function getTotal(){
            return $this->total;
        }
        
         public function getIdCliente(){
            return $this->id_cliente;
         }

        

         

}