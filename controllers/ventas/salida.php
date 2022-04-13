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

        public function historial () {
            $salida = $this->model->buscar('v_historial_salidas_almacen', 'Id_Folio', $_GET['salida']);
            $this->model = new Model();
            $ordenes = $this->model->mostrar('v_ordenes');

            $data = [
                'salida' => $salida,
                'ordenes' => $ordenes
            ];

             echo json_encode($data);
        }
        
        public function generarpdf()
        {
            $salida = $this->model->buscar('v_historial_salidas_almacen', $_GET['atributo'], $_GET['value']);
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

        public function obtener_pedido () {
            $pedido = $this->model->buscar_personalizado('v_historial_salidas_almacen', '*', 'Id_Pedido =' . $_GET['pedido'] . '');
            $obj = new Model();
            $orden = $obj->buscar('v_ordenes','Id_Pedido', $_GET['pedido']);
            $data = [
                'pedido' => $pedido,
                'orden' => $orden
            ];
            echo json_encode($data);
        }

        public function obtener_per()
        {
            $salidas = $this->model->buscar_personalizado('v_historial_salidas_almacen', '*', 'Id_Folio =' . $_GET['aux'] . '');
            $this->model = new Model();
            $ordenes = $this->model->mostrar('v_ordenes');
            if (isset($_GET['pedido']) && $_GET['pedido'] != 'undefined') {
                $this->model = new Model();
                $pedido = $this->model->buscar_personalizado('v_historial_salidas_almacen', '*', 'Id_Pedido =' . $_GET['pedido'] . '');
                $data = [
                    'salida' => $salidas,
                    'ordenes' => $ordenes,
                    'pedido' => $pedido
                ];
            } else{ 
                $data = [
                    'salida' => $salidas,
                    'ordenes' => $ordenes
                ];
            }
            echo json_encode($data);
        }

        public function obtener_salida () {
            $salida = $this->model->buscar_personalizado('t_salida_almacen', '*', 'Id_Folio =' . $_GET['aux'] . '');
            echo json_encode($salida);
        }

        public function obtener_clientes () {
            $result = $this->model->mostrar('v_clientes');
            echo json_encode($result);
        }

        public function NuevaSalida() { 
            $aux = 1;
            if (isset($_POST['concepto'])) {
                if (isset($_POST['cotizacion']) && $_POST['cotizacion'] != '') {
                    $this->salida->setId_Compra($_POST['cotizacion']);
                    $this->salida->setFecha($_POST['Fecha']);
    
                    $result = $this->salida->insertarSalidaCompra();
                    if ($result) {
                        echo 1;
                    } else {
                        echo 2;
                    }
                } else {
                    echo 0;
                }
            } else {
                if (isset($_POST['cotizacion']) && $_POST['cotizacion'] != '') {
                    $this->salida->setId_Clientes_2($_POST['cotizacion']);
                    $this->salida->setFecha($_POST['Fecha']);
    
                    $result = $this->salida->insertarSalida();
                    if ($result) {
                        for ($i = 1; $i <= $_POST['cantidad_tornillos']; $i++) {
                            if (!isset($_POST['sin_op_'.$i])) {
                                $this->salida->setDibujo($_POST['Dibujo_'.$i]);
                                $this->salida->setCantidad_producir($_POST['cantidad_producir_'.$i]);
                                $this->salida->setNo_Pedido($_POST['pedido_'.$i]);
                                $orden = json_encode($this->salida->insertarOrden());
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
        }

        public function actualizar_solo_salida () {
            if (isset($_POST['Salida_e']) && $_POST['Salida_e'] != '') {
                $this->salida->setSalida($_POST['Salida_e']);
                $this->salida->setId_Clientes_2($_POST['Id_Clientes_2_e']);
                $this->salida->setFecha($_POST['Fecha_e']);
                $this->salida->setEmpaque($_POST['Empaque']);
                $this->salida->setFactura($_POST['Factura']);
                $result = $this->salida->actualizarSoloSalida();

                if ($result) {
                    echo $result;
                } else {
                    echo 2;
                }
            }
        }

        public function actualizarSalida()
        {
            if (isset($_POST['Pedido_p']) && $_POST['Pedido_p'] != '') {
                $this->salida->setSalida(($_POST['Pedido_p']));
                $this->salida->setCantidad_millares($_POST['Cantidad_millares_p']);
                $this->salida->setCodigo($_POST['Codigo_p']);
                $this->salida->setPedido_pza($_POST['Pedido_pza_p']);
                $this->salida->setMedida($_POST['Medida_p']);
                $this->salida->setDescripcion($_POST['Descripcion_p']);
                $this->salida->setAcabado($_POST['Acabado_p']);
                $this->salida->setPrecio_millar($_POST['Precio_millar_p']);
                $this->salida->setFactor($_POST['factor_p']);
                $this->salida->setFecha_entrega($_POST['Fecha_entrega_p']);
                $this->salida->setMaterial($_POST['Material_p']);

                if (!isset($_POST['sin_op_p'])) {
                    $this->salida->setDibujo($_POST['Dibujo_p']);
                    $this->salida->setCantidad_producir($_POST['cantidad_producir_p']);

                   $this->salida->actualizarOrden();
                }

                if (isset($_POST['op_cancelar']) && $_POST['op_cancelar'] == 'on') {
                    $this->salida->cancelarOrden();
                }

                if (isset($_POST['tratamiento_p']) && $_POST['tratamiento_p'] == 'on') {
                    $this->salida->setTratamiento('T/TERMICO'); 
                } else {
                    $this->salida->setTratamiento('0'); 
                }

                $result = $this->salida->actualizarSalida();
                
                if ($result) {
                    echo 1;
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