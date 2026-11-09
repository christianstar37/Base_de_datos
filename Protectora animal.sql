# Christian Castillo Díaz
create database if not exists PROTECCION_ANIMAL;
use PROTECCION_ANIMAL;
# Christian Castillo Díaz
create table ESPECIE (
	id_especie int primary key auto_increment,
    nombre_comun varchar(100) not null,
    nombre_cientifico varchar(100) unique not null,
    categoria varchar(20) not null,
    poblacion_mundial int not null,
    fecha_registro date not null,
    constraint categoria_ck check (categoria in ("En peligro crítico", "En peligro", "Vulnerable")),
    constraint poblacion_ck check (poblacion_mundial > 0)
);

create table HABITAT (
	id_habitat int primary key auto_increment,
    nombre varchar(100) not null,
    pais varchar(60) not null,
    superficie_km2 decimal(10,2),
    tipo_ecosistema varchar(40) not null,
    clima varchar(30),
    constraint superficie_ck check (superficie_km2 > 0)
);

create table PRESENCIA (
	id_especie int not null,
    id_habitat int not null,
    ejemplares_estimados int not null,
    fecha_observacipn date not null,
    estado_conservacion varchar(30) not null,
    constraint presencia_pk primary key (id_especie, id_habitat),
    constraint presencia_fk1 foreign key (id_especie) references ESPECIE(id_especie),
    constraint presenvia_fk2 foreign key (id_habitat) references HABITAT(id_habitat),
    constraint ejemplares_ck check (ejemplares_estimados > 0),
    constraint estado_ck check (estado_conservacion in ("Estable", "Disminuyendo", "Crítico"))
);

# Christian Castillo Díaz
alter table REGISTRO_PRESENCIA add observaciones varchar(255);
describe REGISTRO_PRESENCIA;

alter table ESPECIE modify nombre_comun varchar(150);
alter table HABITAT modify nombre varchar(150);
alter table PRESENCIA modify estado_conservacion varchar(50);

alter table ESPECIE add peso_medio_kg decimal(8,2);
alter table HABITAT add topografia varchar(30);

alter table ESPECIE rename column nombre_comun to denominacion;

alter table HABITAT 
	drop constraint superficie_ck,
	rename column superficie_km2 to extension_km2,
    add constraint extension_ck check (extension_km2 > 0);

alter table PRESENCIA 
	drop constraint ejemplares_ck,
	rename column ejemplares_estimados to numero_ejemplares,
    add constraint ejemplares_ck check (numero_ejemplares > 0);

# Christian Castillo Díaz
create table INFORME_TEMPORAL (
	id_informe int primary key,
    descripcion varchar(100)
);
drop table INFORME_TEMPORAL;
select * from INFORME_TEMPORAL;

rename table PRESENCIA to REGISTRO_PRESENCIA;
describe REGISTRO_PRESENCIA;
describe HABITAT;
describe ESPECIE;