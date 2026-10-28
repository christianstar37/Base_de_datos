create table Persona (
	DNI varchar(9) primary key,
    nombre varchar(20),
    apellidos varchar(30),
    aficiones text,
    colorOjos enum('azul', 'verde', 'marrón', 'negro'),
    codMaquina tinyint,
    foreign key(codMaquina) references Alejandrita(codigo)
);

-- alter table Persona add column Aficiones tinytext after Apellidos;
-- insert into Persona (ColorOjos, Apellidos, DNI, Nombre) values ('miel', 'Pérez Pérez', '13065532E', 'Paco') -- 'miel' da error porque no está en el enum
-- alter table Persona modify column Apellidos varchar(50);

insert into Persona values ('12345678A', 'Aitor', 'Gallardo García', 'Jugar videojuegos','marrón', 1);
insert into Persona values ('23126798Y', 'Rocío', 'Hernández Mercado', 'Leer libros digitales','verde', 2);
insert into Persona values ('95823287G', 'Marina', 'Pulido Cañas', 'Dibujar', 'azul', 3);
select * from Persona;

drop table Persona;