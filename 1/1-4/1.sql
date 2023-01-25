create table if not exists SeqTbl(
  seq int not null,
  name varchar(20) not null
);

delete from SeqTbl;

insert into SeqTbl values(1, "ディアック");
insert into SeqTbl values(2, "アン");
insert into SeqTbl values(3, "ライル");
insert into SeqTbl values(4, "カー");
insert into SeqTbl values(5, "マリー");
insert into SeqTbl values(6, "ベン");

select * from SeqTbl;

select "--------";

select
  case when (select count(*) from SeqTbl) = Max(seq) then "歯抜けなし" else "歯抜けあり" end as gap
from SeqTbl;