create table if not exists Accounts(
  prc_date date not null,
  prc_amt int not null
);

delete from Accounts;

insert into Accounts values("2006-10-26", 12000);
insert into Accounts values("2006-10-28", 2500);
insert into Accounts values("2006-10-31", -15000);
insert into Accounts values("2006-11-03", 34000);
insert into Accounts values("2006-11-04", -5000);
insert into Accounts values("2006-11-06", 7200);
insert into Accounts values("2006-11-11", 11000);

select "---- sum ----" as '';

select
  prc_date,
  prc_amt,
  (
    select sum(prc_amt) from Accounts A2 where A1.prc_date >= A2.prc_date
  ) onhand_amt
from Accounts A1
order by prc_date
;

select "---- max ----" as '';

select
  prc_date,
  prc_amt,
  (
    select max(prc_amt) from Accounts A2 where A1.prc_date >= A2.prc_date
  ) onhand_amt
from Accounts A1
order by prc_date
;

select "---- min ----" as '';

select
  prc_date,
  prc_amt,
  (
    select min(prc_amt) from Accounts A2 where A1.prc_date >= A2.prc_date
  ) onhand_amt
from Accounts A1
order by prc_date
;

select "---- avg ----" as '';

select
  prc_date,
  prc_amt,
  (
    select avg(prc_amt) from Accounts A2 where A1.prc_date >= A2.prc_date
  ) onhand_amt
from Accounts A1
order by prc_date
;
