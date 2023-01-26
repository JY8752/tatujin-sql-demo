create table if not exists Class_A(
  id int not null,
  name varchar(20) not null
);

create table if not exists Class_B(
  id int not null,
  name varchar(20) not null
);

delete from Class_A;
delete from Class_B;

insert into Class_A values(1, "田中");
insert into Class_A values(2, "鈴木");
insert into Class_A values(3, "伊集院");

insert into Class_B values(1, "田中");
insert into Class_B values(2, "内海");
insert into Class_B values(4, "西園寺");

-- merge into Class_A A
-- using (select * from Class_B) B
-- on (A.id = B.id)
-- when matched then
--   update set A.name = B.name
-- when not matched then
--   insert (id, name)
--   values (B.id, B.name);