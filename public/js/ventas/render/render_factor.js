/* A table of values. */
const tabla_factor = [
    ['DIAMETRO','AMERICANO','2.32','3-48','4-40','5-40','6-32','8-18','10-32','12-28','1/4-28','5/16','´3/8-16','´7/16','´1/2',''],
    ['DIAMETRO','MILIMETRICO','','M2.5','','M3','3.5','M4','´3/16','M5','M6','M8','','','',''],
    ['LONGITUD','','','','','´1/8','','5-32','','´7/32','14','','','','',''],
    ['PULGADA','M.M.','','','','´5-20','','´1-20','','','','','','','',''],
    ['3/16','4.76','','','0.30','0.40','0.53','0.81','','','2.44','','','','5.25','3/16'],
    ['1/4','6.35','0.22','0.31','0.41','0.55','0.71','1.08','1.56','1.98','3.27','','','','7.00','1/4'],
    ['5/16','7.94','0.26','0.36','0.47','0.62','0.79','1.20','1.72','2.47','3.56','','','','8.75','5/16'],
    ['3/8 11/32','9.53','0.28','0.40','0.52','0.69','0.88','1.33','1.89','2.69','3.85','','','','10.51','3/8 11/32'],
    ['7/16','11.11','0.32','0.45','0.58','0.77','0.92','1.46','2.06','2.91','4.15','','','','12.25','7/16'],
    ['1/2','12.70','0.36','0.49','0.63','0.84','1.04','1.58','2.22','3.14','4.44','','','','14.00','1/2'],
    ['9/16','14.29','0.39','0.54','0.69','0.92','1.13','1.71','2.38','3.35','4.74','','','','15.75','9/16'],
    ['5/8','15.08','0.43','0.58','0.74','0.99','1.21','1.84','2.55','3.58','5.03','','','','16.62','5/8'],
    ['3/4','19.05','0.50','0.68','0.85','1.13','1.38','2.10','2.88','4.02','5.62','16.50','','','21.00','3/4'],
    ['7/8 13/16','22.23','0.56','0.76','0.96','1.27','1.55','2.35','3.21','4.46','6.21','','','','24.51','7/8 13/16'],
    ['1','25.40','','0.90','1.06','1.41','1.72','2.61','3.54','4.90','6.81','19.20','','','28.00','1'],
    ['1 1/8','28.58','','1.02','1.17','1.56','1.88','2.86','3.87','5.34','7.40','','','','31.51','1 1/8'],
    ['1 1/4','31.75','','1.13','1.28','1.70','2.06','3.12','4.19','4.78','7.99','','','','35.00','1 1/4'],
    ['1 3/8','35.00','','1.25','1.65','1.83','2.20','3.33','4.46','6.12','8.42','','','','38.58','1 3/8'],
    ['1 1/2','38.10','','1.36','1.50','1.99','2.39','3.63','4.85','6.66','9.17','25.50','','','42.00','1 1/2'],
    ['1 3/4 - 1 5/8','44.45','','1.58','1.75','2.28','2.73','4.20','5.51','7.55','10.35','','','','49.00','1  3/4 - 1 5/8'],
    ['2','50.80','','1.82','','2.55','3.07','4.65','6.17','8.43','11.53','28.70','','','56.00','2'],
    ['2 1/4','57.15','','','','2.80','3.45','5.10','6.74','9.17','15.93','31.70','','','','2 1/4'],
    ['2 1/2','63.50','','','','3.12','3.83','5.67','7.49','10.19','17.70','','','','82.00','2 1/2'],
    ['2 3/4','69.85','','','','3.43','4.21','6.24','8.24','11.21','19.47','','','','','2 3/4'],
    ['3','76.20','','','','','','','8.99','','','45.40','','','','3'],
];

/**
 * It renders a table with the data from the array tabla_factor.
 */
const render_factor = () => {
    const tabla = document.getElementById("factores");
    const start_tr = '<tr class="tr">'
    const end_tr = '</tr>'
    for (let j = 0; j < 4; j++) {
        let data = ''
        for (let i = 0; i < tabla_factor[j].length; i++) {
            data += "<th class='th' style='min-width:60px; padding: 5px; background-color: var(--background-aux);'>" + tabla_factor[j][i] + "</th>";
        }
        tabla.innerHTML += start_tr + data + end_tr;
    }
    for (let j = 4; j < tabla_factor.length; j++) {
        let data = ''
        for (let i = 0; i < tabla_factor[j].length; i++) {
            data += "<th class='th' data-factor='" + tabla_factor[j][i] + "' style='min-width:50px; padding: 5px; border: 1px solid var(--border-color);'>" + tabla_factor[j][i] + "</th>";
        }
        tabla.innerHTML += start_tr + data + end_tr;
    }
}