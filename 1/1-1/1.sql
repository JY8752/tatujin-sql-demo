select `key`,
  case when x < y then y
  else x end as greatest
from Greatests;

select `key`,
case when case when x < y then y else x end < z then z
  else case when x < y then y else x end
end as greatest
from Greatests;


