<?php 

    class Sesiones {
        public function resetear_id () {
            session_set_cookie_params(60*60*24*16);
            session_start();
        }
    }

?>