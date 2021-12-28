<?php 

    require_once 'routes/web.php';
    require_once 'models/Model.php';

    class Main {
        public $web;

        public function __construct() {
            $this->web = new Web();
            $this->model = new Model();
        }
        
        public function login () {
            $this->web->View('login','');
        }

        public function cerrar_sesion () {
            $result = $this->model->cerrar_sesion();
            echo $result;
        }

        public function iniciar () {
            if (isset($_POST['nombre']) && isset($_POST['password'])) {
                if ($_POST['nombre' ] != '' && $_POST['password'] != '') {
                    $nombre = $_POST['nombre'];
                    $password = $_POST['password'];
                    
                    $valiacion = self::validar_usuario($nombre,$password);
                    if ($valiacion > 0) {
                        $this->model = new Model();
                        $informacion = $this->model->buscar('v_login','usuario',$nombre);
                        $sesiones = self::generar_sesiones($informacion[0]['id_empleados'],$informacion[0]['nombre_completo'],$informacion[0]['nombreRol'],$informacion[0]['nombre_departamento'],$informacion[0]['foto']);
                    
                        echo json_encode($sesiones);
                    } else {
                        echo 2;
                    }
                } else {
                    echo 0;
                }
            } 
        }

        public function validar_usuario ($nombre,$password) {
            $resultado = $this->model->validar_password("usuario = '$nombre'");
            if (password_verify($password,$resultado[0]['contrasena'])) {
                return 1;
            } else  {
                return 0;
            }
        }

        public function generar_sesiones ($empleado,$nombre,$rol,$depto,$foto) {
            $_SESSION['empleado'] = $empleado;
            $_SESSION['nombre_usuario'] = $nombre;
            $_SESSION['rol'] = $rol;
            $_SESSION['depto'] = $depto;
            $_SESSION['foto'] = $foto;

            $depto = [
                "depto" => $_SESSION['depto']
            ];

            return $depto;
        }

        public function prueba () {
            $this->web->View('prueba','');
        }

        public function op () {
            echo json_encode($this->model->mostrar('ordenes'));
        }
    }

?>