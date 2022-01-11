//En este script se valida el QR, al inicio se busca alguna camara y se lee el contenido
let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
scanner.addListener('scan', function (content) {
    //Cacha el contenido en y lo imprime en la consola ma
    if (content != null) {

        let horario = new Date();
        horario = horario.toLocaleString();
        var sonido = document.querySelector('#sonido_qr');

        horario = horario.replace("/", "-");
        while (horario.includes("/")) {
            horario = horario.replace("/", "-");
        }
        //el split separa el date en fecha y hora mediante un arreglo
        horario = horario.split(" ");
        horario[0] = horario[0].split("-");//fecha

        if (horario[0][1] < 10) {
            horario[0] = horario[0][2] + '-0' + horario[0][1] + '-' + horario[0][0];
        } else {
            horario[0] = horario[0][2] + '-' + horario[0][1] + '-' + horario[0][0];
        }

        if (horario[0][0] < 10) {
            horario[0] = horario[0][2] + '-' + horario[0][1] + '-0' + horario[0][0];
        } else {
            horario[0] = horario[0][2] + '-' + horario[0][1] + '-' + horario[0][0];
        }
        //año-mes-dia

        horario = horario[0] + " " + horario[1];
        //hora
        // console.log(horario);

        content = content.replace('https://www.fmtor.com/sii/main/datosEmpleados?aux=', '');
        content = atob(content);
        //console.log(content);

        const data = {
            id: content,
            entrada: horario,
            tipo: "Entrada"
        }

        const json = JSON.stringify(data);
        //console.log(json);

        const res = fetchAPI('', url + '/checador/registroController/consultarh?json=' + json, '')
        res.then(json => {
            json.forEach(element => {
                //sonidoQr
                sonido.setAttribute("autoplay", true);
                sonido.setAttribute("playsinline", true);
                sonido.play();
                sonido.play();
                /*Hora de entreda del usuario*/
                const horario_entrada = data.entrada.split(" ");
                console.log(horario_entrada[1].type);
                /*minutos de mas*/
                element.entrada[0] = element.entrada[0].split(":")//horario definido
                element.entrada[0] = element.entrada[0][1] + " " + element.entrada[0][2] + " " + element.entrada[0][3];
                console.log(element.entrada[0]);

                /* 
                    Hora de entrada definida del usuario
                    element.entrada 
                */
                console.log("entrada pre: " + element.entrada);
                console.log("entrada us: " + horario_entrada[1]);
                console.log(" " + element.entrada.split(':')[0]+':'+(parseInt(element.entrada.split(':')[1])+10)+':'+element.entrada.split(':')[2]);

                // if (horario_entrada[1] < element.entrada) {
                //     console.log("bono");
                //     open_alert('Bono', 'verde');
                // } else if (horario_entrada[1] == element.entrada || horario_entrada[1] < element.entrada) {
                //     open_alert('Justo a tiempo', 'azul')
                // } else if (horario_entrada[1] == element.entrada || horario_entrada[1] < element.entrada.split(':')[0]+(element.entrada.split(':')[1]+10)+element.entrada.split(':')[2]) {
                //     open_alert('Justo a tiempo', 'azul')
                //     console.log("entrada pre: " + element.entrada);
                // } else if (horario_entrada[1] >= element.entrada + entrada1 && horario_entrada[1] < element.entrada + entrada2) {
                //     open_alert('Multa de 10', 'amarillo')
                //     console.log("entrada pre: " + element.entrada);
                //     if (horario_entrada[1] >= element.entrada + entrada2 && horario_entrada[1] <= element.entrada + entrada3) {
                //         open_alert('Pasaste de tu hora de llegada, con retardo.Multa 20', 'naranja')
                //         console.log("entrada pre: " + element.entrada);
                //     } if (horario_entrada[1] > element.entrada) {
                //         open_alert('Aplica Penalizacion', 'rojo')
                //         console.log("entrada pre: " + element.entrada);
                //     }
                // } else {
                //     open_alert('Hubo un problema con tu hora de entrada', 'rojo')
                // }

                if (horario_entrada[1].split(':')[0] == element.entrada.split(':')[0] && horario_entrada[1].split(':')[1] == element.entrada.split(':')[1]) {
                    open_alert('Llegaste justo a tiempo','verde');
                } else if (horario_entrada[1].split(':')[0] == element.entrada.split(':')[0] && horario_entrada[1].split(':')[1] != element.entrada.split(':')[1]) {
                    const minutos_bd = parseInt(element.entrada.split(':')[1])
                    const minutos_sys = parseInt(horario_entrada[1].split(':')[1])

                    if ((minutos_bd-minutos_sys) < 0) {
                        open_alert('Te pasaste por: '+((minutos_bd-minutos_sys)*(-1))+' minutos','naranja')
                    }
                } else if (horario_entrada[1].split(':')[0] < element.entrada.split(':')[0] && horario_entrada[1].split(':')[1] != element.entrada.split(':')[1]) {
                    const minutos_bd = 60;
                    const minutos_sys = parseInt(horario_entrada[1].split(':')[1])

                    if ((minutos_bd-minutos_sys) >= 10) {
                        open_alert('Llegaste temprano, enhorabuena','verde')
                    } else {
                        open_alert('Llegaste temprano, enhorabuena','azul')
                    }
                } else {
                    open_alert('Llegaste demasiado tarde','rojo');
                }
            });

        })

        const respuesta = fetchAPI('', url + '/checador/registroController/insertarh?json=' + json, '')
        respuesta.then(json => {
            if (json == 1) {
                console.log("mensaje");
                // open_alert('Llegaste a tiempo','verde')

            }
        })
    }
});
//manda a buscar alguna camara 
Instascan.Camera.getCameras().then(function (cameras) {
    if (cameras.length > 0) {
        //si encuentra alguna camara inicializala    
        scanner.start(cameras[0]);
    } else {
        //si no encuentra nada en la camara manda un mensaje en consola
        console.error('No encuentra ninguna camara en tu dispositivo');
    }
}).catch(function (e) {
    console.error(e);
});