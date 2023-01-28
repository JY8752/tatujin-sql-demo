create table if not exists tbl_A(
  `key` varchar(1) not null,
  col_1 int not null,
  col_2 int not null,
  col_3 int not null
);

create table if not exists tbl_B(
  `key` varchar(1) not null,
  col_1 int not null,
  col_2 int not null,
  col_3 int not null
);

delete from tbl_A;
delete from tbl_B;

insert into tbl_A values('A', 2, 3, 4);
insert into tbl_A values('B', 0, 7, 9);
insert into tbl_A values('C', 5, 1, 6);

insert into tbl_B values('A', 2, 3, 4);
insert into tbl_B values('B', 0, 7, 9);
insert into tbl_B values('C', 5, 1, 6);

select
  case when count(*) = (select count(*) from tbl_A)
    and count(*) = (select count(*) from tbl_B) then '同じ！'
  else '違う！' end as result
from (
  select * from tbl_A
  union
  select * from tbl_B
) TMP;