<?php require_once 'public/modules/sesion_depto.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head> 
    <?php require_once 'public/modules/head.php' ?>
    <title>Programa de Forjado</title>
</head>
<body>
    <style>
        .herramental {
            background: #F20505;
            color: white;
        }
        .herramental td {
            color: white;
        }
        .mantenimiento {
            background: #F20505;
            color: white;
        }
        .mantenimiento td {
            color: white;
        }
        .linea {
            background: #FFFF00;
            color: black;
        }
        .linea td {
            color: black;
        }
        .maquina {
            background: #AA9BBF; 
            color: white;
        }
        .maquina td {
            color: white;
        }
    </style>
    <div class="contenedor">
        <a href="#top" class="btn btn-icon-self btn-flotante material-icons" id="btn-subir">expand_less</a>
        <?php require_once 'public/modules/menus/menu_usuario.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
                <div class="d-grid g2-5-5">
                    <div style="padding-top: 0px;" class="tarjeta-transparente">
                        <h1>Programa de Forjado</h1>
                    </div>
                    <div style="padding-top: 0px;" class="tarjeta-transparente d-flex justify-right align-content-center flex-wrap">
                        <button class="btn btn-icon-self btn-transparent material-icons" data-modal="modal-programa_insertar">add</button>
                        <button class="btn-impresion btn btn-icon" data-impresion="documento">
                            <i class="material-icons" data-impresion="documento">description</i>
                            Generar Documento
                        </button>
                    </div>
                </div>
                <div class="tarjeta">
                    <table>
                        <tbody id="body_maquina">
                            <tr>
                                <td>Kilos:</td>
                                <td id="total_kilos"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>Total:</td>
                                <td id="total_semana">$ 00.00</td>
                            </tr>
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
                <div class="tarjeta">
                    <h2 class="txt-center" style="padding-bottom: 20px;">Máquina 1</h2>
                    <table>
                        <head>
                            <tr>
                                <th style="padding: 10px 0px; ">CAL.</th>
                                <th style="padding: 10px 0px; min-width: 80px;">Kg.</th>
                                <th style="padding: 10px 0px; ">Factor</th>
                                <th style="padding: 10px 0px; min-width: 80px;">N° O.P.</th>
                                <th style="padding: 10px 0px; min-width: 110px;">Fecha de O.P.</th>
                                <th style="padding: 10px 0px; min-width: 80px;">Cliente</th>
                                <th style="padding: 10px 0px; min-width: 190px;">Descripción</th>
                                <th style="padding: 10px 0px; min-width: 130px;">Acabado</th>
                                <th style="padding: 10px 0px; ">Cant.</th>
                                <th style="padding: 10px 0px; min-width: 80px;">Precio</th>
                                <th style="padding: 10px 0px; min-width: 110px;">Fecha Entrega</th>
                                <th style="padding: 10px 0px; ">Herramental</th>
                                <th style="padding: 10px 0px; min-width: 120px;">Tratamiento</th>
                                <th style="padding: 10px 0px; min-width: 150px;"></th>
                            </tr>
                        </head>
                        <tbody id="body_maquina_1">
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
                <div class="tarjeta">
                    <h2 class="txt-center" style="padding-bottom: 20px;">Máquina 2</h2>
                    <table>
                        <head>
                            <tr>
                                <th  style="padding: 10px 0px; ">CAL.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Kg.</th>
                                <th  style="padding: 10px 0px; ">Factor</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">N° O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha de O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Cliente</th>
                                <th  style="padding: 10px 0px;  min-width: 190px;">Descripción</th>
                                <th  style="padding: 10px 0px;  min-width: 130px;">Acabado</th>
                                <th  style="padding: 10px 0px; ">Cant.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Precio</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha Entrega</th>
                                <th  style="padding: 10px 0px; ">Herramental</th>
                                <th  style="padding: 10px 0px;  min-width: 120px;">Tratamiento</th>
                                <th  style="padding: 10px 0px;  min-width: 150px;"></th>
                            </tr>
                        </head>
                        <tbody id="body_maquina_2">
                            <!-- <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>$ 00.00</td>
                            </tr> -->
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
                <div class="tarjeta">
                    <h2 class="txt-center" style="padding-bottom: 20px;">Máquina 3</h2>
                    <table>
                        <head>
                            <tr>
                                <th  style="padding: 10px 0px; ">CAL.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Kg.</th>
                                <th  style="padding: 10px 0px; ">Factor</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">N° O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha de O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Cliente</th>
                                <th  style="padding: 10px 0px;  min-width: 190px;">Descripción</th>
                                <th  style="padding: 10px 0px;  min-width: 130px;">Acabado</th>
                                <th  style="padding: 10px 0px; ">Cant.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Precio</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha Entrega</th>
                                <th  style="padding: 10px 0px; ">Herramental</th>
                                <th  style="padding: 10px 0px;  min-width: 120px;">Tratamiento</th>
                                <th  style="padding: 10px 0px;  min-width: 150px;"></th>
                            </tr>
                        </head>
                        <tbody id="body_maquina_3">
                            <!-- <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>$ 00.00</td>
                            </tr> -->
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
                <div class="tarjeta">
                    <h2 class="txt-center" style="padding-bottom: 20px;">Máquina 4</h2>
                    <table>
                        <head>
                            <tr>
                                <th  style="padding: 10px 0px; ">CAL.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Kg.</th>
                                <th  style="padding: 10px 0px; ">Factor</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">N° O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha de O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Cliente</th>
                                <th  style="padding: 10px 0px;  min-width: 190px;">Descripción</th>
                                <th  style="padding: 10px 0px;  min-width: 130px;">Acabado</th>
                                <th  style="padding: 10px 0px; ">Cant.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Precio</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha Entrega</th>
                                <th  style="padding: 10px 0px; ">Herramental</th>
                                <th  style="padding: 10px 0px;  min-width: 120px;">Tratamiento</th>
                                <th  style="padding: 10px 0px;  min-width: 150px;"></th>
                            </tr>
                        </head>
                        <tbody id="body_maquina_4">
                            <!-- <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>$ 00.00</td>
                            </tr> -->
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
                <div class="tarjeta">
                    <h2 class="txt-center" style="padding-bottom: 20px;">Máquina 5</h2>
                    <table>
                        <head>
                            <tr>
                                <th  style="padding: 10px 0px; ">CAL.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Kg.</th>
                                <th  style="padding: 10px 0px; ">Factor</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">N° O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha de O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Cliente</th>
                                <th  style="padding: 10px 0px;  min-width: 190px;">Descripción</th>
                                <th  style="padding: 10px 0px;  min-width: 130px;">Acabado</th>
                                <th  style="padding: 10px 0px; ">Cant.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Precio</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha Entrega</th>
                                <th  style="padding: 10px 0px; ">Herramental</th>
                                <th  style="padding: 10px 0px;  min-width: 120px;">Tratamiento</th>
                                <th  style="padding: 10px 0px;  min-width: 150px;"></th>
                            </tr>
                        </head>
                        <tbody id="body_maquina_5">
                            <!-- <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>$ 00.00</td>
                            </tr> -->
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
                <div class="tarjeta">
                    <h2 class="txt-center" style="padding-bottom: 20px;">Máquina 6</h2>
                    <table>
                        <head>
                            <tr>
                                <th  style="padding: 10px 0px; ">CAL.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Kg.</th>
                                <th  style="padding: 10px 0px; ">Factor</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">N° O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha de O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Cliente</th>
                                <th  style="padding: 10px 0px;  min-width: 190px;">Descripción</th>
                                <th  style="padding: 10px 0px;  min-width: 130px;">Acabado</th>
                                <th  style="padding: 10px 0px; ">Cant.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Precio</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha Entrega</th>
                                <th  style="padding: 10px 0px; ">Herramental</th>
                                <th  style="padding: 10px 0px;  min-width: 120px;">Tratamiento</th>
                                <th  style="padding: 10px 0px;  min-width: 150px;"></th>
                            </tr>
                        </head>
                        <tbody id="body_maquina_6">
                            <!-- <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>$ 00.00</td>
                            </tr> -->
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
                <div class="tarjeta">
                    <h2 class="txt-center" style="padding-bottom: 20px;">Máquina 7</h2>
                    <table>
                        <head>
                            <tr>
                                <th  style="padding: 10px 0px; ">CAL.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Kg.</th>
                                <th  style="padding: 10px 0px; ">Factor</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">N° O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha de O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Cliente</th>
                                <th  style="padding: 10px 0px;  min-width: 190px;">Descripción</th>
                                <th  style="padding: 10px 0px;  min-width: 130px;">Acabado</th>
                                <th  style="padding: 10px 0px; ">Cant.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Precio</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha Entrega</th>
                                <th  style="padding: 10px 0px; ">Herramental</th>
                                <th  style="padding: 10px 0px;  min-width: 120px;">Tratamiento</th>
                                <th  style="padding: 10px 0px;  min-width: 150px;"></th>
                            </tr>
                        </head>
                        <tbody id="body_maquina_7">
                            <!-- <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>$ 00.00</td>
                            </tr> -->
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
                <div class="tarjeta">
                    <h2 class="txt-center" style="padding-bottom: 20px;">Máquina 8</h2>
                    <table>
                        <head>
                            <tr>
                                <th  style="padding: 10px 0px; ">CAL.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Kg.</th>
                                <th  style="padding: 10px 0px; ">Factor</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">N° O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha de O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Cliente</th>
                                <th  style="padding: 10px 0px;  min-width: 190px;">Descripción</th>
                                <th  style="padding: 10px 0px;  min-width: 130px;">Acabado</th>
                                <th  style="padding: 10px 0px; ">Cant.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Precio</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha Entrega</th>
                                <th  style="padding: 10px 0px; ">Herramental</th>
                                <th  style="padding: 10px 0px;  min-width: 120px;">Tratamiento</th>
                                <th  style="padding: 10px 0px;  min-width: 150px;"></th>
                            </tr>
                        </head>
                        <tbody id="body_maquina_8">
                            <!-- <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>$ 00.00</td>
                            </tr> -->
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
                <div class="tarjeta">
                    <h2 class="txt-center" style="padding-bottom: 20px;">Máquina 9</h2>
                    <table>
                        <head>
                            <tr>
                                <th  style="padding: 10px 0px; ">CAL.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Kg.</th>
                                <th  style="padding: 10px 0px; ">Factor</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">N° O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha de O.P.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Cliente</th>
                                <th  style="padding: 10px 0px;  min-width: 190px;">Descripción</th>
                                <th  style="padding: 10px 0px;  min-width: 130px;">Acabado</th>
                                <th  style="padding: 10px 0px; ">Cant.</th>
                                <th  style="padding: 10px 0px;  min-width: 80px;">Precio</th>
                                <th  style="padding: 10px 0px;  min-width: 110px;">Fecha Entrega</th>
                                <th  style="padding: 10px 0px; ">Herramental</th>
                                <th  style="padding: 10px 0px;  min-width: 120px;">Tratamiento</th>
                                <th  style="padding: 10px 0px;  min-width: 150px;"></th>
                            </tr>
                        </head>
                        <tbody id="body_maquina_9">
                            <!-- <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>$ 00.00</td>
                            </tr> -->
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
                <?php 
                    require_once 'public/modules/produccion/programa_editar_modal.php';
                    // require_once 'public/modules/produccion/plano_modal.php'; 
                    // require_once 'public/modules/produccion/calibre_modal.php'; 
                ?>
            </div>
        </div>
    </div>
    <script src="../public/js/fmtor_libreria.js"></script>
    <script src="../public/js/produccion/programa_forjado.js"></script>
</body>
</html>