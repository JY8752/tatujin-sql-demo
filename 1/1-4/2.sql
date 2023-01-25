create table if not exists Students(
  student_id int not null,
  dpt varchar(30) not null,
  sbmt_date date
);

delete from Students;

insert into Students values(100, "理学部", "2005-10-10");
insert into Students values(101, "理学部", "2005-09-22");
insert into Students values(102, "文学部", null);
insert into Students values(103, "文学部", "2005-09-10");
insert into Students values(200, "文学部", "2005-09-22");
insert into Students values(201, "工学部", null);
insert into Students values(202, "経済学部", "2005-09-25");

select * from Students;

select "-------";

select dpt
from Students
group by dpt
having count(*) = sum(case when sbmt_date between "2005-09-01" and "2005-09-30" then 1 else 0 end);