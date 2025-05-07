# Exploración
show databases;
create database st_070525;
use st_070525;

# Crear Tablas
# ------------- Notas:
# Cambiar Jefe y Subjefe por Gerente, Jefe, Subjefe_nivel1, Subjefe _nivel2 
show tables;

create table negocios(
id int primary key auto_increment,
n_negocio varchar(250),
fec_crea timestamp default CURRENT_TIMESTAMP()
);

create table personal_rrhh(
id int primary key auto_increment,
nombre  varchar(250) not null,
apellido_p  varchar(250) not null,
apellido_m  varchar(250) not null,
puesto  varchar(250) not null,
cargo  varchar(250) not null,
negocio_encontrato int not null,
negocio_entrabajo int not null,
jefe  varchar(250),
subjefe  varchar(250),
fec_crea timestamp default CURRENT_TIMESTAMP()
);

desc negocios;
desc personal_rrhh;
drop table negocios;
drop table personal_rrhh;

# Ingresar Registros
select*from negocios;
select*from personal_rrhh;

#insert into negocios values(null,'',default);
#insert into personal_rrhh values(null,'','','','','',,,,,default);
insert into negocios values(null,'Lvge',default);
insert into negocios values(null,'Proseguridad',default);
insert into negocios values(null,'Alarmas',default);
insert into negocios values(null,'Lvge_Proseguridad_Alarmas',default);
insert into negocios values(null,'Proseguridad_Alarmas',default);
insert into negocios values(null,'Lvge_Alarmas',default);
insert into negocios values(null,'Lvge_Proseguridad',default);


insert into personal_rrhh values(null,'Viviana','Limas','Paredes','Gerente RRHH','Gerente RRHH',1,1,null,null,default);
insert into personal_rrhh values(null,'Alina','Limas','Paredes','Jefe de RRHH','Jefa Lvge',1,1,null,null,default);
insert into personal_rrhh values(null,'Elvira','Limas','Paredes','Jefe de RRHH','Jefa Proseguridad y Alarmas',1,5,null,null,default);
insert into personal_rrhh values(null,'Susana','Limas','Paredes','Analista de RRHH','Psicologa Lvge',1,1,null,null,default);
insert into personal_rrhh values(null,'Karen','Limas','Paredes','Analista de RRHH','Psicologa Proseguridad',2,2,null,null,default);
insert into personal_rrhh values(null,'Emily','Limas','Paredes','Analista de RRHH','Psicologa Alarmas',3,3,null,null,default);
insert into personal_rrhh values(null,'Yoselyn','Limas','Paredes','Asistente de RRHH','Asistente',2,1,1,2,default);
insert into personal_rrhh values(null,'Laura','Limas','Paredes','Asistente de RRHH','Asistente',2,2,1,3,default);
insert into personal_rrhh values(null,'Julia','Limas','Paredes','Asistente de RRHH','Asistente',2,3,1,3,default);


# Borrar Registros
delete from negocios where id=5;

# Actualizar Registros
update negocios set id=7 where id=8;

update personal_rrhh set jefe=1 where puesto like 'Jefe%' or puesto like 'Anali%';
update personal_rrhh set subjefe=2 where puesto like 'Analis%' and cargo like '%Lvge%';
update personal_rrhh set subjefe=3 where puesto like 'Analis%' and cargo like '%Proseguri%';
update personal_rrhh set subjefe=3 where puesto like 'Analis%' and cargo like '%Ala%';

# Auto-Join
select*from personal_rrhh;
select*from negocios;

select 
t1.negocio_entrabajo as Orden,t2.n_negocio as Negocio, t1.nombre, t1.puesto,t1.cargo,t3.nombre as Subjefe, t3.cargo as SubjefePuesto
from personal_rrhh as t1 
inner join negocios as t2 on t1.negocio_entrabajo=t2.id
left join personal_rrhh as t3 on t1.subjefe=t3.id
order by Orden ;

truncate negocios;

