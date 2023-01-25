create table if not exists DistricProducts(
    district varchar(10) not null,
    name varchar(50) not null,
    price int not null
);

delete from DistricProducts;

insert into DistricProducts values("東北", "みかん", 100);
insert into DistricProducts values("東北", "りんご", 50);
insert into DistricProducts values("東北", "ぶどう", 50);
insert into DistricProducts values("東北", "レモン", 30);
insert into DistricProducts values("関東", "レモン", 100);
insert into DistricProducts values("関東", "パイン", 100);
insert into DistricProducts values("関東", "りんご", 100);
insert into DistricProducts values("関東", "ぶどう", 70);
insert into DistricProducts values("関西", "レモン", 70);
insert into DistricProducts values("関西", "スイカ", 30);
insert into DistricProducts values("関西", "りんご", 20);

select * from DistricProducts;

select "--------------";

select
    P1.district,
    P1.name,
    P1.price,
    (
        select count(P2.price)
        from DistricProducts P2
        where P1.district = P2.district
            and P2.price > P1.price
    ) + 1 as rank_1
from DistricProducts P1
;