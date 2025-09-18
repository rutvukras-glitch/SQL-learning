select * from emails


truncate table emails

bulk insert emails
from 'C:\Users\user\Downloads\Telegram Desktop\Emails (2).csv'

with (

	firstrow = 2 ,
	fieldterminator = ',',
	rowterminator='\n'
);


drop table if exists office
create table office 
	(id int identity (1,1), name varchar (50) null, surname varchar (50), phonenumber nvarchar (50) null)

	insert into office values ('Rustam', 'Ukibaev'), ('Akmal', 'Umirzakov'), ('Kamol', 'Muradov')


	select * from office





