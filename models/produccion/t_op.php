<?php
  require_once "../Model.php";
    
     class Top extends Model{
         public $op;
         public $n_pedido;
         public $fecha;
         public $cantidad;
         public $codigo_dibujo;
         public $autorizacion;
         public $agente;
         public $id_tornillo;
         public $id_cliente;


         public function __construct(){
             parent::__construct();
         }

         public function getOp(){
             return $this->op;
         }

         public function getNPedido(){
             return $this->n_pedido;
         }

         public function getFecha(){
             return $this->fecha;
         }

         public function getCantidad(){
             return $this->cantidad;
            
         }

         public function getCodigoDibujo(){
             return $this->codigo_dibujo;
         }

         public function getAutorizacion(){
             return $this->autorizacion;
         }

         public function getAgente(){
             return $this->agente;
         }

         public function getIdTornillo(){
             return $this->id_tornillo;
         }

         public function getIdCliente(){
            return $this->id_cliente;
         }

         public function setOp($op):void{
             $this->op=$op;
         }

         

}