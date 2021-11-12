<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'public/modules/head.php' ?>
    <title>Página Principal</title>
</head>
<body>
    <div class="contenedor">
        <a href="#top" class="btn btn-icon btn-flotante" id="btn-subir">
            <i class="material-icons">expand_less</i> 
            Subir
        </a>
        <?php require_once 'public/modules/menus/produccion.php'; ?>
        <div class="contenido hidde_menu" id="contenido">
            <?php require_once 'public/modules/header.php'; ?>
            <div class="informacion">
                <h1>Máquinas de Producción</h1>
                <div class="tarjeta-transparente d-grid g2-9-1">
                    <div class="d-grid g-2">
                        <input type="month" name="fecha_reporte" id="fecha_reporte">
                        <select name="pzas_kilos" id="pzas_kilos">
                            <option value="">Selecciona el tipo de reporte</option>
                            <option value="kilos">Kilos</option>
                            <option value="pzas">Piezas</option>
                        </select>
                    </div>
                    <div class="d-flex align-content-center justify-right">
                        <button class="btn btn-icon-self material-icons">description</button>
                    </div>
                </div>
                <div class="tarjeta">
                    <table>
                        <thead>
                            <tr>
                                <th>Día</th>
                                <th>Máquina 1</th>
                                <th>Máquina 2</th>
                                <th>Máquina 3</th>
                                <th>Máquina 4</th>
                                <th>Máquina 5</th>
                                <th>Máquina 6</th>
                                <th>Máquina 7</th>
                                <th>Máquina 8</th>
                                <th>Máquina 9</th>
                            </tr>
                        </thead>
                        <tbody id="body">
                            <!-- <tr>
                                <td>00/00/00</td>
                                <td>Lunes</td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                            </tr>
                            <tr>
                                <td>00/00/00</td>
                                <td>Lunes</td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                            </tr>
                            <tr>
                                <td>00/00/00</td>
                                <td>Lunes</td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                            </tr>
                            <tr>
                                <td>00/00/00</td>
                                <td>Lunes</td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                            </tr> -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script src="../../public/js/fmtor_libreria.js"></script>
    <script>

        const dias = {
            nombre: ["","Lunes","Martes","Miercoles","Jueves","Viernes","Sabados"]
        }
        
        const quitar_dias = () => {
            const body = document.getElementById('body')
            while (body.firstChild) {
                body.removeChild(body.firstChild)
            }
        }

        const obtener_dias = (anio, mes) => {
            quitar_dias()
            const fragmento = document.createDocumentFragment()
            const fecha = new Date(anio, mes, 0).getDate()
            
            for (let i = 1; i <= fecha; i++) {
                const fecha_exacta = new Date(anio, mes-1, i)
                if (fecha_exacta.getDay() != 0) {
                    document.getElementById('body').innerHTML += '<tr>'+
                                                                    '<td>'+fecha_exacta.getDate()+' - '+dias.nombre[fecha_exacta.getDay()]+'</td>' +
                                                                    '<td></td>' +
                                                                    '<td></td>' +
                                                                    '<td></td>' +
                                                                    '<td></td>' +
                                                                    '<td></td>' +
                                                                    '<td></td>' +
                                                                    '<td></td>' +
                                                                    '<td></td>' +
                                                                    '<td></td>'+
                                                                '</tr>';
                }
            }
        }

        const input = document.getElementById('fecha_reporte')

        input.addEventListener('change', () => {
            const fecha = input.value.split('-')
            obtener_dias(fecha[0],fecha[1])
        })  
    </script>
</body>
</html>