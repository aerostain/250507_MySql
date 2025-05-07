# Creación Storage Productividad

## Notas
* Fechas y hora siempre deben guardarse en formato UTC y luego convertirlas en web cliente.
* Usar Gerente, Jefe, Subjefe
* 

## Syntaxis útil
```{sql}
# Borrar Registros
delete from negocios where id=5;

# Actualizar Registros
update negocios set id=7 where id=8;

update personal_rrhh set jefe=1 where puesto like 'Jef%' or puesto like 'An%';

update personal_rrhh set subjefe=3 where puesto like 'An%' and cargo like '%Ala%';
```
