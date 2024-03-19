/*Llista el total de compres d’un client/a.*/
select clientes.*, ventas.id_venta  from clientes inner join ventas on clientes.id_cliente = ventas.id_cliente where clientes.id_cliente = 2;
/*Llista les diferents ulleres que ha venut un empleat durant un any.*/
select gafas.marca, empleados.nombre, year(ventas.fecha_venta) as ano from ventas inner join gafas on ventas.id_gafa = gafas.id_gafa inner join empleados on ventas.id_empleado = empleados.id_empleado where empleados.id_empleado = 1 and year(ventas.fecha_venta) = 2023;
/*Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.*/
select distinct proveedores.nombre from proveedores left join gafas on proveedores.id_proveedor = gafas.id_proveedor left join ventas on gafas.id_gafa = ventas.id_gafa;