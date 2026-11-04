# Christian Castillo Díaz
insert into Clientes values 
	('44111857A', '555895684', 15, 'Juan Pérez Acosta'),
    ('22158795Z', '956258978', 10, 'Basilio López Antequera'),
    ('66695871F', '689254785', 5, 'Ana Barceló Cáceres');

insert into Fábrica values 
	(1, 'Gijón', '947347293', '30393737F'),
    (2, 'Granada', '958472980', '20397370B'),
    (3, 'Zaragoza', '976529274', '24666783F');

insert into Operarios values 
    ('20397370B', 'Luisa Fernández Espinosa', 30, 3200.0000, 2),
	('24666783F', 'Esperanza Gómez Toledo', 41, 3200.0000, 3),
	('30393737F', 'Juan Vilchez Melguizo', 34, 3200.0000, 1),
	('32453713C', 'Gracia Delgado Ruiz', 25, 1300.0000, 3),
	('40650413N', 'Mariano Delgado Ruiz', 29, 1300.0000, 1),
	('47744183M', 'Julián López Castillo', 40, 1200.0000, 2),
	('48666783F', 'Manuel Castillo López', 50, 1200.0000, 3);

# Christian Castillo Díaz
insert into Pedidos (Fecha_Ped, DNI_Cli) values 
	('2021-09-06', '44111857A'),
    ('2022-10-08', '66695871F'),
    ('2023-11-23', '22158795Z');

insert into Zapatos values 
	('A23', 120, 'Bota', 1),
    ('S32', 90, 'Sandalia', 2),
    ('T99', 50, 'Otro', 3);

insert into Ped_Zap values 
	(1, 'A23', 6),
    (2, 'T99', 20),
    (3, 'T99', 15);

select * from Ped_Zap;

alter table Fábrica rename column Dir_Fab to Director_Fab;
alter table Clientes modify Nombre_Cli varchar(35);
alter table Operarios drop Edad;
alter table Operarios add Experiencia tinyint;
alter table Operarios add constraint experiencia_ck check (Experiencia > 0 and Experiencia < 40);
rename table Operarios to Trabajadores;
rename table Zapatos to Calzados;

# Christian Castillo Díaz
drop table Clientes;
desc Clientes