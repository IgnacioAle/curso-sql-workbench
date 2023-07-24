create database holamundo;
show databases;
use holamundo;
create table animales (
	id int,
    tipo varchar(255),
    estado varchar(255),
    primary key (id)
);

-- insert into animales (tipo, estado) values ('chanchito', 'feliz');

 alter table animales modify column id int auto_increment;
show create table animales;

CREATE TABLE `animales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

insert into animales (tipo, estado) values ('chanchito', 'feliz');
insert into animales (tipo, estado) values ('dragon', 'feliz');
insert into animales (tipo, estado) values ('felipe', 'triste');

select * from animales;
select * from animales where id = 1;
select * from animales where estado = 'feliz' and tipo = 'chanchito';

update animales set estado = 'feliz' where id = 3;
select * from animales;

delete from animales where estado = 'feliz';

-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

delete from animales where id = 3;

select * from animales;
update animales set estado = 'triste' where tipo = 'dragon';
-- esto tambien arroja error 1175. Necesita un ID indicado

create table user (
	id int not null auto_increment,
    name varchar(50) not null,
    edad int not null,
    email varchar(50) not null,
    primary key(id)
);

insert into user (name, edad, email) values ('Oscar', 25, 'oscar@gmail.com');
insert into user (name, edad, email) values ('Layla', 15, 'layla@gmail.comc');
insert into user (name, edad, email) values ('Nicolas', 36, 'nicolas@gmail.com');
insert into user (name, edad, email) values ('Chanchito', 7, 'chanchito@gmail.com');

select * from user;
select * from user limit 1;
-- Este comando retorna un limite de resultados, en este caso solo uno.

select * from user where edad > 15;
select * from user where edad >= 15;
-- 59 minutos
select * from user where edad > 20 and email = 'nicolas@gmail.com';
select * from user where edad > 20 or email = 'layla@gmail.comc';
select * from user where email != 'layla@gmail.com';

 delete from user where id = 9;

select * from user where edad between 15 and 30;
select * from user where email like '%gmail%';
select * from user where name like 'Oscar%';
-- 1:10:26

select * from user order by edad asc;
select * from user order by edad desc;

select max(edad) as mayor from user;
select min(edad) as menor from user;

select id, name from user;
select id, name as Nombres from user;
select id, name as Chanchito from user; -- Comando para cambiar de nombre a alguna columna

create table products(
	id int not null auto_increment,
    name varchar(50) not null,
    created_by int not null,
    marca varchar(50) not null,
    primary key(id),
    foreign key(created_by) references user(id)
);

rename table products to product;

insert into product (name, created_by, marca)
values
	('Ipad', 10, 'Apple'),
    ('Iphone', 10, 'Apple'),
    ('Watch', 12, 'Apple'),
    ('Macbook', 10, 'Apple'),
    ('IMac', 13, 'Apple'),
    ('Ipad mini', 12, 'Apple'); -- 1:19:26
    
select * from product;
select u.id, u.email, p.name from user u left join product p on u.id = p.created_by;

select u.id, u.email, p.name from user u right join product p on u.id = p.created_by;

select u.id, u.email, p.name from user u inner join product p on u.id = p.created_by;

select u.id, u.name, p.id, p.name from user u cross join product p;

drop table product;
drop table animales;
drop table user;