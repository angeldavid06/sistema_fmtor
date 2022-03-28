CREATE OR REPLACE TABLE t_clientes (
  Id_Clientes int (11),
  Razon_social varchar(50),
  Nombre varchar(50),
  Telefono varchar(50),
  Correo varchar(50),
  Direccion varchar(50),
  CONSTRAINT PK_Id_Clientes PRIMARY KEY (Id_Clientes)
);

CREATE OR REPLACE TABLE t_proveedores (
  Id_Proveedor INT AUTO_INCREMENT,
  Proveedor VARCHAR(150),
  Direccion VARCHAR(80),
  Ciudad VARCHAR(20),
  Telefono VARCHAR(15),
  Correo VARCHAR(110),
  CONSTRAINT PK_Proveedor PRIMARY KEY (Id_Proveedor)
);

CREATE OR REPLACE TABLE t_informacion_empresa (
  Id_Empresa INT AUTO_INCREMENT,
  Empresa VARCHAR(150),
  Direccion VARCHAR(80),
  Ciudad VARCHAR(20),
  Codigo_Postal VARCHAR(10),
  Telefono VARCHAR(15),
  Correo VARCHAR(110),
  CONSTRAINT PK_Empresa PRIMARY KEY (Id_Empresa)
);

CREATE OR REPLACE TABLE t_orden_compra (
  Id_Compra INT AUTO_INCREMENT,
  Fecha DATE,
  Solicitado VARCHAR(50),
  Terminos VARCHAR(350),
  Contacto VARCHAR(350),
  FK_Proveedor INT,
  FK_Empresa INT,
  CONSTRAINT PK_Compra PRIMARY KEY (Id_Compra),
  CONSTRAINT FK_Proveedor FOREIGN KEY (FK_Proveedor) REFERENCES t_proveedores(Id_Proveedor),
  CONSTRAINT FK_Empresa FOREIGN KEY (FK_Empresa) REFERENCES t_informacion_empresa(Id_Empresa)
);

CREATE OR REPLACE TABLE t_pedido_compra (
  Id_Pedido_Compra INT AUTO_INCREMENT,
  Codigo VARCHAR(50),
  Producto VARCHAR(350),
  /*----------------agregados----------------*/
  Factor FLOAT,
  Medida VARCHAR(50),
  /*--------------------------------*/
  Cantidad BIGINT,
  Precio FLOAT,
  FK_Orden_Compra INT,
  CONSTRAINT PK_Compra PRIMARY KEY (Id_Pedido_Compra),
  CONSTRAINT FK_Orden_Compra FOREIGN KEY (FK_Orden_Compra) REFERENCES t_orden_compra(Id_Compra)
);

CREATE OR REPLACE TABLE t_estados (
  id_estados INT AUTO_INCREMENT,
  estados VARCHAR (25),
  CONSTRAINT PK_Id_estados PRIMARY KEY (id_estados)
);
  
CREATE OR REPLACE TABLE t_cotizacion (
  Id_Cotizacion INT AUTO_INCREMENT,
  Fecha date,
  Id_Clientes_FK int(11),
  CONSTRAINT PK_Cotizacion PRIMARY KEY (Id_Cotizacion),
  CONSTRAINT FK_Id_Clientes_1 FOREIGN KEY (Id_Clientes_FK) REFERENCES t_clientes(Id_Clientes) ON DELETE CASCADE
);

create OR REPLACE table t_salida_almacen (
  Id_Folio int auto_increment,
  Fecha date,
  Factura int(25),
  Empaque double,
  -- Id_Clientes_FK int(11),
  Id_Cotizacion_FK int(11),
  CONSTRAINT Pk_salida_almacen PRIMARY KEY (Id_Folio),
  CONSTRAINT FK_Id_Cotizacion_3 FOREIGN KEY (Id_Cotizacion_FK) REFERENCES t_cotizacion(Id_Cotizacion) ON DELETE CASCADE
  -- CONSTRAINT FK_Id_Clientes_3 FOREIGN KEY (Id_Clientes_FK) REFERENCES t_clientes(Id_Clientes) ON DELETE CASCADE
);

CREATE OR REPLACE TABLE t_pedido (
  Id_Pedido BIGINT AUTO_INCREMENT,
  Descripcion VARCHAR(50),
  Medida VARCHAR(50),
  Acabado VARCHAR(50),
  Factor FLOAT,
  Material VARCHAR(100),
  Cantidad_millares int(11),
  Pedido_pza VARCHAR(100) DEFAULT '-',
  Fecha_entrega date,
  Precio_millar double,
  Codigo varchar(50),
  -- Id_Salida_FK INT,
  Id_Cotizacion_FK INT,
  CONSTRAINT PK_Pedido PRIMARY KEY (Id_Pedido),
  -- CONSTRAINT FK_Id_Salida_FK_2 FOREIGN KEY (Id_Salida_FK) REFERENCES t_salida_almacen(Id_Folio) ON DELETE CASCADE
  CONSTRAINT FK_Id_Cotizacion_1 FOREIGN KEY (Id_Cotizacion_FK) REFERENCES t_cotizacion(Id_Cotizacion) ON DELETE CASCADE
);

