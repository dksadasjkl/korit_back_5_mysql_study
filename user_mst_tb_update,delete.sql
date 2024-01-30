-- 첫 번째 쿼리: user_mst_tb에 새로운 사용자 정보를 삽입합니다.
insert into user_mst_tb
values (0, 'bac', '1234');

-- 두 번째 쿼리: user_mst_tb의 모든 열을 조회하여 현재 사용자 정보를 확인합니다.
select
	*
from
	user_mst_tb;

-- 세 번째 쿼리: user_dtl_tb의 모든 열을 조회하여 현재 사용자 상세 정보를 확인합니다.
select
	*
from
	user_dtl_tb;

-- 네 번째 쿼리: username이 'bac'인 사용자 정보를 user_mst_tb에서 삭제합니다.
delete
from 
	user_mst_tb
where
	username = 'bac';
    
    