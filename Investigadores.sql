# Christian Castillo Díaz
create database Investigadores;
use Investigadores;
create table Facultad (
	IdFacultad tinyint,
    NomFacultad varchar(50)
);

alter table Facultad 
	add primary key (IdFacultad),
	modify NomFacultad varchar(50) unique;
    
alter table Facultad modify NomFacultad varchar(40);

create table Investigadores (
	DNI varchar(10),
    NomInvestigador varchar(35),
    ApellInvestigador varchar(50),
    IdFacultad tinyint
);

alter table Investigadores
	rename column NomInvestigador to Nombre,
    rename column ApellInvestigador to Apellidos;

alter table Investigadores    
    add constraint dni_pk primary key (DNI),
    modify DNI varchar(10) not null,
    add constraint dni_ch check (length(DNI) = 9),
    modify Apellidos varchar(50) unique,
    add constraint idfacultad_fk foreign key (IdFacultad) references Facultad (IdFacultad);
rename table Investigadores to Catedraticos;

create table Equipos (
	IdEquipo char(4),
    IdFacultad tinyint,
    Descripción varchar(50)
);

alter table Equipos
	add primary key (IdEquipo),
    add constraint equipos_fk1 foreign key (IdFacultad) references Facultad (IdFacultad),
    add Tipo varchar(30),
    add constraint tipo_ck check (Tipo in ('Audio', 'Vídeo', 'Electrónica', 'Datos'));
    

create table Reservas (
	IdReserva int,
    DNI varchar(10),
    IdEquipo char(4),
    FechaInicio datetime,
    FechaFin datetime
);

alter table Reservas add primary key (IdReserva);
alter table Reservas
    modify IdReserva int auto_increment,
    modify IdEquipo char(4) not null,
    add constraint reservas_fk1 foreign key (DNI) references Catedraticos(DNI),
    add constraint reservas_fk2 foreign key (IdEquipo) references Catedraticos(DNI),
    modify FechaInicio datetime default (curdate());
    

alter table Reservas modify IdReservas bigint primary key auto_increment;
 
 alter table Reservas modify IdEquipo varchar (4) not null;
 
 alter table Reservas add foreign key (DNI) references Catedraticos (DNI);
 
 alter table Reservas add foreign key (IdEquipo) references Equipos (IdEquipo);
 
alter table Reservas modify FechaInicio datetime default (curdate());

