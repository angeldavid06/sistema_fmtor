<?php 

    class App {
        public function __construct() {
            $url = $_GET['url'];
            $url = rtrim($url,'/');
            $url = explode('/', $url);

            if (count($url) == 2) {
                $archivoController = 'controllers/'.$url[0].'.php';
                if (file_exists($archivoController)) {
                    require_once $archivoController;
                    $controller = new $url[0]();
                    if (isset($url[1]) && method_exists($controller,$url[1])) {
                        $controller->{$url[1]}();
                    } else {
                        echo '<p>Error: el método no existe</p>';
                    }
                } else {
                    echo '<p>El controlador no existe</p>';
                }
            } else if (count($url) == 3) {
                $archivoController = 'controllers/'.$url[0].'/'.$url[1].'.php';
                if (file_exists($archivoController)) {
                    require_once $archivoController;
                    $controller = new $url[1]();
                    if (isset($url[2]) && method_exists($controller,$url[2])) {
                        $controller->{$url[2]}();
                    } else {
                        echo '<p>Error: el método no existe</p>';
                    }
                } else {
                    echo '<p>'.$archivoController.'</p>';
                    echo '<p>El controlador no existe</p>';
                }
            }

        }
    }

?>