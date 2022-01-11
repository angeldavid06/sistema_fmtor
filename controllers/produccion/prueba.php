<?php 

    session_set_cookie_params(1*1*1*1);
    session_start();
    $sesion = session_id();
    echo '<p>Sesión vieja: '.$sesion.'</p>';
    if ($sesion == 'dpj7n8q4dj3ihopinrdg064o7c') {
        echo 'Hola Mundo';
    }
    $nueva = session_regenerate_id();
    $sesion = session_id();
    echo '<p>Sesión nueva: '.$sesion.'</p>';

?>

<h1>Hola Mundo</h1>