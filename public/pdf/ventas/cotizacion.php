<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cotizacion</title>
    <link rel="stylesheet" href="http:www.fmtor.com/public/css/formato.css?1.3">
</head>
<body>
  
    <table class="formato">
        <thead>
            <tr>
                <th class="th"></th>
            </tr>
        </thead>
        <tbody>
        <tr>
        <br>
        <br>
        <br>
                <th>Descripcion</th>
                <th>Medida</th>
                <th>Acabado</th>
                <th>Cantidad millares.</th>
                <th>Precio millar</th>
                <th>Total</th>
                 
                </tr>
        </thead>
        <tbody>
            <br>
            <br>
            <br>     <?php require_once 'pdf/tablacotizacion.php'; ?>
        </tbody>
        </tbody>
        <tfoot>
            <tr>

                <td class="td"></td>
            </tr>
        </tfoot>
    </table>
   Notas: Estos precios son en moneda nacional y no incluye IVA con entrega en CDMX y/o fletera de sus preferencia
    <br>
    <?php require_once 'pdf/notascotizacion.php'; ?>
    <br>
   En caso de que se produzca cualquier cambio en los precios , ya se por motivo de una repentina alza o caída de precios en los insumos que se utilizan en la fabricación <br>
     El"proveedor" está de acuerdo en revisar conjuntamente dichos precios con "el cliente"para llegar a un acuerdo entre ambos.
   <br> Solo se cuenta con 6 meses de garantia para revisar que el producto haya cumplido  con los requerimientos solicitados 
  <br> Se empacará en caja  de 20-25 kg.
    El precio estará sujeto a revision en el caso que el volumen de consumo sea modificado  una vez que sea emitida
    +/- 10% por cada Orden de compra.
    <br>
    <div class="header">
        <div class="d-grid g-2">
            <div class="logo-formato">
                <img src="http://www.fmtor.com/public/img/logo_formato.png" alt="">
            </div>
            <div class="d-flex flex-wrap justify-right">
                <div class="titulo txt-right">
                    <p>FORJADORA MEXICANA DE TORNILLOS</p>
                    <span>S.A. DE C.V. <br></span>
                </div>
                <div class="nombre txt-right">
                    <p>COTIZACION <br> </p>
                </div>
                <br>
        <th>Fecha</th>
        <?php require_once 'pdf/fechacotizacion.php'; ?>
        <br>
            </div>
        </div>
        <br>
        A continuacion, nos permitimos poner a su consideracion la cotizacion de la tornilleria solicitada <br>
        <br>
        <tbody>
        <?php require_once 'pdf/tablacotizacion.php'; ?>
        </tbody>
    </div>
    <br>
    <br>
    <H4><p style="text-align:center">  A T E N T A M E N T E<br>
    <?php require_once 'pdf/nombrecotizacion.php'; ?><br>
   
     
    <div class="footer">
       
        
    <H4><p style="text-align:center">Forjaodra Mexicana de Tornillos, S.A de C.V<br>
                Calle San Luis #20 Col.Lomas Estrella 09890 CDMX Iztapalapa<br>
                 Tels:5656-5947/5656-1902 Ext. 104/105<br>
                 Email:ventas@fmtor.mx  </p></H4>
                </div>
            
            </div>
        </div>
    </div>
</body>
</html>