<?php 

    require_once 'models/Model.php';
    require_once 'models/ventas/compraModel.php';
    require_once 'routes/web.php';

    class Compras {
        public $model;
        public $model_compra;
        public $web;

        public function __construct() {
            $this->model = new Model();
            $this->model_compra = new compraModel();
            $this->web = new Web();
        }

        public function generar_pdf () {
            if (isset($_GET['empresa']) && $_GET['empresa'] == 1) {
                $this->web->PDF('ventas/compra_fmtor','');
            } else if (isset($_GET['empresa']) && $_GET['empresa'] == 2) {
                $this->web->PDF('ventas/compra_rdg','');
            }
        }

        public function obtener() {
            echo json_encode($this->model->mostrar('v_orden_compra'));
        }

        public function obtener_empresas() {
            echo json_encode($this->model->mostrar('v_empresa'));
        }

        public function obtener_proveedores () {
            echo json_encode($this->model->mostrar('v_proveedor'));
        }

        public function insertar () {
            if (isset($_POST['solicitado']) && $_POST['solicitado'] != '') {
                $this->model_compra->setFecha($_POST['Fecha']);
                $this->model_compra->setSolicitado($_POST['solicitado']);
                $this->model_compra->setTerminos($_POST['terminos']);
                $this->model_compra->setContacto($_POST['contacto']);
                $this->model_compra->setId_Empresa($_POST['empresas']);
                $this->model_compra->setId_Proveedor($_POST['proveedores']);

                $result = $this->model_compra->ingresar_orden();
                
                if ($result) {
                    echo 1;
                } else {
                    echo 0;
                }
            } else {
                echo 0;
            }
        }
    }

?>