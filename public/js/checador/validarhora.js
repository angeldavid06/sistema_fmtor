//botoones
const btn_alert = document.getElementById('btn-alert')
const btn_Hora = document.getElementById('btn-Hora')
const horaE = document.getElementById('horaE')
const btn_incidencia = document.getElementById('btn-incidencia')
const hoy = new Date();
const fecha1 = new Date();
const hora = new Date();
const fecha2 = new Date();
const fecha3 = new Date();
const fecha4 = new Date();
//hoy.getHours() + ':' + hoy.getMinutes() + ':' + hoy.getSeconds();
//const fechaYhora = fecha + ' ' + hora;
 hoy.setHours('12','00','00');
 fecha1.setHours('00','10','00');+
 fecha2.setHours('12','40','00');
 fecha3.setHours('12','50','00');
 fecha4.setHours('12','55','00');
 console.log(fecha1)
 console.log(hoy.getHours()+hoy.getMinutes())
 //hoy.setMinutes('20');

 const entrada = new Date();
entrada.setHours( hoy.getHours());
entrada.setMinutes( hoy.getMinutes());

 const entrada1 = new Date();
entrada1.setHours(fecha1.getHours());
entrada1.setMinutes(fecha1.getMinutes());

 const entrada2 = new Date();
entrada2.setHours(fecha2.getHours());
entrada2.setMinutes(fecha2.getMinutes());

const entrada3 = new Date();
 entrada3.setHours(fecha3.getHours());
 entrada3.setMinutes(fecha3.getMinutes());

 const entrada4 = new Date();
entrada4.setHours(fecha4.getHours());
entrada4.setMinutes(fecha4.getMinutes());


    const hora1 = hoy.getHours();
    console.log ('hora '+hora1);
       console.log('llegada entrada'+entrada);
       console.log('hora actual'+hora);
       console.log(entrada1);

        if(hora<=entrada){
                        open_alert('Muy bien, llegaste perfecto','verde')
            }else if (hora==entrada1 || hora<entrada2){
                    open_alert('Justo a tiempo','azul')
                }else if (hora>=entrada2 || hora<entrada3 ){
                    open_alert('Multa de 10','amarillo')
                    if(hora>=entrada3 || hora<=entrada4){
                        open_alert('Pasaste de tu hora de llegada, con retardo.Multa 20','naranja')
                        } if(hora>entrada4) {
                            open_alert('Aplica Penalizacion','rojo')
                                    }
                    }
                              

