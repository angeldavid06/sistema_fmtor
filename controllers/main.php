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

        public function iniciar () {
            if (isset($_POST['nombre']) && isset($_POST['password'])) {
                if ($_POST['nombre'] != '' && $_POST['password'] != '') {
                    $nombre = $_POST['nombre'];
                    $password = $_POST['password'];
                    
                    $valiacion = self::validar_usuario($nombre,$password);
                    if ($valiacion > 0) {
                        // $informacion = $this->model->buscar_personalizado('t_usuarios','nombre,rol,',"nombre = '$nombre'");
                        // $sesiones = self::generar_sesiones('','','');
                        $sesiones = [
                            "nombre" => 'Nombre de usuario',
                            "rol" => 'ADMINISTRADOR',
                            "depto" => 'ventas'
                        ];
                        echo json_encode($sesiones);
                    } else {
                        echo 0;
                    }
                } else {
                    echo 0;
                }
            } 
        }

        public function validar_usuario ($nombre,$password) {
            $resultado = $this->model->validar_password('t_usuarios',"nombre = '$nombre'");
            if (password_verify($password,$resultado['password'])) {
                return 1;
            } else  {
                return 0;
            }
        }

        public function generar_sesiones ($nombre,$rol,$depto) {
            $_SESSION['nombre_usuario'] = $nombre;
            $_SESSION['rol'] = $rol;
            $_SESSION['depto'] = $depto;

            $sesiones = [
                "nombre" => $_SESSION['nombre_usuario'],
                "rol" => $_SESSION['rol'],
                "depto" => $_SESSION['depto']
            ];

            return $sesiones;
        }
    }

?>