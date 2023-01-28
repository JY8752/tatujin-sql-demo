create table if not exists Skills(skill varchar(20) not null);

create table if not exists EmpSkills(
  emp varchar(20) not null,
  skill varchar(20) not null
);

delete from Skills;
delete from EmpSkills;

insert into Skills values('Oracle');
insert into Skills values('UNIX');
insert into Skills values('Java');

insert into EmpSkills values('相田', 'Oracle');
insert into EmpSkills values('相田', 'UNIX');
insert into EmpSkills values('相田', 'Java');
insert into EmpSkills values('相田', 'C#');
insert into EmpSkills values('神崎', 'Orac');
insert into EmpSkills values('神崎', 'UNIX');
insert into EmpSkills values('神崎', 'Java');
insert into EmpSkills values('平井', 'UNIX');
insert into EmpSkills values('平井', 'Oracle');
insert into EmpSkills values('平井', 'PHP');
insert into EmpSkills values('平井', 'Perl');
insert into EmpSkills values('平井', 'C++');
insert into EmpSkills values('若田部', 'Perl');
insert into EmpSkills values('渡来', 'Oracle');

select distinct emp
from EmpSkills ES
where
  not exists (select skill from Skills except select skill from EmpSkills ES2 where ES.emp = ES2.emp)
  and
  not exists (select skill from EmpSkills ES3 where ES.emp = ES3.emp except select skill from Skills)
;