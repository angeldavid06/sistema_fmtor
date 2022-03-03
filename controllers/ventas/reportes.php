<?php
    require_once "models/Model.php";
    require_once "models/ventas/reporteModel.php";
    require_once "models/produccion/t_op.php";
    require_once "routes/web.php";

    class reportes
    {
        public $model;
        public $web;
        public $reporte;
        public $model_op;

        public function __construct()
        {
            $this->reporte = new reporteModel();
            $this->web = new Web();
            $this->model = new Model();
            $this->model_op = new t_op();
        }

        public function buscar()
        {
            $id_reporte = $_GET['clave'];

            $result = $this->model->buscar('v_mensual_reporte', 'Id_reporte', $id_reporte);
            echo json_encode($result);
        }

        public function obtener()
        {
            $result = $this->model->mostrar('v_historial_salidas_almacen');
            $obj = new Model();
            $ordenes = $obj->mostrar('v_ordenes');
            
            $data = [
                'salidas' => $result,
                'ordenes' => $ordenes
            ];
            
            echo json_encode($data);
        }
        
        public function buscar_salida()
        {
            if (isset($_POST['buscar_por_fecha'])) {
                if (isset($_POST['f_salida'])) {
                    $this->model_op->setVista('v_historial_salidas_almacen');
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
            if (isset($_POST['buscar_por_fecha'])) {
                if (isset($_POST['f_r_salida_m']) && isset($_POST['f_r_salida_M'])) {
                    $this->model_op->setVista('v_historial_salidas_almacen');
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
            if (isset($_POST['buscar_por_fecha'])) {
                if (isset($_POST['f_r_fecha_m']) && isset($_POST['f_r_fecha_M'])) {
                    $this->model_op->setVista('v_historial_salidas_almacen');
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
            if (isset($_POST['buscar_por_fecha'])) {
                if (isset($_POST['f_fecha'])) {
                    $this->model_op->setVista('v_historial_salidas_almacen');
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
            if (isset($_POST['buscar_por_fecha'])) {
                if (isset($_POST['f_fecha_mes'])) {
                    $value = $_POST['f_fecha_mes'] . '-';

                    $this->model_op->setVista('v_historial_salidas_almacen');
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
            if (isset($_POST['buscar_por_fecha'])) {
                if (isset($_POST['f_fecha_anio'])) {
                    $value = $_POST['f_fecha_anio'] . '-';

                    $this->model_op->setVista('v_historial_salidas_almacen');
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
                if (isset($_POST['f_cliente']) && !isset($_POST['buscar_por_fecha'])) {
                    $this->model_op->setVista('v_historial_salidas_almacen');
                    $this->model_op->setCampo('razon_social');
                    $this->model_op->setValorBuscar($_POST['f_cliente']);
                    $result = $this->model_op->buscar_informacion();
                    $ordenes = $this->model->mostrar('v_ordenes');
                    $data = [
                        'salidas' => $result,
                        'ordenes' => $ordenes
                    ];
                    echo json_encode($data);
                } else {
                    if (isset($_POST['f_fecha'])) {
                        $condicion = "razon_social = '".$_POST['f_cliente']."' AND fecha = '". $_POST['f_fecha']."'";
                        $result = $this->model->buscar_personalizado('v_historial_salidas_almacen','*',$condicion);
                        $this->model = new Model();
                        $ordenes = $this->model->mostrar('v_ordenes');
                        $data = [
                            'salidas' => $result,
                            'ordenes' => $ordenes
                        ];
                        echo json_encode($data);
                    } else if (isset($_POST['f_fecha_mes'])) {
                        $value = $_POST['f_fecha_mes'] . '-';

                        $condicion = "razon_social = '" . $_POST['f_cliente'] . "' AND fecha LIKE '%" . $value . "%'";
                        $result = $this->model->buscar_personalizado('v_historial_salidas_almacen', '*', $condicion);
                        $this->model = new Model();
                        $ordenes = $this->model->mostrar('v_ordenes');
                        $data = [
                            'salidas' => $result,
                            'ordenes' => $ordenes
                        ];
                        echo json_encode($data);
                    } else if (isset($_POST['f_fecha_anio'])) {
                        $value = $_POST['f_fecha_anio'] . '-';

                        $condicion = "razon_social = '" . $_POST['f_cliente'] . "' AND fecha LIKE '%" . $value. "%'";
                        $result = $this->model->buscar_personalizado('v_historial_salidas_almacen', '*', $condicion);
                        $this->model = new Model();
                        $ordenes = $this->model->mostrar('v_ordenes');
                        $data = [
                            'salidas' => $result,
                            'ordenes' => $ordenes
                        ];
                        echo json_encode($data);
                    } else if (isset($_POST['f_r_fecha_m']) && isset($_POST['f_r_fecha_M'])) {
                        $condicion = "razon_social = '" . $_POST['f_cliente'] . "' AND fecha BETWEEN '" . $_POST['f_r_fecha_m'] . "' AND '" . $_POST['f_r_fecha_M'] . "'";
                        $result = $this->model->buscar_personalizado('v_historial_salidas_almacen', '*', $condicion);
                        $this->model = new Model();
                        $ordenes = $this->model->mostrar('v_ordenes');
                        $data = [
                            'salidas' => $result,
                            'ordenes' => $ordenes
                        ];
                        echo json_encode($data);
                    } else {
                        echo 0;
                    }
                }
            }
        }
    }
