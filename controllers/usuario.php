<?php 
    require_once "routes/web.php";

    class usuario {
        public $web;

        public function __construct(){
            $this->web = new Web();
        }

        public function principal () {
            $this->web->View('user','');
        }
        
        public function control () {
            $this->web->View('produccion/control','');
        }
        
        public function diario () {
            $this->web->View('produccion/diario','');
        }
        
        public function ordenes () {
            $this->web->View('produccion/ordenes','');
        }

        public function estados () {
            $this->web->View('produccion/estado','');
        }
        
        public function maquinas () {
            $this->web->View('produccion/maquinas','');
        }
    }
?>