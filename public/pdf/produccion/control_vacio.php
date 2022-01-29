<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>.</title>
    <link rel="stylesheet" href="http://localhost/sistema_fmtor/public/css/formato.css?1.3">
</head>
<body>
    <table class="formato">
        <thead>
            <tr>
                <th class="th"></th>
            </tr>
            <tr>
                <th>Dibujo: <?php echo $data['control'][0]['plano']; ?></th>
                <th>Cantidad: <?php echo $data['control'][0]['cantidad_elaborar']; ?></th>
                <th class="OP">Orden de Producción: OP<?php echo $data['control'][0]['Orden_Produccion']; ?></th>
            </tr>
            <tr>
                <th>Fecha: <?php echo explode(' ',$data['control'][0]['Fecha'])[0]; ?></th>
                <th style="background: yellow">Cliente: <?php echo $data['control'][0]['Cliente']; ?></th>
                <th>Descripción: <?php echo $data['control'][0]['descripcion']; ?></th>
            </tr>
            <tr>
                <th style="background: green; color: white;" colspan="2">Tratamiento: <?php echo $data['control'][0]['tratamiento']; ?></th>
                <th>Material: <?php echo $data['control'][0]['material']; ?></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="td-sn-pd">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="3" class="th-estado">FORJADO</th>
                                <th colspan="2" class="txt-left">Factor: </th>
                            </tr>
                            <tr>
                                <th>Botes</th>
                                <th>Fecha</th>
                                <th>Pzas.</th>
                                <th>Pzas. Acumuladas</th>
                                <th>K.g.</th>
                            </tr>
                        </thead>
                        <tbody id="v_forjado">
                            <?php 
                                for ($i=0; $i < 11; $i++) { 
                                    echo '<tr>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                            '<tr>';
                                }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td style="height: 10px;" colspan="4">Total:</td>
                                <td style="height: 10px;"></td>
                            </tr>
                        </tfoot>
                    </table>
                </td>
                <td class="td-sn-pd">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="3" class="th-estado">RANURADO</th>
                                <th colspan="2" class="txt-left">Factor: </th>
                            </tr>
                            <tr>
                                <th>Botes</th>
                                <th>Fecha</th>
                                <th>Pzas.</th>
                                <th>Pzas. Acumuladas</th>
                                <th>K.g.</th>
                            </tr>
                        </thead>
                        <tbody id="v_forjado">
                            <?php 
                                for ($i=0; $i < 11; $i++) { 
                                    echo '<tr>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                            '<tr>';
                                }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td style="height: 10px;" colspan="4">Total:</td>
                                <td style="height: 10px;"></td>
                            </tr>
                        </tfoot>
                    </table>
                </td>
                <td class="td-sn-pd">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="3" class="th-estado">ROLADO</th>
                                <th colspan="2" class="txt-left">Factor: </th>
                            </tr>
                            <tr>
                                <th>Botes</th>
                                <th>Fecha</th>
                                <th>Pzas.</th>
                                <th>Pzas. Acumuladas</th>
                                <th>K.g.</th>
                            </tr>
                        </thead>
                        <tbody id="v_forjado">
                            <?php 
                                for ($i=0; $i < 11; $i++) { 
                                    echo '<tr>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                            '<tr>';
                                }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td style="height: 10px;" colspan="4">Total:</td>
                                <td style="height: 10px;"></td>
                            </tr>
                        </tfoot>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="td-sn-pd">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="3" class="th-estado">SHANK</th>
                                <th colspan="2" class="txt-left">Factor: </th>
                            </tr>
                            <tr>
                                <th>Botes</th>
                                <th>Fecha</th>
                                <th>Pzas.</th>
                                <th>Pzas. Acumuladas</th>
                                <th>K.g.</th>
                            </tr>
                        </thead>
                        <tbody id="v_forjado">
                            <?php 
                                for ($i=0; $i < 11; $i++) { 
                                    echo '<tr>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                            '<tr>';
                                }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td style="height: 10px;" colspan="4">Total:</td>
                                <td style="height: 10px;"></td>
                            </tr>
                        </tfoot>
                    </table>
                </td>
                <td class="td-sn-pd">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="3" class="th-estado">CEMENTADO</th>
                                <th colspan="2" class="txt-left">Factor: </th>
                            </tr>
                            <tr>
                                <th>Botes</th>
                                <th>Fecha</th>
                                <th>Pzas.</th>
                                <th>Pzas. Acumuladas</th>
                                <th>K.g.</th>
                            </tr>
                        </thead>
                        <tbody id="v_forjado">
                            <?php 
                                for ($i=0; $i < 11; $i++) { 
                                    echo '<tr>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                            '<tr>';
                                }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td style="height: 10px;" colspan="4">Total:</td>
                                <td style="height: 10px;"></td>
                            </tr>
                        </tfoot>
                    </table>
                </td>
                <td class="td-sn-pd">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="3" class="th-estado">ACABADO</th>
                                <th colspan="2" class="txt-left">Factor: </th>
                            </tr>
                            <tr>
                                <th>Botes</th>
                                <th>Fecha</th>
                                <th>Pzas.</th>
                                <th>Pzas. Acumuladas</th>
                                <th>K.g.</th>
                            </tr>
                        </thead>
                        <tbody id="v_forjado">
                            <?php 
                                for ($i=0; $i < 11; $i++) { 
                                    echo '<tr>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                                '<td style="height: 10px;"></td>'.
                                            '<tr>';
                                }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td style="height: 10px;" colspan="4">Total:</td>
                                <td style="height: 10px;"></td>
                            </tr>
                        </tfoot>
                    </table>
                </td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td class="td"></td>
            </tr>
        </tfoot>
    </table>
    <div class="header">
        <div class="d-grid g-2">
            <div class="logo-formato">
                <img src="http://localhost/sistema_fmtor/public/img/logo_formato.png" alt="">
            </div>
            <div class="d-flex flex-wrap justify-right">
                <div class="titulo txt-right">
                    <p>FORJADORA MEXICANA DE TORNILLOS</p>
                    <span>S.A. DE C.V.</span>
                </div>
                <div class="nombre txt-right">
                    <p>CONTROL DE PRODUCCIÓN</p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="d-grid g-3">
            <div class="d-flex align-content-bottom">
                <p>CLAVE: PRO-F-000</p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>VERSIÓN: 2</p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>FECHA DE APROBACIÓN: </p>
            </div>
        </div>
    </div>
</body>
</html>