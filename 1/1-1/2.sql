create table if not exists PopTbl2 (
  pref_name varchar(10) not null,
  sex int not null,
  population int not null,
  constraint sexcheck check(sex in(1, 2))
);

delete from PopTbl2;

insert into PopTbl2 values("徳島", 1, 60);
insert into PopTbl2 values("徳島", 2, 40);
insert into PopTbl2 values("香川", 1, 100);
insert into PopTbl2 values("香川", 2, 100);
insert into PopTbl2 values("愛媛", 1, 100);
insert into PopTbl2 values("愛媛", 2, 50);
insert into PopTbl2 values("高知", 1, 100);
insert into PopTbl2 values("高知", 2, 100);
insert into PopTbl2 values("福岡", 1, 100);
insert into PopTbl2 values("福岡", 2, 200);
insert into PopTbl2 values("佐賀", 1, 20);
insert into PopTbl2 values("佐賀", 2, 80);
insert into PopTbl2 values("長崎", 1, 125);
insert into PopTbl2 values("長崎", 2, 125);
insert into PopTbl2 values("東京", 1, 250);
insert into PopTbl2 values("東京", 2, 150);

select * from PopTbl2;

/*
pref_name	sex	population
徳島	1	60
徳島	2	40
香川	1	100
香川	2	100
愛媛	1	100
愛媛	2	50
高知	1	100
高知	2	100
福岡	1	100
福岡	2	200
佐賀	1	20
佐賀	2	80
長崎	1	125
長崎	2	125
東京	1	250
東京	2	150
*/

select
  case when sex = 1 then "男" else "女" end as "性別",
  sum(population) as "全国",
  sum(case when pref_name = "徳島" then population else 0 end) as "徳島",
  sum(case when pref_name = "香川" then population else 0 end) as "香川",
  sum(case when pref_name = "愛媛" then population else 0 end) as "愛媛",
  sum(case when pref_name = "高知" then population else 0 end) as "高知",
  sum(case when pref_name in ("徳島", "香川", "愛媛", "高知") then population else 0 end) as "四国（再喝)"
from 
  PopTbl2
group by
  sex
;

