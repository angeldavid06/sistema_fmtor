<?php

    require_once "models/sii/usuario.php";
    require_once "routes/web.php";

    class Main {
        public $model;
        public $web;

        public function __construct(){
            // $this->model= new TcontrolOp();
            $this->web = new Web();
            $this->model = new usuario();
        }

        public function mostrar() {
            $this->web->View('sii/main','');
        }

        public function Registro()
        {
            $data = $this->model->mostrar('puesto');
            $this->web->View('sii/register',$data);
        }

        
        function newUser()
        {
            if (isset($_POST['nombre']) && $_POST['nombre'] != '') {
                $this->model->setNombre($_POST['nombre']);
                if (isset($_POST['apellidoP']) && $_POST['apellidoP'] != '') {
                    $this->model->setApellidoP($_POST['apellidoP']);
                    if(isset($_POST['apellidoM']) && $_POST['apellidoM'] != ''){
                        $this->model->setApellidoM($_POST['apellidoM']);
                        if(isset($_POST['fechaNacimiento']) && $_POST['fechaNacimiento'] != ''){
                            $this->model->setFechaNacimiento($_POST['fechaNacimiento']);
                            if (isset($_POST['telefono']) && $_POST['telefono'] != '') {
                                $this->model->setTelefono($_POST['telefono']);
                                if (isset($_POST['correo']) && $_POST['correo'] != '') {
                                    $this->model->setCorreo($_POST['correo']);
                                    if (isset($_POST['fechaIngreso']) && $_POST['fechaIngreso'] != '') {
                                        $this->model->setFechaIngreso($_POST['fechaIngreso']);
                                        if (isset($_POST['curp']) && $_POST['curp'] != '') {
                                            $this->model->setCurp($_POST['curp']);
                                            if (isset($_POST['rfc']) && $_POST['rfc'] != '') {
                                                $this->model->setRfc($_POST['rfc']);
                                                if (isset($_POST['nss']) && $_POST['nss'] != '') {
                                                    $this->model->setNss($_POST['nss']);
                                                    if (isset($_POST['estado']) && $_POST['estado'] != '') {
                                                        $this->model->setEstado($_POST['estado']);
                                                        if (isset($_POST['usuario']) && $_POST['usuario'] != '') {
                                                            $this->model->setUsuario($_POST['usuario']);
                                                            if (isset($_POST['contrasena']) && $_POST['contrasena'] != '') {
                                                                $this->model->setContrasena($_POST['contrasena']);
                                                                if (isset($_POST['nombrePuesto']) && $_POST['nombrePuesto'] != '') {
                                                                    $this->model->setNombrePuesto($_POST['nombrePuesto']);
                                                                    echo $this->model->insertarEmpleado();
                                                                }else{
                                                                    echo 13;
                                                                } 
                                                            }else{
                                                                echo 12;
                                                            }
                                                        }else{
                                                        echo 11;}
                                                        
                                                    }else{
                                                       echo 10;
                                                    }
                                                }else{
                                                    echo 9;
                                                }
                                            }else{
                                                echo 8;
                                            }
                                        }else{
                                            echo 7;
                                        }
                                    } else{
                                        echo 6;
                                    }
                                }else {
                                    echo 5;
                                }
                            }else{
                                echo 4;
                            }
                        }else{
                            echo 3;
                        }
                    }else{
                        echo 2;
                    }   
                } else {
                    echo 1;
                }
            }else{
                echo 0;
            }
            
        }
        
    }
?>