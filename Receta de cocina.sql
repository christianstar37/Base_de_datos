# Christian Castillo Díaz
create database libro_recetas;
use libro_recetas;
create table receta (
	nombre varchar(20) primary key,
    duracion smallint not null,
    descripcion text not null,
    comentarios tinytext,
    tipo enum('Entrante', 'Primero', 'Segundo', 'Postre') not null,
    constraint receta_dur_ck check (duracion <= 360)
);
create table unidad (
	id tinyint primary key auto_increment,
    nombre varchar(15) unique
);
create table ingrediente (
	id tinyint primary key,
    nombre varchar(15) unique,
    id_unidad tinyint not null,
    constraint ingrediente_fk foreign key (id_unidad) references unidad(id)
);
create table usa (
	nombre varchar(20),
    id tinyint,
    cantidad float(5,2) not null,
    primary key (nombre, id),
    constraint usa_fk_1 foreign key (nombre) references receta(nombre),
    constraint usa_fk_2 foreign key  (id) references ingrediente(id)
);

insert into receta values ('Macarrones', 40, 'Cocer la pasta y echar tomate.', 'Echar queso y derretirlo al final le da un toque.', 'Primero');

insert into unidad (nombre) values ('Gramos');

insert into ingrediente values (5, 'Tomate frito', 1);

insert into usa values ('Macarrones', 5, 200);
