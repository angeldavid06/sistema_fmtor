DELIMITER |
CREATE OR REPLACE TRIGGER nueva_orden AFTER INSERT ON t_orden_produccion
FOR EACH ROW
BEGIN
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,1,NEW.Id_Produccion);
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,2,NEW.Id_Produccion);
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,3,NEW.Id_Produccion);
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,4,NEW.Id_Produccion);
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,5,NEW.Id_Produccion);
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,6,NEW.Id_Produccion);
END |
DELIMITER ;

-- Nuevo

DELIMITER |
CREATE OR REPLACE TRIGGER actualizar_estado_general AFTER INSERT ON t_registro_diario
FOR EACH ROW
BEGIN
    DECLARE op INT;
	DECLARE p INT;
	DECLARE estado VARCHAR(25);
	DECLARE primer_registro INT;

	SET op  = (
				SELECT cantidad
				FROM t_orden_produccion, t_control_produccion
				WHERE t_control_produccion.Id_Produccion_FK_1 = t_orden_produccion.Id_Produccion
				AND t_control_produccion.id_control_produccion = NEW.Id_control_produccion_1
				);
	
	SET p  = (
				SELECT SUM(pzas) 
				FROM t_registro_diario, t_control_produccion 
				WHERE t_control_produccion.id_control_produccion = t_registro_diario.id_control_produccion_1
				AND t_control_produccion.id_control_produccion = NEW.Id_control_produccion_1
			);

	SET estado = (
					SELECT estados 
					FROM t_estados, t_control_produccion 
					WHERE t_estados.id_estados = t_control_produccion.Id_estado_1
					AND t_control_produccion.id_control_produccion = NEW.Id_control_produccion_1
				);

	SET primer_registro = (
							SELECT count(id_registro_diario) 
							FROM t_registro_diario, t_control_produccion 
							WHERE t_registro_diario.Id_control_produccion_1 = t_control_produccion.id_control_produccion
							AND t_control_produccion.Id_estado_1 = 1
						);


	IF (p >= op) THEN
		UPDATE t_orden_produccion, t_control_produccion
		SET estado_general = estado 
		WHERE id_control_produccion = NEW.Id_control_produccion_1
		AND t_orden_produccion.Id_Produccion = t_control_produccion.Id_Produccion_FK_1;
	ELSEIF (primer_registro = 1) THEN
		UPDATE t_orden_produccion, t_control_produccion
		SET estado_general = 'FORJADO'
		WHERE id_control_produccion =  NEW.Id_control_produccion_1
		AND t_orden_produccion.Id_Produccion = t_control_produccion.Id_Produccion_FK_1;
	END IF;
END |
DELIMITER ;
s


{ "orden" :[{"Id_Compra":"29","Fecha":"2022-03-09","Solicitado":"ING. GERARDO FLORES","Terminos":"-","Contacto":"-","Proveedor":"OMAR CALZADA ","Empresa":"RDG TORNILLOS","FK_Empresa":"2","FK_Proveedor":"8"}],
"pedidos" :[{"Id_Pedido_Compra":"29","Codigo":"13400","Producto":"TORNILLO DE PRUEBA 07","Factor":"0","Medida":"","Cantidad":"20000","Precio":"10.5","FK_Orden_Compra":"29"},{"Id_Pedido_Compra":"30","Codigo":"13400","Producto":"TORNILLO 1","Factor":"0","Medida":"","Cantidad":"20000","Precio":"10.5","FK_Orden_Compra":"29"}] }