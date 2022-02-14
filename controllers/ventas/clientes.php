<?php
require_once "models/Model.php";
require_once "models/ventas/clientesModel.php";
require_once "routes/web.php";


class clientes
{
    public $model;
    public $web;
    public $clientes;

    public function __construct()
    {
        $this->clientes = new clientesModel();
        $this->web = new Web();
        $this->model = new Model();
    }
   

    public function obtener()
    {
        $result = $this->model->mostrar('t_clientes');
        echo json_encode($result);
    }
    public function obtener_per()
    {
        $result = $this->model->buscar_personalizado('t_clientes', '*', 'Id_Clientes =' . $_GET['aux'] . '');
        echo json_encode($result);
    }

    public function NuevoCliente()
    {
        if (isset($_POST['Id_Clientes']) && $_POST['Id_Clientes'] != '') {
            $this->clientes->setId_Clientes($_POST['Id_Clientes']);

            if (isset($_POST['Razon_social']) && $_POST['Razon_social'] != '') {
                $this->clientes->setRazon_social($_POST['Razon_social']);

                if (isset($_POST['Nombre']) && $_POST['Nombre'] != '') {
                    $this->clientes->setNombre($_POST['Nombre']);

                    if (isset($_POST['Telefono']) && $_POST['Telefono'] != '') {
                        $this->clientes->setTelefono($_POST['Telefono']);

                        if (isset($_POST['Correo']) && $_POST['Correo'] != '') {
                            $this->clientes->setCorreo($_POST['Correo']);

                            if (isset($_POST['Direccion']) && $_POST['Direccion'] != '') {
                                $this->clientes->setDireccion($_POST['Direccion']);

                                echo json_encode($this->clientes->insertarCliente());
                            } else {
                                echo 5;
                            }
                        } else {
                            echo 4;
                        }
                    } else {
                        echo 3;
                    }
                } else {
                    echo 2;
                }
            } else {
                echo 1;
            }
        } else {
            echo 0;
        }
    }

    public function actualizarCliente()
    {
        if (isset($_POST['Id_Clientes_edit'])) {
            $Razon_social = $_POST['Razon_social_edit'];
            $Nombre = $_POST['Nombre_edit'];
            $Telefono = $_POST['Telefono_edit'];
            $Correo = $_POST['Correo_edit'];
            $Direccion = $_POST['Direccion_edit'];


            $Id_Clientes = $_POST['Id_Clientes_edit'];


            $valores = "Razon_social = '$Razon_social', Nombre = '$Nombre', Telefono = '$Telefono', Correo= '$Correo' , Direccion= ' $Direccion'";
            $condicion = "Id_Clientes = '$Id_Clientes'";
            $result = $this->model->actualizar('t_clientes', $valores, $condicion);
            if ($result) {
                echo 1;
            } else {
                echo 2;
            }
        } else {
            echo 0;
        }
    }

    public function eliminarCliente()
    {
        if (isset($_GET['dato'])) {
            $id = $_GET['dato'];
            $result = $this->model->eliminar('t_clientes', "Id_Clientes = '$id'");
            echo $result;
        }
    }
}
