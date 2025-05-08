# -------------------------------------
# Nuevas Tablas Productividad Prosegur
# -------------------------------------

# Crear Storage
show databases;
create database st_070525_ii;
use st_070525_ii;

show tables;

# Crear Tablas
-- 
create table negocios(
id int primary key auto_increment,
n_negocio varchar(250),
fec_crea timestamp default CURRENT_TIMESTAMP()
);
-- 
create table personal_rrhh(
id int primary key auto_increment,
nombre  varchar(250) not null,
apellido_p  varchar(250) not null,
apellido_m  varchar(250) not null,
puesto  varchar(250) not null,
cargo  varchar(250) not null,
negocio_encontrato int not null,
negocio_entrabajo int not null,
fec_crea timestamp default CURRENT_TIMESTAMP()
);
-- 
create table superiorsubordinado(
id int primary key auto_increment,
superior int not null,
subordinado int not null,
fec_crea timestamp default CURRENT_TIMESTAMP()
);

drop table superiorsubordinado;
-- 
create table requerimientos(
id int primary key auto_increment,
nombre varchar(250) not null,
puesto varchar(250) not null,
nvacantes varchar(250) not null,
perfil varchar(250) not null,
detalles varchar(250) not null,
id_solicitante int not null,
fec_ini timestamp not null,
fec_fin timestamp not null,
fec_crea timestamp default CURRENT_TIMESTAMP() not null
fec_aprobo timestamp not null,
fec_asigno timestamp not null,
aprobadopor int,
asignadopor int,
analistaasignado int,
algunavez_standby int,
ndiaslab_standby int,
sino_adjuntos int,
estado int
);

create table standby(
id int primary key auto_increment,
id_req int not null,
fec_ini timestamp not null,
fec_fin timestamp not null
);

create table archivosadjuntos(
id int primary key auto_increment,
id_req int not null,
nom_archivo varchar(250) not null,
fec_crea timestamp default CURRENT_TIMESTAMP() not null
);

create table estados(
id int primary key auto_increment,
nom_estado varchar(250) not null,
fec_crea timestamp default CURRENT_TIMESTAMP() not null
);

create table solicitantes(
id int primary key auto_increment,
nom_estado varchar(250) not null,
fec_crea timestamp default CURRENT_TIMESTAMP() not null
);


# Insertar Registros
desc negocios;
insert into negocios values(null,'Lvge',default);
insert into negocios values(null,'Proseguridad',default);
insert into negocios values(null,'Alarmas',default);
insert into negocios values(null,'Lvge_Proseguridad',default);
insert into negocios values(null,'Lvge_Alarmas',default);
insert into negocios values(null,'Proseguridad_Alarmas',default);
insert into negocios values(null,'Lvge_Proseguridad_Alarmas',default);
select * from negocios;
truncate negocios;
-- 
desc personal_rrhh;
insert into personal_rrhh values(null,'Viviana','','','Gerente RRHH','Gerente',1,1,default);
insert into personal_rrhh values(null,'Luciana','','','Jefe RRHH','Jefa LVGE',1,1,default);
insert into personal_rrhh values(null,'Adriana','','','Jefe RRHH','Jefa Proseguridad Alarmas',2,6,default);
insert into personal_rrhh values(null,'Monica','','','Analista RRHH','Analista Lvge',1,1,default);
insert into personal_rrhh values(null,'Cynthia','','','Analista RRHH','Analista Proseguridad',2,2,default);
insert into personal_rrhh values(null,'Amelia','','','Analista RRHH','Analista Alarmas',3,3,default);
insert into personal_rrhh values(null,'Ofelia','','','Analista RRHH','Analista Proseguridad y Alarmas',2,6,default);
insert into personal_rrhh values(null,'Emilia','','','Asistente RRHH','Asistente Lvge',1,1,default);
insert into personal_rrhh values(null,'Vanessa','','','Asistente RRHH','Asistente Proseguridad Alarmas',2,6,default);
insert into personal_rrhh values(null,'Diana','','','Asistente RRHH','Asistente Proseguridad Alarmas',2,6,default);
select * from personal_rrhh;
truncate personal_rrhh;
-- 
select 
t1.id,t1.nombre,t1.cargo,t2.n_negocio as negocio
from personal_rrhh as t1
inner join negocios as t2 on t1.negocio_entrabajo =t2.id;
-- 
desc superiorsubordinado;
insert into superiorsubordinado values(null,1,2,default);
insert into superiorsubordinado values(null,1,3,default);
insert into superiorsubordinado values(null,2,4,default);
insert into superiorsubordinado values(null,2,8,default);
insert into superiorsubordinado values(null,3,5,default);
insert into superiorsubordinado values(null,3,7,default);
insert into superiorsubordinado values(null,3,9,default);
insert into superiorsubordinado values(null,3,10,default);
insert into superiorsubordinado values(null,1,10,default);
select*from superiorsubordinado;
-- 
select * from negocios;
select * from personal_rrhh;
select * from superiorsubordinado;

select t2.nombre as Superior,t2.cargo as Cargo_Superior,t3.nombre as Subordinado,t3.cargo as Cargo_Subordinado
from superiorsubordinado as t1
inner join personal_rrhh as t2 on t1.superior=t2.id
inner join personal_rrhh as t3 on t1.subordinado=t3.id;

-- 
