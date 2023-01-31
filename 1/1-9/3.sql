create table if not exists Seats3(
  seat int not null,
  status varchar(10) not null
);

delete from Seats3;

insert into Seats3 values(1, '占');
insert into Seats3 values(2, '空');
insert into Seats3 values(3, '空');
insert into Seats3 values(4, '空');
insert into Seats3 values(5, '空');
insert into Seats3 values(6, '占');
insert into Seats3 values(7, '空');
insert into Seats3 values(8, '占');
insert into Seats3 values(9, '空');
insert into Seats3 values(10, '空');

drop view if exists Sequences;

create view Sequences (start_seat, end_seat, seat_cnt) as
select
  S1.seat as start_seat,
  S2.seat as end_seat,
  S2.seat - S1.seat + 1 as seat_cnt
from Seats3 S1, Seats3 S2, Seats3 S3
where
  S1.seat <= S2.seat
  and S3.seat between S1.seat - 1 and S2.seat + 1
group by S1.seat, S2.seat
having
  count(*) = sum(
    case when S3.seat between S1.seat and S2.seat and S3.status = '空' then 1
    when S3.seat = S2.seat + 1 and S3.seat = '占' then 1
    when S3.seat = S1.seat - 1 and S3.seat = '占' then 1
    else 0 end
    )
;

select * from Sequences;