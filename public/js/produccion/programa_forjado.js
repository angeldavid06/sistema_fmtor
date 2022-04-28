const limpiar_tablas = () => {
    const cuerpos = [1,2,3,4,5,6,7,8,9]
    for (let i = 0; i < cuerpos.length; i++) {
        const body = document.getElementById('body_maquina_'+cuerpos[i])
        while (body.firstChild) {
            body.removeChild(body.firstChild)
        }
    }
}

const agrupar_por_maquina = (json) => {
    let kilos = 0 
    let acumulado = 0
    const maquinas = [1,2,3,4,5,6,7,8,9]
    for (let i = 0; i < maquinas.length; i++) {
        if (json.length == 0) {
             const body = document.getElementById("body_maquina_" + maquinas[i]);
             body.innerHTML = '<tr><td class="txt-center" style="background: var(--background-aux);" colspan="17">No hay ningún registro</td></tr>';
        } else {
            json.forEach(el => {
                if (maquinas[i] == el.no_maquina) {
                    render_programa(el,maquinas[i]);
                    kilos += (el.factor*el.cantidad_elaborar);
                    acumulado += parseFloat(el.TOTAL);
                }
    
                if ((i+1) == maquinas.length) {
                    const total_kilos = document.getElementById('total_kilos')
                    const total_acumulado = document.getElementById('total_semana')
                    total_kilos.innerHTML = new Intl.NumberFormat('es-MX').format(kilos)
                    total_acumulado.innerHTML = '$ '+new Intl.NumberFormat('es-MX').format(acumulado)
                }
            });
        }
    }
}

const obtener_programa = () => {
    const respuesta = fetchAPI('',url+'/produccion/op/obtener_programa','')
    respuesta.then(json => {
        agrupar_por_maquina(json)
    })
}

document.addEventListener('DOMContentLoaded', () => {
    obtener_programa()
});

document.addEventListener('click', (evt) => {
    if (evt.target.dataset.impresion) {
        printPage(url+'/produccion/op/pdf_programa_forjado')
    }
})