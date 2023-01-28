create table if not exists ArrayTbl2(
  `key` varchar(1) not null,
  `i` int not null,
  `val` int
);

delete from ArrayTbl2;

insert into ArrayTbl2 values("A", 1, null);
insert into ArrayTbl2 values("A", 2, null);
insert into ArrayTbl2 values("A", 3, null);
insert into ArrayTbl2 values("A", 4, null);
insert into ArrayTbl2 values("A", 5, null);
insert into ArrayTbl2 values("A", 6, null);
insert into ArrayTbl2 values("A", 7, null);
insert into ArrayTbl2 values("A", 8, null);
insert into ArrayTbl2 values("A", 9, null);
insert into ArrayTbl2 values("A", 10, null);

insert into ArrayTbl2 values("B", 1, 3);
insert into ArrayTbl2 values("B", 2, null);
insert into ArrayTbl2 values("B", 3, null);
insert into ArrayTbl2 values("B", 4, null);
insert into ArrayTbl2 values("B", 5, null);
insert into ArrayTbl2 values("B", 6, null);
insert into ArrayTbl2 values("B", 7, null);
insert into ArrayTbl2 values("B", 8, null);
insert into ArrayTbl2 values("B", 9, null);
insert into ArrayTbl2 values("B", 10, null);

insert into ArrayTbl2 values("C", 1, 1);
insert into ArrayTbl2 values("C", 2, 1);
insert into ArrayTbl2 values("C", 3, 1);
insert into ArrayTbl2 values("C", 4, 1);
insert into ArrayTbl2 values("C", 5, 1);
insert into ArrayTbl2 values("C", 6, 1);
insert into ArrayTbl2 values("C", 7, 1);
insert into ArrayTbl2 values("C", 8, 1);
insert into ArrayTbl2 values("C", 9, 1);
insert into ArrayTbl2 values("C", 10, 1);

select distinct `key`
from ArrayTbl2 A1
where
  not exists (
    select val from ArrayTbl2 A2 where A1.`key` = A2.`key` and A2.val <> 1 
  )
  and
  A1.val is not null
;