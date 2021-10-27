const tablaEmpleados = () =>{
    const tabla = fetchAPI('','http://localhost/sistema_fmtor/sii/main/mostrarDatos','');
    tabla.then(json => {
     mostrarEmpleados(json);
    })
}

const buscarEmpleado = () => {
    const tabla = fetchAPI('','http://localhost/sistema_fmtor/sii/main/mostrarDatos','');
    tabla.then(json => {
        empleadoEncontrado(json);
    })
} 

const mostrarEmpleados = (json) =>{
    const t_body = document.getElementsByClassName("t_body");
    json.forEach(element => {
        const tr = document.createElement('tr')

        tr.classList.add('tr')

        tr.innerHTML += 
        '<td><p>'+element.nombre+'</p></td>'+
        '<td><p>'+element.apellidoP+'</p></td>'+
        '<td><p>'+element.apellidoM+'</p></td>'+
        '<td><p>'+element.fechaNacimiento+'</p></td>'+
        '<td><p>'+element.telefono+'</p></td>'+
        '<td><p>'+element.correo+'</p></td>'+
        '<td><p>'+element.curp+'</p></td>'+
        '<td><p>'+element.rfc+'</p></td>'+
        '<td><p>'+element.nss+'</p></td>'+
        '<td><p>'+element.estado+'</p></td>'+
        '<td><p>'+element.fechaIngreso+'</p></td>'
        t_body[0].appendChild(tr);
                            
    // const nombre = document.getElementById('nombre');
    // nombre.innerText = element.nombre;
    // const apellidoP = document.getElementById('apellidoP');
    // apellidoP.innerText = element.apellidoP;
    // const apellidoM = document.getElementById('apellidoM');
    // apellidoM.innerText = element.apellidoM;
    // const fechaNacimiento = document.getElementById('fechaNacimiento');
    // fechaNacimiento.innerText = element.fechaNacimiento;
    // const telefono = document.getElementById('telefono');
    // telefono.innerText = element.telefono;
    // const correo = document.getElementById('correo');
    // correo.innerText = element.correo;
    // const CURP = document.getElementById('CURP');
    // CURP.innerText = element.curp;
    // const RFC = document.getElementById('RFC');
    // RFC.innerText = element.rfc;
    // const NSS = document.getElementById('NSS');
    // NSS.innerText = element.nss;
    // const estado = document.getElementById('estado');
    // estado.innerText = element.estado;
    // const fechaIngreso = document.getElementById('fechaIngreso');
    // fechaIngreso.innerText = element.fechaIngreso;
    });
}

const selectEmpleado = document.getElementById('empleado');
const buscadorSII = document.getElementById('buscadorSII');
const peticion = (id) =>{
    const tabla = fetchAPI('','http://localhost/sistema_fmtor/sii/main/encontrarEmpleado?id_empleado='+id,'');
    tabla.then(json => {
        console.log(json);
        mostrarEmpleados(json);
    })
}

buscadorSII.addEventListener('keyup',(evt) => {
    console.log(buscadorSII.value);
});

// selectEmpleado.addEventListener('change',(evt) => {
//     peticion(selectEmpleado.value);
// });


(() =>{
    //buscarEmpleado();
    tablaEmpleados();
})()
