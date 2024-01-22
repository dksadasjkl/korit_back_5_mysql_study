select
	at.num,
    at.author_name
from
	(select 
		row_number() over(order by author_id desc) as num,
        author_id,
        author_name 
	from 
		author_tb
	where author_name like '글%') at #from에서는 무조건  
where 
	num > 10;
    

        
#컬럼마다 카운트 작동
select
	*,
    (select
		count(*)
	from
		publisher_tb) as total_count
	from
    publisher_tb;
    
    
# 컬럼을 불러와서 비교연산	
select
	*
from
	publisher_tb pt
    left outer join (select count(*) as total_count from publisher_tb) pt2 on (1 = 1); 
	

select
	*
from
	book_tb bt
where
	publisher_id in (select publisher_id from publisher_tb where publisher_name like '아%');
    
    
select
	*
from
	book_tb bt
	left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
where
	pt.publisher_name like '아%';

# 속도 체크
select @@profiling;
show profiles;
set profiling = 1; # 1 = true




		
		
