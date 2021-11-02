<?php
  require_once "Model.php";
    
     class SalidaAlmacen extends Model{
         public $fecha;
         public $cantidad;
         public $parte;
         public $n_pedido;
         public $id_medida;
         public $descripcion;
         public $id_acabados;
         public $costo;
         public $factura;
         public $empaque;
         public $autorizacion;
         public $despacho;
         public $recibido;
         public $op;

         public function getFecha(){
            return $this->fecha;
        }
        public function getCantidad(){
            return $this->cantidad;  
        }
        public function getParte(){
            return $this->parte;   
        }
        public function getNPedido(){
            return $this->n_pedido;
        }
        public function getidMedida(){
            return $this->id_medida;
        }
        public function getDescripcion (){
            return $this->descripcion;
        }
        public function getidAcabados(){
            return $this->id_acabados;
        }
        public function getCosto(){
            return $this->costos;
        }
        public function getFactura(){
            return $this->factura;
        }
        public function getEmpaque(){
            return $this->empaque;
        }
        public function getAutorizacion(){
            return $this->autorizacion;
        }
        public function getDespacho (){
            return $this->despacho;
        }

        public function getRecibido (){
            return $this->recibido;
        }


        public function __construct(){
             parent::__construct();
         }

         public function getOp(){
             return $this->op;
         }

         
        
        
         

         

         

         

}