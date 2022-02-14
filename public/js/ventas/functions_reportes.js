const render_reporte = (json) => {
    const body = document.getElementsByClassName('body_reporte');
    body[0].innerHTML = ''
    json.forEach(element => {
        // console.log(element);
        body[0].innerHTML += '<tr>' +
            '<td>' + element.Id_reporte + '</td>' +
            '<td>' + element.Mes_de_creacion + '</td>' +
           

            '<td><button class= "material-icons btn btn-icon-self"  data-modal="modal-actualizar" data-edit="' + element.Id_reporte + '"> mode_edit</button>' +
            '<td><button class= "material-icons btn btn-icon-self"  data-modal="modal-plano" data-plano="' + element.Id_reporte + '"> insert_drive_file</button>' +
            '<td><button class= "material-icons btn btn-icon-self" onclick="eliminarRegistro(' + element.Id_reporte + ')">delete</button>'
            + '</tr>';
    });
}

const mostrarModal = (id) => {
    const respues = fetchAPI('', url+'/ventas/reportes/obtener_per?aux=' + id + '', '');
    respues.then(json => {
        pintarModal(json);
    });
}
const Id_reporte = document.getElementById('Id_reporte_edit');
const Mes_de_creacion = document.getElementById('Mes_de_creacion_edit');
const ReportePDF = document.getElementById('ReportePDF_edit');



const pintarModal = (json) => {
    console.log(json);
    json.forEach(element => {
        Id_reporte.value = element.Id_reporte;
        Mes_de_creacion.value = element.Mes_de_creacion;
       
    })
}

const Id_reporte_r = document.getElementById('Id_reporte');
const Mes_de_creacion_r = document.getElementById('Mes_de_creacion');


const nuevoreporte = () => {

    Id_reporte_r.value = '';
    Mes_de_creacion_r.value = '';
   
}
//posible copia de busqueda 
document.addEventListener('click', evt => {
    if (evt.target.dataset.edit) {
        console.log(evt.target.dataset.edit);
        mostrarModal(evt.target.dataset.edit);
    }
    if (evt.target.dataset.plano){
        obtener_plano(evt.target.dataset.plano);
    }

})
//buscar
const btn_buscar=document.getElementById('clave')
btn_buscar.addEventListener('click',()=>{
    const input=document.getElementById('id_reporte')
    if(input.value==''){
        obtener();
    }
    else{
        obtener_clave_reporte(input.value)
    }
    
})

const obtener_clave_reporte = (clave) => {
    const respuesta = fetchAPI('',url+'/ventas/reportes/buscar?clave='+clave,'');
    respuesta.then(json => {
        render_reporte(json)
    })
}


const obtener = (vista) => {
    const respuesta = fetchAPI('',url+'/ventas/reportes/obtener', '')
    respuesta.then(json => {
        render_reporte(json);

    })

};

const obtener_plano = (Id_reporte) => {
    const plano = fetchBlob(url + '/ventas/reportes/obtener_plano?id_plano=' + Id_reporte)
    plano.then(blob => {
        const div_plano = document.getElementById('plano')
        const embed = document.createElement('embed')

        div_plano.innerHTML = '';

        embed.classList.add('height-100');
        embed.setAttribute('type', 'application/pdf')
        embed.setAttribute('src', 'data:application/pdf;base64,' + encodeURI(blob))

        div_plano.appendChild(embed)
    })
}


const eliminarRegistro = (id) => {
    const respuesta = fetchAPI('', url+'/ventas/reportes/eliminarreporte?dato=' + id, '')
    respuesta.then(json => {
        obtener();
    })

};

const form = document.getElementById('form_reg_reporte');

form.addEventListener('submit', (evt) => {
    evt.preventDefault();
    insertarreporte();
    nuevoRegistro();
})

const insertarreporte = () => {
    const respuesta = fetchAPI(form, url+'/ventas/reportes/Nuevoreporte', 'POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('El registro ha sido agregado correctamente', 'verde')
            obtener();
        } else {
            open_alert('Error al agregar el registro', 'rojo')
        }
        obtener()
        console.log(json);
    })
}

//actualizar 

const formactualizar = document.getElementById('form_act_reporte');

formactualizar.addEventListener('submit', (evt) => {
    evt.preventDefault();
    actualizar_reporte();
})

const actualizar_reporte = () => {
    const respuesta = fetchAPI(formactualizar,url+'/ventas/reportes/actualizarreporte', 'POST')
    respuesta.then(json => {
        if (json == 1) {
            open_alert('El registro ha sido actualizado correctamente', 'verde')
            obtener();
        } else {
            open_alert('Error al actualizar el registro', 'rojo')
        }
    })
}

(function () {
    obtener();
})()