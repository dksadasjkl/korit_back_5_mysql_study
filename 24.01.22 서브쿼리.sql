-- 첫 번째 쿼리: '글%'로 시작하는 작가 이름을 가진 행 중에서 역순으로 정렬된 row_number를 부여하고, num이 10보다 큰 행을 선택합니다.
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
	where author_name like '글%') at
where 
	num > 10;

-- 두 번째 쿼리: publisher_tb의 모든 열을 불러오면서, 해당 테이블의 총 행 수를 total_count 컬럼으로 추가합니다.
select
	*,
    (select
		count(*)
	from
		publisher_tb) as total_count
from
    publisher_tb;

-- 세 번째 쿼리: publisher_tb의 모든 열을 불러오면서, 해당 테이블의 총 행 수를 비교연산을 통해 비교합니다.
select
	*
from
	publisher_tb pt
    left outer join (select count(*) as total_count from publisher_tb) pt2 on (1 = 1); 

-- 네 번째 쿼리: '아%'로 시작하는 출판사 이름을 가진 행에 해당하는 book_tb의 모든 열을 선택합니다.
select
	*
from
	book_tb bt
where
	publisher_id in (select publisher_id from publisher_tb where publisher_name like '아%');

-- 다섯 번째 쿼리: '아%'로 시작하는 출판사 이름을 가진 행을 기준으로 book_tb와 publisher_tb를 left outer join하여 선택합니다.
select
	*
from
	book_tb bt
	left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
where
	pt.publisher_name like '아%';

-- 마지막 세 줄: 프로파일링 활성화 및 속도 체크를 위한 쿼리입니다.
select @@profiling;
show profiles;
set profiling = 1; -- 1은 true를 의미하며, 프로파일링을 활성화합니다.



		
		
