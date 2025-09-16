create database Marketdb2
go
use marketdb2

select * from sys.databases;

create schema edu;

select * from sys.schemas;




drop table if exists edu.Markets
create table edu.Markets
(
	MarketID int identity (1,1) primary key, --identity avtomatik
	firstname varchar(50) not null, --not null; bo`sh bo`lishi mumkin emas
	lastname varchar(50) null, -- not null; bo`sh bo`lishi mumkin emas 
	birthdate date not null,
	grade int not null
);

select * from edu.markets
insert into edu.markets values('Rustam', 'Ukibaev', '1988-05-16', 10),
('Asilov', 'Farrux', '1989-06-15', 11),
('Koshakov', 'Ruslan', '1988-08-25', 9);

insert into edu.markets(firstname, birthdate, grade)
values ('Zarina', '1991-08-17', 11);

insert into edu.markets (firstname, lastname, birthdate, grade)
select 'Azizbek', '2001-03-27', 7);


insert into edu.markets values('Sobir', 'Keldibekov', '1978-07-12', 8);

select * FROM edu.markets



update edu.markets
set firstname = 'Koshakov', lastname = 'Ruslan',
WHERE marketid = 3

delete from edu.markets 
where grade = 5

alter table edu.markets 
add email varchar(100);



alter table edu.markets
drop column email;

exec sp_rename 'edu.markets.grade', 'classlevel', column;





set grade = 10
where firstname  = 'Sobir';



