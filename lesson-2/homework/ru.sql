


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



