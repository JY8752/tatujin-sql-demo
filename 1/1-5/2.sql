create table if not exists Personnel(
  employ varchar(50) not null,
  child_1 varchar(50),
  child_2 varchar(50),
  child_3 varchar(50)
);

delete from Personnel;

insert into Personnel values("赤井", "一郎", "二郎", "三郎");
insert into Personnel values("工藤", "春子", "夏子", null);
insert into Personnel values("鈴木", "夏子", null, null);
insert into Personnel values("吉田", null, null, null);

select * from Personnel;

select "--------" as '';

create or replace view Children(child)
as
select child_1 from Personnel
union
select child_2 from Personnel
union
select child_3 from Personnel
;

select
  EMP.employ employee,
  count(Children.child) child_cnt
from Personnel EMP
  left outer join Children
  on Children.child in (EMP.child_1, EMP.child_2, EMP.child_3)
group by EMP.employ
;