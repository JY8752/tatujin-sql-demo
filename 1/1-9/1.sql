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

create table if not exists SeqTbl(seq int not null);

delete from SeqTbl;

insert into SeqTbl values(1);
insert into SeqTbl values(2);
insert into SeqTbl values(4);
insert into SeqTbl values(5);
insert into SeqTbl values(6);
insert into SeqTbl values(7);
insert into SeqTbl values(8);
insert into SeqTbl values(11);
insert into SeqTbl values(12);

select 
  S2.seq
from SeqTbl S1
  right outer join Sequence S2
  on S1.seq = S2.seq
where S2.seq between 1 and 12
  and S1.seq is null
order by S2.seq
;