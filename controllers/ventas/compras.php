<?php 

    require_once 'routes/web.php';

    class Compras {
        public $web;

        public function __construct() {
            $this->web = new Web();
        }

        public function pdf_fmtor () {
            $this->web->PDF('ventas/compra_fmtor','');
        }
        
        public function pdf_rdg () {
            $this->web->PDF('ventas/compra_rdg','');
        }
    }

?>