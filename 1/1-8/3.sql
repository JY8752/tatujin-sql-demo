create table if not exists Digits(digit int not null);
delete from Digits;
insert into Digits values(0);
insert into Digits values(1);
insert into Digits values(2);
insert into Digits values(3);
insert into Digits values(4);
insert into Digits values(5);
insert into Digits values(6);
insert into Digits values(7);
insert into Digits values(8);
insert into Digits values(9);

drop view if exists Sequence;

create view Sequence(seq)
  as
    select 
      D1.digit + (D2.digit * 10) + (D3.digit * 100)
    from Digits D1, Digits D2, Digits D3
;

select seq prime
from Sequence Dividend
where not exists (
  select *
  from Sequence Divisor
  where Divisor.seq <= Dividend.seq / 2
    and Divisor.seq <> 1
    and mod(Dividend.seq, Divisor.seq) = 0
)
and seq between 1 and 100
order by prime;
