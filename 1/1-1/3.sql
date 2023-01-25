create table if not exists Greatests (
  `key` varchar(1) not null,
  `x` int not null,
  `y` int not null,
  `z` int not null
);

select * from Greatests;

select
  `key`,
  case `key`
    when 'B' then 1
    when 'A' then 2
    when 'D' then 3
    when 'C' then 4
    else null end as sort_col
from Greatests
order by sort_col
;
