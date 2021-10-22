<?php
  require_once "Model.php";
    
     class Treportes extends Model{
         public $id_cliente;
         public $fecha_entrega;
         public $num_parte;
         public $ub_orden_trab_sufijo;
         public $can_ordenada;
         public $can_recibida;
         public $can_abierta;
         public $recibido_no_inspeccionado;
         public $costo_unitario;
         public $monto_extendido;
         public $op;

         public function $IdCliente(){
            return $this->id_cliente;
        }
         public function $FechaEntrega(){
            return $this->fecha_entrega;
        }
         public function $NumParte(){
            return $this->num_parte;
        }
         public function $UbOrdenTrabSufijo(){
            return $this->ub_orden_trab_sufijo;
        }
         public function $CanOrdenada(){
            return $this->can_ordenada;
        }
         public function $CanRecibida(){
            return $this->can_recibida;
        }
         public function $CanAbierta(){
            return $this->can_abierta;
        }
         public function $RecibidoInspeccionado(){
            return $this->recibido_inspeccionado;
        }
         public function $CostoUnitario(){
            return $this->costo_unitario;
        }
         public function $MontoExtendido(){
            return $this->monto_extendido;
        }
         public function $Op(){
            return $this->op;
        }
        public function __construct(){
             parent::__construct();
         }
         public function getOp(){
             return $this->op;
         }
}