CREATE OR REPLACE TABLE t_orden_produccion (
  Id_Produccion BIGINT AUTO_INCREMENT,
  Id_Catalogo_FK VARCHAR(50),
  Calibre FLOAT DEFAULT 0.0,
  Cantidad BIGINT,
  Tratamiento VARCHAR(100) DEFAULT '0',
  Estado_general varchar(25) DEFAULT 'PENDIENTE',
  Id_Pedido_FK BIGINT,
  CONSTRAINT PK_Id_Produccion PRIMARY KEY (Id_Produccion),
  CONSTRAINT FK_Id_Pedido_FK_1 FOREIGN KEY (Id_Pedido_FK) REFERENCES t_pedido(Id_Pedido) ON DELETE CASCADE
);


CREATE OR REPLACE TABLE t_control_produccion (
  id_control_produccion BIGINT AUTO_INCREMENT,
  factor float,
  Id_estado_1 INT,
  Id_Produccion_FK_1 BIGINT, 
  CONSTRAINT PK_Id_control_produccion PRIMARY KEY (id_control_produccion), 
  CONSTRAINT FK_Id_Produccion_FK FOREIGN KEY (Id_Produccion_FK_1) REFERENCES t_orden_produccion(Id_Produccion) ON DELETE CASCADE,
  CONSTRAINT FK_Id_estado_2 FOREIGN KEY (Id_estado_1) REFERENCES t_estados(id_estados) ON DELETE CASCADE
);

CREATE OR REPLACE TABLE t_registro_diario (
  id_registro_diario BIGINT AUTO_INCREMENT,
  bote int,
  no_maquina int,
  fecha date,
  pzas int,
  kilos float,
  turno int,
  observaciones VARCHAR(25),
  Id_control_produccion_1 BIGINT,
  CONSTRAINT PK_Id_registro_diario PRIMARY KEY (id_registro_diario), 
  CONSTRAINT FK_Id_control_produccion_1 FOREIGN KEY (Id_control_produccion_1) REFERENCES t_control_produccion(Id_control_produccion) ON DELETE CASCADE
);

CREATE OR REPLACE TABLE t_programa_forjado (
  Id_Programa_Forjado BIGINT auto_increment,
  Id_Produccion_FK BIGINT,
  Fecha_entrega VARCHAR(15),
  Herramental VARCHAR(250),
  no_maquina INT,
  producto_desc VARCHAR(100) DEFAULT '',
  CONSTRAINT Pk_programa_forjado PRIMARY KEY (Id_Programa_Forjado),
  CONSTRAINT FK_Id_Produccion_FK_1 FOREIGN KEY (Id_Produccion_FK) REFERENCES t_orden_produccion(Id_Produccion) ON DELETE CASCADE
);


CREATE TABLE OR REPLACE t_inventario_productos_finalizados(
	Id_productos_finalizados INT NOT NULL,
  Kardex_pf INT NOT NULL,
	Anaquel_fila_pf VARCHAR(50) NOT NULL,
	Inventario_inicial_pf FLOAT,
	Inventario_final_pf FLOAT,
	Explosion_pf FLOAT,
	Kilos_pf FLOAT,
	Id_pedido_FK BIGINT,
	Id_Folio_FK INT,
	CONSTRAINT PK_Inventario PRIMARY KEY (Id_productos_finalizados),
	CONSTRAINT FK_Id_Pedido FOREIGN KEY (Id_pedido_FK) REFERENCES t_pedido(Id_Pedido) ON DELETE CASCADE,
	CONSTRAINT FK_Id_Salida_FK_3 FOREIGN KEY (Id_Folio_FK) REFERENCES t_salida_almacen(Id_Folio) ON DELETE CASCADE
);

CREATE TABLE OR REPLACE t_inventario_productos_comprados(
	Id_productos_comprados INT NOT NULL,
	Kardex_pc INT NOT NULL,
	Id_Proveedor_FK INT,
	Medida_pc VARCHAR(50),
	Descripcion VARCHAR(50),
	Num_parte VARCHAR(50),
	Precio_pc FLOAT,
	Costo_total_pc FLOAT,
	Anaquel_fila_pc VARCHAR(50) NOT NULL,
	Inventario_inicial_pc FLOAT,
	Inventario_final_pc FLOAT,
	Explosion_pc FLOAT,
	Factor_pc FLOAT,
	Kilos_pc FLOAT,
	CONSTRAINT PK_Inventario_Productos_Comprados PRIMARY KEY (Id_productos_comprados),
	CONSTRAINT FK_Proveedores FOREIGN KEY (Id_Proveedor_FK) REFERENCES t_proveedores(Id_Proveedor) ON DELETE CASCADE
);

CREATE TABLE OR REPLACE t_materia_prima(
  Id_materia_prima INT NOT NULL,
	Medida_mp VARCHAR(50) NOT NULL,
	Num_rollo INT NOT NULL,
	Fecha DATE NOT NULL,
	Referencia VARCHAR(50) NOT NULL,
	Entrada INT,
	Salida INT,
	Saldo INT NOT NULL,
	Saldo_rollo VARCHAR(2) DEFAULT '1R',
	CONSTRAINT PK_Materia_Prima PRIMARY KEY(Id_materia_prima)
);