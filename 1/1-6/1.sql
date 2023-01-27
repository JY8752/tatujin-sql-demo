create table if not exists Sales(
  year int not null,
  sale int not null
);

delete from Sales;

insert into Sales values(1990, 50);
insert into Sales values(1991, 51);
insert into Sales values(1992, 52);
insert into Sales values(1993, 52);
insert into Sales values(1994, 50);
insert into Sales values(1995, 50);
insert into Sales values(1996, 49);
insert into Sales values(1997, 55);

select
  S1.year,
  S1.sale,
  case sign(sale - (select sale from Sales S2 where S2.year = S1.year - 1))
    when 1 then '↑'
    when 0 then '→'
    when -1 then '↓'
    else '-' end as var
from Sales S1
;