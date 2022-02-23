<?php
    require_once "models/Model.php";
    require_once "models/ventas/salidaModel.php";
    require_once "models/produccion/t_op.php";
    require_once "routes/web.php";

    class salida
    {
        public $model;
        public $model_op;
        public $web;
        public $salida;

        public function __construct()
        {
            $this->salida = new salidaModel();
            $this->web = new Web();
            $this->model = new Model();
            $this->model_op = new t_op();
        }

        public function buscar()
        {
            $id_folio = $_GET['clave'];

            $result = $this->model->buscar('v_busqueda_salida', 'Salida', $id_folio);
            echo json_encode($result);
        }
        
        public function generarpdf()
        {
            $salida = $this->model->buscar('v_salidas_almacen', $_GET['atributo'], $_GET['value']);
            $this->model = new Model();
            $ordenes = $this->model->mostrar('v_ordenes'); 

            $data = [
                'salida' => $salida,
                'ordenes' => $ordenes
            ];

            $this->web->PDF('ventas/salida', $data);
        }

        public function obtener()
        {
            $salidas = $this->model->mostrar('v_salidas_almacen');
            $this->model = new Model();
            $ordenes = $this->model->mostrar('v_ordenes');
            $data = [
                'salidas' => $salidas,
                'ordenes' => $ordenes
            ];
            echo json_encode($data);
        }

        public function obtener_per()
        {
            $salidas = $this->model->buscar_personalizado('v_salidas_almacen', '*', 'Id_Folio =' . $_GET['aux'] . '');
            $this->model = new Model();
            $ordenes = $this->model->mostrar('v_ordenes');
            $data = [
                'salida' => $salidas,
                'ordenes' => $ordenes
            ];
            echo json_encode($data);
        }

        public function obtener_clientes () {
            $result = $this->model->mostrar('v_clientes');
            echo json_encode($result);
        }

        public function NuevaSalida() { 
            $aux = 1;
            if (isset($_POST['Id_Clientes_2']) && $_POST['Id_Clientes_2'] != '') {
                $this->salida->setId_Clientes_2($_POST['Id_Clientes_2']);
                $this->salida->setFecha($_POST['Fecha']);

                $result = $this->salida->insertarSalida();
                if ($result) {
                    for ($i=1; $i <= $_POST['Cantidad_Tornillos']; $i++) { 
                        $this->salida->setDescripcion($_POST['Descripcion_'.$i]);
                        $this->salida->setMedida($_POST['Medida_'.$i]);
                        $this->salida->setAcabado($_POST['Acabado_'.$i]);
                        $this->salida->setFactor($_POST['factor_'.$i]);
                        $this->salida->setMaterial($_POST['Material_'.$i]);
                        $this->salida->setCantidad_millares($_POST['Cantidad_millares_'.$i]);
                        $this->salida->setPedido_pza($_POST['Pedido_pza']);
                        $this->salida->setFecha_entrega($_POST['Fecha_entrega']);
                        $this->salida->setPrecio_millar($_POST['Precio_millar_'.$i]);
                        $this->salida->setCodigo($_POST['Codigo']);
                        if (isset($_POST['tratamiento_' . $i]) && $_POST['tratamiento_'.$i] == 'on') {
                            $this->salida->setTratamiento('T/TERMICO');
                        }
    
                        $result_2 = $this->salida->insertarPedido();
                        if ($result_2) {
                            if (!isset($_POST['sin_op_'.$i]) && $result) {
                                $this->salida->setDibujo($_POST['Dibujo_'.$i]);
                                $this->salida->setCantidad_producir($_POST['cantidad_producir_'.$i]);
                                $orden = json_encode($this->salida->insertarOrden());
                            }
                        } else {
                            $aux = 3;
                        }
                    }
                    echo $aux;
                } else {
                    echo 2;
                }
            } else {
                echo 0;
            }
        }

        public function actualizarSalida()
        {
            if (isset($_POST['Salida_edit']) && $_POST['Salida_edit'] != '') {
                $this->salida->setSalida($_POST['Salida_edit']);
                $this->salida->setId_Clientes_2($_POST['Id_Clientes_2_edit']);
                $this->salida->setFecha($_POST['Fecha_edit']);
                $this->salida->setCantidad_millares($_POST['Cantidad_millares_edit']);
                $this->salida->setCodigo($_POST['Codigo_edit']);
                $this->salida->setPedido_pza($_POST['Pedido_pza_edit']);
                $this->salida->setMedida($_POST['Medida_edit']);
                $this->salida->setDescripcion($_POST['Descripcion_edit']);
                $this->salida->setAcabado($_POST['Acabado_edit']);
                $this->salida->setPrecio_millar($_POST['Precio_millar_edit']);
                $this->salida->setFactura($_POST['Factura_edit']);
                $this->salida->setFecha_entrega($_POST['Fecha_entrega_edit']);
                $this->salida->setMaterial($_POST['Material_edit']);

                $result = $this->salida->actualizarSalida();
                
                if ($result) {
                    echo $result;
                } else {
                    echo 2;
                }
            } else {
                echo 0;
            }
        }

        public function eliminarSalida()
        {
            if (isset($_GET['dato'])) {
                $id = $_GET['dato'];
                $result = $this->model->eliminar('t_salida_almacen', "Id_Folio = '$id'");
                echo $result;
            }
        }

        public function buscar_salida()
        {
            if (isset($_POST['buscar_por'])) {
                if (isset($_POST['f_salida'])) {
                    $this->model_op->setVista('v_salidas_almacen');
                    $this->model_op->setCampo('Id_Folio');
                    $this->model_op->setValorBuscar($_POST['f_salida']);
                    $op = $this->model_op->buscar_informacion();
                    $ordenes = $this->model->mostrar('v_ordenes');
                    $data = [
                        'salidas' => $op,
                        'ordenes' => $ordenes
                    ];
                    echo json_encode($data);
                } else {
                    echo 2;
                }
            } else {
                echo 1;
            }
        }

        public function buscar_rango_salidas()
        {
            if (isset($_POST['buscar_por'])) {
                if (isset($_POST['f_r_salida_m']) && isset($_POST['f_r_salida_M'])) {
                    $this->model_op->setVista('v_salidas_almacen');
                    $this->model_op->setCampo('Id_Folio');
                    $this->model_op->setOp($_POST['f_r_salida_m']);
                    $this->model_op->setOpFin($_POST['f_r_salida_M']);
                    $result = $this->model_op->rango_op();
                    $ordenes = $this->model->mostrar('v_ordenes');
                    $data = [
                        'salidas' => $result,
                        'ordenes' => $ordenes
                    ];
                    echo json_encode($data);
                }
            }
        }

        public function buscar_op()
        {
            if (isset($_POST['buscar_por'])) {
                if (isset($_POST['f_op'])) {
                    $this->model_op->setVista($_POST['tabla']);
                    $this->model_op->setCampo('Id_Folio');
                    $this->model_op->setValorBuscar($_POST['f_op']);
                    $op = $this->model_op->buscar_informacion();
                    $ordenes = $this->model->mostrar('v_ordenes');
                    $data = [
                        'salidas' => $op,
                        'ordenes' => $ordenes
                    ];
                    echo json_encode($data);
                } else {
                    echo 2;
                }
            } else {
                echo 1;
            }
        }

        public function buscar_rango_op()
        {
            if (isset($_POST['buscar_por'])) {
                if (isset($_POST['f_r_op_m']) && isset($_POST['f_r_op_M'])) {
                    $this->model_op->setVista($_POST['tabla']);
                    $this->model_op->setCampo('Id_Folio');
                    $this->model_op->setOp($_POST['f_r_op_m']);
                    $this->model_op->setOpFin($_POST['f_r_op_M']);
                    $result = $this->model_op->rango_op();

                    $json = json_encode($result);
                    echo $json;
                }
            }
        }

        public function buscar_rango_fecha()
        {
            if (isset($_POST['buscar_por'])) {
                if (isset($_POST['f_r_fecha_m']) && isset($_POST['f_r_fecha_M'])) {
                    $this->model_op->setVista($_POST['tabla']);
                    $this->model_op->setCampo('fecha');
                    $this->model_op->setFecha($_POST['f_r_fecha_m']);
                    $this->model_op->setFechaFin($_POST['f_r_fecha_M']);
                    $result = $this->model_op->rango_fecha();
                    $ordenes = $this->model->mostrar('v_ordenes');
                    $data = [
                        'salidas' => $result,
                        'ordenes' => $ordenes
                    ];
                    echo json_encode($data);
                }
            }
        }

        public function buscar_fecha()
        {
            if (isset($_POST['buscar_por'])) {
                if (isset($_POST['f_fecha'])) {
                    $this->model_op->setVista($_POST['tabla']);
                    $this->model_op->setCampo('fecha');
                    $this->model_op->setValorBuscar($_POST['f_fecha']);
                    $result = $this->model_op->buscar_informacion();
                    $ordenes = $this->model->mostrar('v_ordenes');
                    $data = [
                        'salidas' => $result,
                        'ordenes' => $ordenes
                    ];
                    echo json_encode($data);
                }
            }
        }

        public function buscar_mes()
        {
            if (isset($_POST['buscar_por'])) {
                if (isset($_POST['f_fecha_mes'])) {
                    $value = '-' . $_POST['f_fecha_mes'] . '-';

                    $this->model_op->setVista($_POST['tabla']);
                    $this->model_op->setCampo('fecha');
                    $this->model_op->setValorBuscar($value);
                    $result = $this->model_op->filtrar_informacion();
                    $ordenes = $this->model->mostrar('v_ordenes');
                    $data = [
                        'salidas' => $result,
                        'ordenes' => $ordenes
                    ];
                    echo json_encode($data);
                }
            }
        }

        public function buscar_anio()
        {
            if (isset($_POST['buscar_por'])) {
                if (isset($_POST['f_fecha_anio'])) {
                    $value = $_POST['f_fecha_anio'] . '-';

                    $this->model_op->setVista($_POST['tabla']);
                    $this->model_op->setCampo('fecha');
                    $this->model_op->setValorBuscar($value);
                    $result = $this->model_op->filtrar_informacion();
                    $ordenes = $this->model->mostrar('v_ordenes');
                    $data = [
                        'salidas' => $result,
                        'ordenes' => $ordenes
                    ];
                    echo json_encode($data);
                }
            }
        }

        public function buscar_cliente()
        {
            if (isset($_POST['buscar_por'])) {
                if (isset($_POST['f_cliente'])) {
                    $this->model_op->setVista($_POST['tabla']);
                    $this->model_op->setCampo('razon_social');
                    $this->model_op->setValorBuscar($_POST['f_cliente']);
                    $result = $this->model_op->buscar_informacion();
                    $ordenes = $this->model->mostrar('v_ordenes');
                    $data = [
                        'salidas' => $result,
                        'ordenes' => $ordenes
                    ];
                    echo json_encode($data);
                }
            }
        }
    }
?>