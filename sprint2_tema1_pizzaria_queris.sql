/*Lista cuántos productos de tipo “Bebidas” se han vendido en una determinada localidad.*/
select sum(detalles.cantidad) as suma_bebidas_madrid from detalles inner join pedido on detalles.id_pedido = pedido.id_pedido inner join tienda on pedido.id_tienda = tienda.id_tienda inner join producto on detalles.id_producto = producto.id_producto where producto.tipo_producto = "bebida" and tienda.localidad = "madrid";
/*Lista cuántos pedidos ha efectuado un determinado empleado/a.*/
select empleado.nombre, count(empleado.nombre) from empleado left join tienda on empleado.id_empleado = tienda.id_tienda left join pedido on tienda.id_tienda = pedido.id_tienda where empleado.nombre = "pablo"
