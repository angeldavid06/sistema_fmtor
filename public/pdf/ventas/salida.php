<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="style=devmin-width:ice;max-width:30%-style, inmin-width:iti;max-width:30%al-scale=1.0">
    <title>.</title>
    <link rel="stylesheet" href="https://www.fmtor.com/public/css/formato.css?1.3">
</head>
<body>
   
<table class="formato">
        <thead>
            <tr>
                <th class="th"></th>
            </tr>
        </thead>
        <br>
        <br>
        <body>
</table>
<table border="1" style= "width: 100%" >
			<caption></caption>
            <colgroup>
				<col style="style: 20min-width:%"/;max-width:30%>
				<col style="style: 40min-width:%"/;max-width:30%>
				<col style="style: 40min-width:%"/;max-width:30%>
			</colgroup>

            <?php require_once 'salida/tablasalida.php'?> 
			<thead>
            <div class="nombre txt-right">
                    <p><h3><?php echo $Salida; ?></p>
                </div>
                <div class="nombre txt-left">
                    <p><h3>Fecha:  <?php echo $Fecha; ?></p>
                </div>
                <div class="nombre txt-center">
                    <p><h3>Cliente:  <?php echo $Id_Clientes_2; ?></p>
                </div>

           <br>
				<tr>
					<th colspan="22"style="background-color: rgb(144, 202, 249);" ><h2>SALIDA DE ALMACÉN DE PRODUCTO TERMINADO</th>
				</tr>
				<tr style="background-color: rgb(144, 202, 249);">
                    
                    
                    <th colspan="2"><b><h3>Cantidad</b></th>	
                    <th colspan="2"><b><h3>Parte</b></th>	
                    <th colspan="2"><b><h3>Pedido</b></th>	
                    <th colspan="2"><b><h3>Medida</b></th>	
                    <th colspan="2"><b><h3>Descripcion</b></th>
                    <th colspan="2"><b><h3>Acabado</b></th>
                    <th colspan="2"><b><h3>Costo</b></th>
                    <th colspan="2"><b><h3>Factura</b></th>	
                    <th colspan="2"><b><h3>Empaque</b></th>
                    <th colspan="2"><b><h3>No.Plano</b></th>	
                    <th colspan="2"><b><h3>Material</b></th>			

                   
                </tr>

			</thead>
            <tbody style = "min-heigth:50%;max-heigth:50%;">
				
                <tr>
                    <th colspan="2"><b><h3><?php echo $Cantidad_millares?></b></th>	
                    <th colspan="2"><b><h3><?php echo $Codigo?></b></th>	
                    <th colspan="2"><b><h3><?php echo $Pedido_pza ?></b></th>	
                    <th colspan="2"><b><h3><?php echo $Medida ?></b></th>	
                    <th colspan="2"><b><h3><?php echo $Descripcion ?></b></th>
                    <th colspan="2"><b><h3><?php echo $Acabado ?></b></th>
                    <th colspan="2"><b><h3><?php echo $Precio_millar ?></b></th>
                    <th colspan="2"><b><h3><?php echo $Factura ?></b></th>	
                    <th colspan="2"><b><h3><br></b></th>
                    <th colspan="2"><b><h3><?php echo $Dibujo ?></b></th>	
                    <th colspan="2"><b><h3><?php echo $Material ?> </b></th>
            	</tr>

			</tbody>
			
			
          
            <tfoot>
            <tr>
					<th colspan="7"><br>AUTORIZADO POR </td></th>
                    <th colspan="7"><br>DESPACHADO POR </td></th>
                    <th colspan="8"><br>RECIBIDO POR </td></th>
				</tr>
                
			</tfoot>
		</table>
 <br>
 <br>
 <br>
        <div class="nombre txt-left">
                    <p><h3>Fecha Entrega:  <?php echo $Fecha_entrega; ?></p>
                    <p><h3>OP:  <?php echo $Id_Folio; ?></p>
                </div>




    <div class="header">
        <div class="d-grid g-2">
            <div class="logo-formato">
                <img src="https://www.fmtor.com/public/img/logo_formato.png" alt="">
            </div>
            <div class="d-flex flex-wrap justify-right">
                <div class="titulo txt-right">
                    <p>FORJADORA MEXICANA DE TORNILLOS</p>
                    <span>S.A. DE C.V. <br></span>
                </div>
                <div class="nombre txt-right">
                    <p>Salida<br> </p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="d-grid g-4">
            <div class="d-flex align-content-bottom">
                <p>Clave: </p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>Versión: </p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>Fecha de validación: </p>
            </div>
            <div class="d-flex align-content-bottom">
                <p>Página: </p>
            </div>
        </div>
    </div>
</body>
</html>