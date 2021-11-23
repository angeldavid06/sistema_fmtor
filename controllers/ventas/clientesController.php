<?php
    require_once "models/Clientes.php";
    require_once "routes/web.php";

    class Clientes{
        public $model;
        public $web;
    
        public function __construct(){
            $this->model = new Model();
            $this->web = new Web();
        }

        public function mostrar(){
            $this->web->View('clientes','');
        }

        public function buscar_cliente(){
            if(isset($_POST['check_id_Clientes'])){
                if(isset($_POST['f_id_Clientes'])){
                    $id_Clientes=$this->model->buscar($_POST['tabla'],'t_clientes',$_POST['f_id_Clientes']);
                    $json=json_encode($id_Clientes);
                    echo $json;
                }
            }
        }

      