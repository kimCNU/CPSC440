-- Kimberly Jimenez
-- Project 2
-- I tried to use the INSERT INTO SELECT statements but they were not working.
-- I wrote the examples that you wrote on the board
-- and for some reason they did not work for me.
-- Is there any way that I can try to fix this before the exam? 
-- 

drop schema if exists public cascade;
drop schema if exists private cascade;

drop table if exists public.Customer cascade;
drop table if exists public.SeatRow cascade;
drop table if exists public.SeatNum cascade;
drop table if exists public.Seat cascade;
drop table if exists public.Ticket cascade;
drop table if exists private.Customer cascade;

create schema public;
create schema private;

create table public.Customer(
    CustomerID	int primary key,
    FirstName text not null,
    LastName text not null
);

create table public.SeatRow(
    row char(2) primary key
);

create table public.SeatNum(
    num int primary key
);

create table public.Seat(
    SeatRow char(2) not null,
    SeatNum int not null,
    Section text not null,
    Side text not null,
    PricingTier text not null,
    Wheelchair boolean not null,
    constraint check_Section check(Section = 'Balcony' or  Section = 'Main Floor'),
    constraint check_Side check(Side = 'Right' or Side = 'Left' or Side = 'Middle'),
    constraint check_PricingTier check(PricingTier = 'Upper Balcony' or PricingTier = 'Side' or PricingTier = 'Orchestra'),
    constraint Seat_pk primary key(SeatRow,SeatNum),
	constraint SeatRow_fk foreign key (SeatRow) references public.SeatRow(row),
	constraint SeatNum_fk foreign key (SeatNum) references public.SeatNum(num)
);

create table public.Ticket(
	TicketNumber serial primary key,
    CustomerID int not null,
    SeatRow char(2) not null,
    SeatNum int not null,
    ShowTime timestamp not null,
    constraint Ticket_unique unique(SeatRow,SeatNum,ShowTime),
    constraint Ticket_fk foreign key(CustomerID) references public.Customer(CustomerID),
    CONSTRAINT Ticket_CK1 CHECK (ShowTime > TO_DATE('JAN-01-2008 02:54','MON-DD-YYYY HH24:MI'))
);
       
create table private.Customer(
	CustomerID int not null,
	creditcard bigint not null,
 	constraint Customer_fk foreign key(CustomerID) references public.Customer(CustomerID)
);

insert into SeatRow values('A');
insert into SeatRow values('B');
insert into SeatRow values('C');
insert into SeatRow values('D');
insert into SeatRow values('E');
insert into SeatRow values('F');
insert into SeatRow values('G');
insert into SeatRow values('H');
insert into SeatRow values('J');
insert into SeatRow values('K');
insert into SeatRow values('L');
insert into SeatRow values('M');
insert into SeatRow values('N');
insert into SeatRow values('O');
insert into SeatRow values('P');
insert into SeatRow values('Q');
insert into SeatRow values('R');
insert into SeatRow values('AA');
insert into SeatRow values('BB');
insert into SeatRow values('CC');
insert into SeatRow values('DD');
insert into SeatRow values('EE');
insert into SeatRow values('FF');
insert into SeatRow values('GG');
insert into SeatRow values('HH');

