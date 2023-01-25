create table if not exists Products(
    name varchar(20) not null,
    price int not null
);

delete from Products;

insert into Products values("りんご", 100);
insert into Products values("みかん", 50);
insert into Products values("バナナ", 80);

select * from Products;

select "--------------------------------";

select
    P1.name as name_1,
    P2.name as name_2
from Products P1, Products P2
where P1.name >= P2.name
;