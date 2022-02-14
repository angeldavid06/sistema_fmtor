<?php
require_once "models/Model.php";
require_once "models/ventas/cotizacionModel.php";
require_once "routes/web.php";


class cotizacion
{
    public $model;
    public $web;
    public $cotizacion;

    public function __construct()
    {
        $this->cotizacion = new cotizacionModel();
        $this->web = new Web();
        $this->model = new Model();
    }
    public function generarpdf()
    {
        $data = $this->model->buscar('t_cotizacion', $_GET['atributo'], $_GET['value']);

        $this->web->PDF('ventas/cotizacion', $data);
    }
    public function tablaCliente()
    {
        $tabla = $this->model->mostrar('t_clientes');
        echo json_encode($tabla);
    }


    public function obtener()
    {
        $result = $this->model->buscar_personalizado('t_cotizacion, t_clientes', 'Id_Cotizacion, Fecha, Descripcion,Medida,Acabado,Cantidad_millares,Precio_millar,Razon_social,Total,Importe,iva,total_neto,Notas,Empleado', 't_cotizacion.Id_Clientes_1 = t_clientes.Id_Clientes');
        echo json_encode($result);
    }
    public function obtener_per()
    {
        $result = $this->model->buscar_personalizado('t_cotizacion', '*', 'Id_Cotizacion =' . $_GET['aux'] . '');
        echo json_encode($result);
    }
    public function NuevaCotizacion()
    {

        if (isset($_POST['Fecha']) && $_POST['Fecha'] != '') {
            $this->cotizacion->setFecha($_POST['Fecha']);

            if (isset($_POST['Descripcion']) && $_POST['Descripcion'] != '') {
                $this->cotizacion->setDescripcion($_POST['Descripcion']);

                if (isset($_POST['Medida']) && $_POST['Medida'] != '') {
                    $this->cotizacion->setMedida($_POST['Medida']);

                    if (isset($_POST['Acabado']) && $_POST['Acabado'] != '') {
                        $this->cotizacion->setAcabado($_POST['Acabado']);

                        if (isset($_POST['Cantidad_millares']) && $_POST['Cantidad_millares'] != '') {
                            $this->cotizacion->setCantidad_millares($_POST['Cantidad_millares']);


                            if (isset($_POST['Precio_millar']) && $_POST['Precio_millar'] != '') {
                                $this->cotizacion->setPrecio_millar($_POST['Precio_millar']);


                                if (isset($_POST['Id_Clientes_1']) && $_POST['Id_Clientes_1'] != '') {
                                    $this->cotizacion->setId_Clientes_1($_POST['Id_Clientes_1']);

                                    if (isset($_POST['Total']) && $_POST['Total'] != '') {
                                        $this->cotizacion->setTotal($_POST['Total']);

                                        if (isset($_POST['Importe']) && $_POST['Importe'] != '') {
                                            $this->cotizacion->setImporte($_POST['Importe']);

                                            if (isset($_POST['iva']) && $_POST['iva'] != '') {
                                                $this->cotizacion->setiva($_POST['iva']);

                                                if (isset($_POST['total_neto']) && $_POST['total_neto'] != '') {
                                                    $this->cotizacion->settotal_neto($_POST['total_neto']);
    
                                        if (isset($_POST['Notas']) && $_POST['Notas'] != '') {
                                            $this->cotizacion->setNotas($_POST['Notas']);
                                            
                                            if (isset($_POST['Empleado']) && $_POST['Empleado'] != '') {
                                                $this->cotizacion->setEmpleado($_POST['Empleado']);

                                                echo json_encode($this->cotizacion->insertarCotizacion());
                                            
                                            } else {
                                                echo 12;
                                            }
                                        } else {
                                            echo 11;
                                        }
                                    } else {
                                        echo 10;
                                    }
                                            } else {
                                                echo 9;
                                            }
                                        } else {
                                            echo 8;
                                        }
                                    } else {
                                        echo 7;
                                    }
                                } else {
                                    echo 6;
                                }
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
    public function actualizarCotizacion()
    {
        if (isset($_POST['Id_Cotizacion_edit'])) {
            $Fecha = $_POST['Fecha_edit'];
            $Descripcion = $_POST['Descripcion_edit'];
            $Medida = $_POST['Medida_edit'];
            $Acabado = $_POST['Acabado_edit'];
            $Cantidad_millares = $_POST['Cantidad_millares_edit'];
            $Precio_millar = $_POST['Precio_millar_edit'];
            $Id_Clientes_1 = $_POST['Id_Clientes_1_edit'];
            $Total = $_POST['Total_edit'];
            $Importe = $_POST['Importe_edit'];
            $iva = $_POST['iva_edit'];
            $total_neto= $_POST['total_neto_edit'];
            $Notas = $_POST['Notas_edit'];
            $Empleado = $_POST['Empleado_edit'];

            $Id_Cotizacion = $_POST['Id_Cotizacion_edit'];
          
            $valores = "Fecha = '$Fecha',Descripcion = '$Descripcion',Medida = '$Medida',Acabado = '$Acabado', Cantidad_millares = '$Cantidad_millares', Precio_millar = '$Precio_millar', Id_Clientes_1= ' $Id_Clientes_1', Total= ' $Total',   Importe=  '$Importe',iva= $iva ,total_neto=  '$total_neto',Notas= ' $Notas',Empleado= ' $Empleado'";
            $condicion = "Id_Cotizacion = '$Id_Cotizacion'";
            $result = $this->model->actualizar('t_cotizacion', $valores, $condicion);
            if ($result) {
                echo 1;
            } else {
                echo 2;
            }
        } else {
            echo 0;
        }
    }

    public function eliminarCotizacion()
    {
        if (isset($_GET['dato'])) {
            $id = $_GET['dato'];
            $result = $this->model->eliminar('t_cotizacion', "Id_Cotizacion = '$id'");
            echo $result;
        }
    }
}