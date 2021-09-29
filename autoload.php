<?php

    function calidad ($clase) {
        if (file_exists(__DIR__.'\controllers/calidad/'.$clase.'.php')) {
            require_once __DIR__.'\controllers/calidad/'.$clase.'.php';
        } else {
            return false;
        }
    }

    function checador ($clase) {
        if (file_exists(__DIR__.'\controllers/checador/'.$clase.'.php')) {
            require_once __DIR__.'\controllers/checador/'.$clase.'.php';
        } else {
            return false;
        }
    }

    function produccion ($clase) {
        if (file_exists(__DIR__.'\controllers/produccion/'.$clase.'.php')) {
            require_once __DIR__.'\controllers/produccion/'.$clase.'.php';
        } else {
            return false;
        }
    }

    function sii ($clase) {
        if (file_exists(__DIR__.'\controllers/sii/'.$clase.'.php')) {
            require_once __DIR__.'\controllers/sii/'.$clase.'.php';
        } else {
            return false;
        }
    }

    function ventas ($clase) {
        if (file_exists(__DIR__.'\controllers/ventas/'.$clase.'.php')) {
            require_once __DIR__.'\controllers/ventas/'.$clase.'.php';
        } else {
            return false;
        }
    }

    spl_autoload_register('calidad');
    spl_autoload_register('checador');
    spl_autoload_register('produccion');
    spl_autoload_register('sii');
    spl_autoload_register('ventas');

?>