insert into SeatNum values(1);
-- insert into Seat
-- values ('A',1,'Main Floor','Middle','Orchestra',False);

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=1
and SeatNum.num <= 10
and SeatRow.row = 'A'
and SeatRow.row = 'B'
and SeatRow.row = 'C'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=1
and SeatNum.num <= 11
and SeatRow.row = 'D'
and SeatRow.row = 'E'
and SeatRow.row = 'F'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=1
and SeatNum.num <= 12
and SeatRow.row = 'G'
and SeatRow.row = 'H'
and SeatRow.row = 'J'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=1
and SeatNum.num <= 13
and SeatRow.row = 'K'
and SeatRow.row = 'L'
and SeatRow.row = 'M'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=1
and SeatNum.num <= 14
and SeatRow.row = 'N'
and SeatRow.row = 'O'
and SeatRow.row = 'P'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=1
and SeatNum.num <= 15
and SeatRow.row = 'Q'
and SeatRow.row = 'R'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=1
and SeatNum.num <= 13
and SeatRow.row = 'AA'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=1
and SeatNum.num <= 14
and SeatRow.row = 'BB'
and SeatRow.row = 'CC'
and SeatRow.row = 'DD'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Balcony','Middle','Upper Balcony',False
from SeatRow,SeatNum
where SeatNum.num >=1
and SeatNum.num <= 10
and SeatRow.row = 'EE'
and SeatRow.row = 'FF'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Balcony','Middle','Upper Balcony',False
from SeatRow,SeatNum
where SeatNum.num >=1
and SeatNum.num <= 11
and SeatRow.row = 'GG'
and SeatRow.row = 'HH'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Balcony','Right','Upper Balcony',False
from SeatRow,SeatNum
where SeatNum.num >=102
and SeatNum.num <= 120
and SeatRow.row = 'HH'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Balcony','Right','Upper Balcony',False
from SeatRow,SeatNum
where SeatNum.num >=101
and SeatNum.num <= 120
and SeatRow.row = 'GG'
; 

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Balcony','Right','Upper Balcony',False
from SeatRow,SeatNum
where SeatNum.num >=101
and SeatNum.num <= 120
and SeatRow.row = 'FF'
and SeatRow.row = 'EE'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Balcony','Right','Side',False
from SeatRow,SeatNum
where SeatNum.num >=101
and SeatNum.num <= 126
and SeatRow.row = 'DD'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Balcony','Right','Side',False
from SeatRow,SeatNum
where SeatNum.num >=101
and SeatNum.num <= 124
and SeatRow.row = 'CC'
and SeatRow.row = 'BB'
and SeatRow.row = 'AA'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=101
and SeatNum.num <= 113
and SeatRow.row = 'A'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=101
and SeatNum.num <= 116
and SeatRow.row = 'B'
and SeatRow.row = 'C'
and SeatRow.row = 'D'
and SeatRow.row = 'E'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=101
and SeatNum.num <= 118
and SeatRow.row = 'F'
and SeatRow.row = 'G'
and SeatRow.row = 'H'
and SeatRow.row = 'J'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=101
and SeatNum.num <= 120
and SeatRow.row = 'K'
and SeatRow.row = 'L'
and SeatRow.row = 'M'
and SeatRow.row = 'N'
;

insert into Seat(SeatRow,SeatNum,Section,Side,PricingTier,Wheelchair)
select row,num,'Main Floor','Middle','Orchestra',False
from SeatRow,SeatNum
where SeatNum.num >=101
and SeatNum.num <= 122
and SeatRow.row = 'O'
and SeatRow.row = 'P'
and SeatRow.row = 'Q'
and SeatRow.row = 'R'
;

update Seat
set Side = 'Left'
where SeatNum > 100
and SeatNum%2 = 1;

update Seat
set Side = 'Right'
where SeatNum > 100
and SeatNum%2 = 0;

update Seat
set Wheelchair = true
where SeatRow = 'P'
and SeatRow= 'R'
and SeatRow= 'Q'
and SeatNum >= 109 and SeatNum<= 122;

update Seat
set PricingTier = 'Side'
where SeatNum >= 107
and Section = 'Main Floor';

insert into public.Customer values(1234, 'Michael', 'Johnson');
insert into private.Customer values(1234,1234567887654321);
insert into public.Ticket(CustomerID,SeatRow,SeatNum,ShowTime) values(1234,'A',6,'Dec-06-2017 2:00 PM');
insert into public.Ticket(CustomerID,SeatRow,SeatNum,ShowTime) values(1234,'A',8,'Dec-06-2017 2:00 PM');
insert into public.Ticket(CustomerID,SeatRow,SeatNum,ShowTime) values(1234,'A',9,'Dec-06-2017 2:00 PM');
insert into public.Ticket(CustomerID,SeatRow,SeatNum,ShowTime) values(1234,'A',10,'Dec-06-2017 2:00 PM');