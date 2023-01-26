create table if not exists TblAge(
  age_class int not null,
  age_range varchar(20) not null
);

create table if not exists TblSex(
  sex_cd varchar(1) not null,
  sex varchar(10) not null
);

create table if not exists TblPop(
  pref_name varchar(10) not null,
  age_class int not null,
  sex_cd varchar(1) not null,
  population int not null
);

delete from TblAge;
delete from TblSex;
delete from TblPop;

insert into TblAge values(1, "21~20歳");
insert into TblAge values(2, "31~40歳");
insert into TblAge values(3, "41~50歳");

insert into TblSex values("m", "男");
insert into TblSex values("f", "女");

insert into TblPop values("秋田", 1, "m", 400);
insert into TblPop values("秋田", 3, "m", 1000);
insert into TblPop values("秋田", 1, "f", 800);
insert into TblPop values("秋田", 3, "f", 1000);
insert into TblPop values("青森", 1, "m", 700);
insert into TblPop values("青森", 1, "f", 500);
insert into TblPop values("青森", 3, "f", 800);
insert into TblPop values("東京", 1, "m", 900);
insert into TblPop values("東京", 1, "f", 1500);
insert into TblPop values("東京", 3, "f", 1200);
insert into TblPop values("千葉", 1, "m", 900);
insert into TblPop values("千葉", 1, "f", 1000);
insert into TblPop values("千葉", 3, "f", 900);

select 
  Master.age_class as age_class,
  Master.sex_cd as sex_cd,
  sum(case when pref_name in ("青森", "秋田") then population else null end) as pop_tohoku,
  sum(case when pref_name in ("東京", "千葉") then population else null end) as pop_kanto
from (select age_class, sex_cd from TblAge, TblSex) Master
  left outer join TblPop Data
  on Master.age_class = Data.age_class
  and Master.sex_cd = Data.sex_cd
group by Master.age_class, Master.sex_cd
;