/*------------------------------------------ Vista Salida de Almacen ---------------------------------------------------*/
CREATE
OR REPLACE VIEW v_salidas_almacen AS
SELECT
    t_salida_almacen.Id_Folio AS id_folio,
    t_clientes.Id_Clientes AS Id_Clientes,
    t_clientes.Razon_social AS razon_social,
    t_salida_almacen.Fecha AS fecha
FROM
    t_cotizacion,
    t_salida_almacen,
    t_clientes
WHERE
    t_cotizacion.Id_Cotizacion = t_salida_almacen.Id_Cotizacion_FK
    AND t_cotizacion.Id_Clientes_FK = t_clientes.Id_Clientes
ORDER BY
    t_salida_almacen.Id_Folio DESC;

/*------------------------------------------ Vista Historial ---------------------------------------------------*/

CREATE 
OR REPLACE VIEW v_historial_salidas_almacen AS
SELECT 
    t_salida_almacen.Id_Folio AS id_folio,
    t_clientes.Id_Clientes AS Id_Clientes,
    t_clientes.Razon_social AS razon_social,
    t_salida_almacen.Fecha AS fecha,
    t_pedido.Cantidad_millares AS cantidad,
    t_pedido.Codigo AS no_parte,
    t_pedido.Pedido_pza AS pedido_cliente,
    t_pedido.Precio_millar AS costo,
    t_salida_almacen.Factura AS factura,
    t_salida_almacen.Empaque AS empaque,
    t_pedido.Fecha_entrega AS fecha_entrega,
    t_pedido.Medida AS medida,
    t_pedido.Descripcion AS descripcion,
    t_pedido.Acabado AS acabados,
    t_pedido.Material AS material,
    t_pedido.Id_Pedido,
    t_pedido.Factor
FROM
    t_salida_almacen,
    t_clientes,
    t_pedido,
    t_cotizacion
WHERE
    t_cotizacion.Id_Cotizacion = t_salida_almacen.Id_Cotizacion_FK
    AND t_cotizacion.Id_Clientes_FK = t_clientes.Id_Clientes
    AND t_cotizacion.Id_Cotizacion = t_pedido.Id_Cotizacion_FK
ORDER BY
    t_salida_almacen.Id_Folio DESC;

CREATE
OR REPLACE VIEW v_informacion_pedido AS
SELECT
    t_pedido.Cantidad_millares AS cantidad,
    t_pedido.Codigo AS no_parte,
    t_pedido.Pedido_pza AS pedido_cliente,
    t_pedido.Precio_millar AS costo,
    t_pedido.Fecha_entrega AS fecha_entrega,
    t_pedido.Medida AS medida,
    t_pedido.Descripcion AS descripcion,
    t_pedido.Acabado AS acabados,
    t_pedido.Material AS material,
    t_pedido.Id_Pedido,
    t_pedido.Factor,
    t_orden_produccion.Id_Produccion,
    t_orden_produccion.Id_Catalogo_FK,
    t_orden_produccion.cantidad AS cantidad_elaborar
FROM
    t_pedido,
    t_orden_produccion
WHERE
    t_pedido.Id_Pedido = t_orden_produccion.Id_Pedido_FK
ORDER BY
    t_pedido.Id_Pedido DESC;

/*        COTIZACIONES       */

CREATE 
OR REPLACE VIEW v_cotizacion AS
SELECT 
    t_salida_almacen.Id_Folio AS id_folio,
    t_clientes.Id_Clientes AS Id_Clientes,
    t_clientes.Razon_social AS razon_social,
    t_clientes.Nombre AS nombre,
    t_clientes.Telefono AS telefono,
    t_clientes.Correo AS correo,
    t_salida_almacen.Fecha AS fecha,
    t_pedido.Cantidad_millares AS cantidad,
    t_pedido.Codigo AS no_parte,
    t_pedido.Pedido_pza AS pedido_cliente,
    t_pedido.Precio_millar AS costo,
    t_pedido.Fecha_entrega AS fecha_entrega,
    t_pedido.Medida AS medida,
    t_pedido.Descripcion AS descripcion,
    t_pedido.Id_Pedido
FROM
    t_salida_almacen,
    t_clientes,
    t_pedido,
    t_cotizacion
WHERE
    t_cotizacion.Id_Cotizacion = t_salida_almacen.Id_Cotizacion_FK
    AND t_cotizacion.Id_Clientes_FK = t_clientes.Id_Clientes
    AND t_cotizacion.Id_Cotizacion = t_pedido.Id_Cotizacion_FK
ORDER BY
    t_salida_almacen.Id_Folio DESC;

CREATE
OR REPLACE VIEW v_cotizaciones AS
SELECT
    t_cotizacion.Id_Cotizacion AS id_cotizacion,
    t_clientes.Id_Clientes AS id_clientes,
    t_clientes.Razon_social AS razon_social t_cotizacion.Fecha AS fecha
FROM
    t_clientes,
    t_cotizacion
WHERE
    t_cotizacion.Id_Clientes_FK = t_clientes.Id_Clientes
ORDER BY
    t_salida_almacen.Id_Folio DESC;

/*------------------------------------------ Vista Orden de Compra ---------------------------------------------------*/

CREATE
OR REPLACE VIEW v_orden_compra AS 
SELECT
    t_orden_compra.Id_Compra,
    t_orden_compra.Fecha,
    t_orden_compra.Solicitado,
    t_orden_compra.Terminos,
    t_orden_compra.Contacto,
    t_proveedores.Proveedor,
    t_informacion_empresa.Empresa,
    t_orden_compra.FK_Empresa,
    t_orden_compra.FK_Proveedor
FROM 
    t_orden_compra,
    t_proveedores,
    t_informacion_empresa
WHERE 
    t_orden_compra.FK_Proveedor = t_proveedores.Id_Proveedor 
    AND t_orden_compra.FK_Empresa = t_informacion_empresa.Id_Empresa
ORDER BY Id_Compra DESC;

/*------------------------------------------ Vista Empresas ---------------------------------------------------*/

CREATE
OR REPLACE VIEW v_empresa AS 
SELECT
    Id_Empresa,
    Empresa
FROM 
    t_informacion_empresa;

/*------------------------------------------ Vista Proveedor ---------------------------------------------------*/

CREATE
OR REPLACE VIEW v_proveedor AS 
SELECT
    Id_Proveedor,
    Proveedor
FROM 
    t_proveedores;

/*------------------------------------------ Vista Clientes ---------------------------------------------------*/
CREATE
OR REPLACE VIEW v_clientes AS
SELECT
    Id_Clientes,
    Razon_social
FROM
    t_clientes
ORDER BY
    Id_Clientes ASC;
