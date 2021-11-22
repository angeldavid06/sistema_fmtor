<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Control de Producción</title>
    <link rel="stylesheet" href="../../css/formato.css">
</head>
<body>
    <div class="reporte reporte_producción">
        <div class="encabezado">
            <table>
                <thead>
                    <th colspan="6">CONTROL DE PRODUCCIÓN</th>
                </thead>
                <tbody>
                    <tr>
                        <td rowspan="4" colspan="0" class="logo">
                            <div></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Dibujo: 035-10-32</td>
                        <td>Cantidad: 40,000</td>
                        <td colspan="3" class="OP">Orden de Producción: OP10863</td>
                    </tr>
                    <tr>
                        <td>Fecha: 04/08/2021</td>
                        <td colspan="4">Cliente: 296 MULTIELECTRICA</td>
                    </tr>
                    <tr>
                        <td>Descripción:</td>
                        <td>C/FIJ PH</td>
                        <td>10-32X1</td>
                        <td>TROPICALIZADO</td>
                        <td>0</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="seguimiento">
            <table>
                <thead>
                    <th colspan="4">titulo</th>
                    <th colspan="2">Factor:</th>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5">Total:</td>
                        <td>00.00</td>
                    </tr>
                </tfoot>
            </table>
            <table>
                <thead>
                    <th colspan="4">titulo</th>
                    <th colspan="2">Factor:</th>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5">Total:</td>
                        <td>00.00</td>
                    </tr>
                </tfoot>
            </table>
            <table>
                <thead>
                    <th colspan="4">titulo</th>
                    <th colspan="2">Factor:</th>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5">Total:</td>
                        <td>00.00</td>
                    </tr>
                </tfoot>
            </table>
            <table>
                <thead>
                    <th colspan="4">titulo</th>
                    <th colspan="2">Factor:</th>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5">Total:</td>
                        <td>00.00</td>
                    </tr>
                </tfoot>
            </table>
            <table>
                <thead>
                    <th colspan="4">titulo</th>
                    <th colspan="2">Factor:</th>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5">Total:</td>
                        <td>00.00</td>
                    </tr>
                </tfoot>
            </table>
            <table>
                <thead>
                    <th colspan="4">titulo</th>
                    <th colspan="2">Factor:</th>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5">Total:</td>
                        <td>00.00</td>
                    </tr>
                </tfoot>
            </table>
        </div>
        <div id="aux"></div>
    </div>
    <script src="../../js/fmtor_libreria.js"></script>
    <script>
        const vistas = ['v_forjado', 'v_ranurado', 'v_rolado', 'v_shank', 'v_cementado', 'v_acabado']

        const buscar_datos = (valor) => {
            for (let i = 0; i < vistas.length; i++) {
                const respuesta = fetchAPI('',url+'/produccion/control/obtener_control?control='+control,'');
                respuesta.then(json => {
                    document.getElementById('aux').innerText = json;
                })
            }
        }

        (() => {
            buscar_datos(<?php echo $_GET['valor'];?>)
        })()
    </script>
</body>
</html>