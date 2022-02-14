CREATE OR REPLACE VIEW v_empleado_horario AS SELECT
apellidoP AS `apellidoP`,
apellidoM AS `apellidoM`,
nombre AS 'nombre',
usuario AS usuario
FROM t_empleados, t_usuario WHERE t_empleados.id_empleados = t_usuario.id_empleado_1;