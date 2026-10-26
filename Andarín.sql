# Christian Castillo Díaz
create table Clientes (
    DNI_Cli char(9) primary key,
    Tlf_Cli char(9) not null,
    Descuento tinyint,
    Nombre_Cli varchar(50) not null
);

create table Fábrica (
    IdFab tinyint primary key,
    Localizacion varchar(50),
    Tel_Fab char(9),
    Dir_Fab varchar(30),
    constraint fab_loc_ck check (Localizacion in ('Gijón', 'Granada', 'Zaragoza'))
);


-- DUDA: LAS FK HAY QUE PONERLAS COMO not null SI LO DICEN O NO ES NECESARIO YA QUE SON OBLIGATORIAS EN SU TABLA?


create table Operarios (
    DNI_Op char(9) primary key,
    Nombre_Op varchar(50) not null,
    Edad tinyint not null,
    Sueldo float(7,2) not null,
    Fábrica tinyint,
    constraint op_fk foreign key (Fábrica) references Fábrica(IdFab),
    constraint op_edad_ck check (16 <= Edad and Edad <= 65),
    constraint op_sueldo_ck check (Sueldo > 0)
);

create table Pedidos (
    N_Pedido int primary key auto_increment,
    Fecha_Ped date not null,
    DNI_Cli char(9),
    constraint ped_fk foreign key (DNI_Cli) references Clientes(DNI_Cli)
);

create table Zapatos (
    Cod_Zap char(3) primary key,
    PVP smallint not null,
    Tipo varchar(10) not null,
    Fábrica tinyint,
    constraint zap_pvp_ck check (PVP > 0),
    constraint zap_tipo_ck check (Tipo in ('Bota', 'Deportivo', 'Sandalia', 'Otro')),
    constraint zap_fk foreign key (Fábrica) references Fábrica(IdFab)
);

create table Ped_Zap (
    N_Pedido int,
    Cod_Zap char(3),
    Cantidad smallint not null,
    primary key (N_Pedido, Cod_Zap)
)