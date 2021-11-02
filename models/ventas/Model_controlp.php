<?php 
   require_once "Model.php";

   class TcontrolOp extends Model{
       public $id;
       public $no_maquina;
       public $bote;
       public $fecha_entrega;
       public $pzas;
       public $pzas_acumuladas;
       public $kilos;
       public $turno;
       public $observaciones;
       public $op;
       public $id_estado;
       

       public function __construct(){
           parent::__construct();
       }

       public function getId(){
           return $this->id;
       }

       public function getNoMaquina(){
           return $this->no_maquina;
       }

       public function getBote(){
           return $this->bote;
       }

       public function getFechaEntrega(){
           return $this->fecha_entrega;
       }

       public function getPzas(){
           return $this->pzas;
       }

       public function getPzasAcumuladas(){
           return $this->pzas_acumuladas;
       }

       public function getKilos(){
           return $this->kilos;
       }

       public function getTurno(){
           return $this->turno;
       }

       public function getObservaciones(){
           return $this->observaciones;
       }

       public function getOp(){
           return $this->op;
       }

       public function getIdEstado(){
           return $this->id_estado;
       }

       public function setId($id):void{
           $this->id=$id;
       }

       public function setNoMaquina($no_maquina):void{
           $this->no_maquina=$no_maquina;
       }

       public function setBote($bote):void{
           $this->bote=$bote;
       }

       public function setFechaEntrega($fecha_entrega):void{
           $this->fecha_entrega=$fecha_entrega;
       }

       public function setPzas($pzas):void{
           $this->pzas=$pzas;
       }

       public function setPzasAcumuladas($pzas_acumuladas):void{
           $this->pzas_acumuladas=$pzas_acumuladas;
       }

       public function setKilos($kilos):void{
           $this->kilos=$kilos;
       }

       public function setTurno($turno):void{
           $this->turno=$turno;
       }

       public function setObservaciones($observaciones):void{
           $this->observaciones=$observaciones;
       }

       public function setOp($op):void{
           $this->op=$op;
       }

       public function setIdEstado($id_estado):void{
           $this->id_estado=$id_estado;
       }
   }