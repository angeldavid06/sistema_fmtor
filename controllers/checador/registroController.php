<?php
     require_once "models/Model.php";
     require_once "routes/web.php";
     require_once "models/checador/registrosModel.php";
     class registroController{
         public $model;
         public $web;
         public $mo;

    //solo se manda un string con los valores encerrados en un string 
    //manda el nomnre de la tabla con los valores y los campos
        
        public function __construct(){
            $this->model= new Model();
            $this->web = new Web();
            $this->mo = new registrosModel();
        }

        //funcion insertar hora en la tabla registro
        public function insertarh(){
            $json = $_GET['json'];
            $data = json_decode($json);

            //$this->model->setIdRegistro($data->id);
            $this->mo->setUsuario($data->id);
            $this->mo->setfecha($data->entrada);
            $this->mo->setTipoRegistro($data->tipo);
   
            echo $this->mo->insertar1();
        }

        public function consultarh(){
            $json = $_GET['json'];
            $data = json_decode($json);

            $this->mo->setUsuario($data->id);
            echo $this->mo->consultar();
        }

        //En esta funcion 

    }

    
?>