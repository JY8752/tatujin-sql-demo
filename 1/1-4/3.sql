create table if not exists Items(item varchar(50) not null);

create table if not exists ShopItems(
  shop varchar(50) not null,
  item varchar(50) not null
);

delete from Items;
delete from ShopItems;

insert into Items values("ビール");
insert into Items values("紙オムツ");
insert into Items values("自転車");

insert into ShopItems values("仙台", "ビール");
insert into ShopItems values("仙台", "紙オムツ");
insert into ShopItems values("仙台", "自転車");
insert into ShopItems values("仙台", "カーテン");
insert into ShopItems values("東京", "ビール");
insert into ShopItems values("東京", "紙オムツ");
insert into ShopItems values("東京", "自転車");
insert into ShopItems values("大阪", "テレビ");
insert into ShopItems values("大阪", "紙オムツ");
insert into ShopItems values("大阪", "自転車");

select * from Items;
select * from ShopItems;

select "-------";

-- item
-- ビール
-- 髪オムツ
-- 自転車

-- shop	item
-- 仙台	ビール
-- 仙台	紙オムツ
-- 仙台	自転車
-- 仙台	カーテン
-- 東京	ビール
-- 東京	紙オムツ
-- 東京	自転車
-- 大阪	テレビ
-- 大阪	紙オムツ
-- 大阪	自転車

select 
  SI.shop,
  count(SI.item) my_item_cnt,
  (select count(item) from Items) - count(SI.item) diff_cnt
from ShopItems SI, Items I
where SI.item = I.item
group by SI.shop
;