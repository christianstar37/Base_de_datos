create table Alejandrita (
	codigo tinyint primary key,
    potencia float(6,3),
    precio_maquina float(7,2),
    precio_sesion float(5,2),
    consumo smallint
);

insert into Alejandrita (codigo, potencia, precio_maquina) values (1,50.5,12899.74);
insert into Alejandrita (codigo, potencia, precio_maquina, precio_sesion) values (2, 80.5, 15000, 80);
insert into Alejandrita values (3, 100, 18000, 100, null);
insert into Alejandrita values (null, 60, 1000, 50, 450); -- Da error ya que la clave primaria no puede ser null

select * from Alejandrita;

describe Alejandrita;