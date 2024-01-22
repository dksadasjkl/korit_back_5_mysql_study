insert into business_tb
select 
	0,
    business
from
	music_tb
group by
	business
order by
	business;


insert into youth_room_tb
select 
	0,
    youth_room
from
	music_tb
group by
	youth_room
order by
	youth_room;
    
    
