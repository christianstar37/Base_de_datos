# Christian Castillo Díaz
create database articulo_fabricante;
use articulo_fabricante;

create table FABRICANTES (
	Codigo int primary key auto_increment,
    Nombre varchar(100)
);

create table ARTICULOS (
	Codigo int primary key,
    Nombre varchar(100),
    Precio decimal(7,2),
    Fabricante int,
    constraint articulos_fk foreign key (Fabricante) references FABRICANTES(Codigo)
);
