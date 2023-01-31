create table if not exists Seats(
  seat int not null,
  status varchar(10) not null
);

delete from Seats;

insert into Seats values(1, '占');
insert into Seats values(2, '占');
insert into Seats values(3, '空');
insert into Seats values(4, '空');
insert into Seats values(5, '空');
insert into Seats values(6, '占');
insert into Seats values(7, '空');
insert into Seats values(8, '空');
insert into Seats values(9, '空');
insert into Seats values(10, '空');
insert into Seats values(11, '空');
insert into Seats values(12, '占');
insert into Seats values(13, '占');
insert into Seats values(14, '空');
insert into Seats values(15, '空');

select
  S1.seat as start_seat,
  '~',
  S2.seat as end_seat
from Seats S1, Seats S2, Seats S3
where S2.seat = S1.seat + (3 - 1)
  and S3.seat between S1.seat and S2.seat
group by S1.seat, S2.seat
having count(*) = sum(case when S3.status = '空' then 1 else 0 end)
;

create table if not exists Seats2(
  seat int not null,
  row_id varchar(1) not null,
  status varchar(10) not null
);

delete from Seats2;

insert into Seats2 values(1, 'A', '占');
insert into Seats2 values(2, 'A', '占');
insert into Seats2 values(3, 'A', '空');
insert into Seats2 values(4, 'A', '空');
insert into Seats2 values(5, 'A', '空');
insert into Seats2 values(6, 'B', '占');
insert into Seats2 values(7, 'B', '空');
insert into Seats2 values(8, 'B', '空');
insert into Seats2 values(9, 'B', '空');
insert into Seats2 values(10, 'B', '空');
insert into Seats2 values(11, 'C', '空');
insert into Seats2 values(12, 'C', '占');
insert into Seats2 values(13, 'C', '占');
insert into Seats2 values(14, 'C', '空');
insert into Seats2 values(15, 'C', '空');

select
  S1.seat as start_seat,
  '~',
  S2.seat as end_seat
from Seats2 S1, Seats2 S2, Seats2 S3
where S2.seat = S1.seat + (3 - 1)
  and S3.seat between S1.seat and S2.seat
group by S1.seat, S2.seat
having count(*) = sum(case when S3.status = '空' and S3.row_id = S1.row_id then 1 else 0 end)
;