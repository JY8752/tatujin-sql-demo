create table if not exists DistricProducts2(
    district varchar(10) not null,
    name varchar(50) not null,
    price int not null,
    ranking int default null
);

delete from DistricProducts2;

insert into DistricProducts2 values("東北", "みかん", 100, null);
insert into DistricProducts2 values("東北", "りんご", 50, null);
insert into DistricProducts2 values("東北", "ぶどう", 50, null);
insert into DistricProducts2 values("東北", "レモン", 30, null);
insert into DistricProducts2 values("関東", "レモン", 100, null);
insert into DistricProducts2 values("関東", "パイン", 100, null);
insert into DistricProducts2 values("関東", "りんご", 100, null);
insert into DistricProducts2 values("関東", "ぶどう", 70, null);
insert into DistricProducts2 values("関西", "レモン", 70, null);
insert into DistricProducts2 values("関西", "スイカ", 30, null);
insert into DistricProducts2 values("関西", "りんご", 20, null);

select * from DistricProducts2;

select "--------------";

update DistricProducts2
set ranking = (
    select P1.ranking
    from (
        select 
            district,
            name,
            rank() over(partition by district order by price desc) as ranking
        from DistricProducts2
    ) P1
    where P1.district = DistricProducts2.district
        and P1.name = DistricProducts2.name
);

select "------ update --------";

select * from DistricProducts2;