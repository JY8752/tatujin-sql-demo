create table if not exists Projects(
  project_id varchar(20) not null,
  step_nbr int not null,
  status varchar(10) not null
);

delete from Projects;

insert into Projects values("AA100", 0, "完了");
insert into Projects values("AA100", 1, "待機");
insert into Projects values("AA100", 2, "待機");
insert into Projects values("B200", 0, "待機");
insert into Projects values("B200", 1, "待機");
insert into Projects values("CS300", 0, "完了");
insert into Projects values("CS300", 1, "完了");
insert into Projects values("CS300", 2, "待機");
insert into Projects values("CS300", 3, "待機");
insert into Projects values("DY400", 0, "完了");
insert into Projects values("DY400", 1, "完了");
insert into Projects values("DY400", 2, "完了");

select * from Projects P1
where '◯' = all (
  select case
    when step_nbr <= 1 and status = '完了' then '◯'
    when step_nbr > 1 and status = '待機' then '◯'
    else 'x' end
  from Projects P2
  where P1.project_id = P2.project_id
);