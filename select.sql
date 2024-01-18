select * from student_tb;
# *의 의미는 전체 컬럼

# student_tb에서 student_id, name 선택
# where student_tb = 1;  1에 값을 출력
# 1. from, 2. where, 3. select == (if)
# 컬럼 한줄 1개
# 특수기호 x 

select 
	student_id, 
    name,
    age
from 
	student_tb 
where 
	not name = '서창현'
    and name = '서창훈'; 
    
select 
	*
from
	student_tb
where
	name in ('서창현', '서창훈');
    
select
	*
from
	student_tb
where
	student_id in (1, 2, 3);
    

truncate table student_tb;
/*
	10명의 학생 정보 추가
	김도균 27 부산 금정구 
	김도훈 27 부산 진구
	김범수 33 부산 금정구
    김상현 26 부산 남구
    이재영 26 부산 서구
    이정찬 29	부산 부산진구
    이지언 26 부산 동래구
    이편원 30 경상남도 양산시
    전주환 30 부산 부산진구
    심재원 29 부산 남구
*/

insert into 
	student_tb (name, age, address)
values 
	('김도균', 27, '부산 금정구'),
    ('김도훈', 27, '부산 진구'),
    ('김범수', 33, '부산 금정구'),
    ('김상현', 26, '부산 남구'),
    ('이재영', 26, '부산 서구'),
    ('이정찬', 29, '부산 부산진구'),
    ('이지언', 26, '부산 동래구'),
    ('이편원', 30, '경상남도 양산시'),
    ('전주환', 30, '부산 부산진구'),
    ('심재원', 29, '부산 남구');
    
select 
    *
from 
	student_tb;
    
    
select
	*
from
	student_tb 
where
	age between 20 and 29;
    # 이상, 이하
    
    
select
	*
from
	student_tb 
where
	age >= 30
    and age <= 39;
    

select
	*
from
	student_tb
where
	name like '이%원%';
    # 시작 = '김%',  끝 = '%원', 중간 = %원% ,  문자열 수에 따라 __ '김__'
    
select
	*
from
	student_tb
where
	name like '%도%'
    or name like '%원';
    
    
# 집계(그룹화)
# from - group by - having - select - order by 
select
	# select의 수
    name,
    address,
	count(*) as address_count
    # 컬럼 재정의
from
	student_tb
group by 
	name,
	address
having
    count(*) >= 1
order by #오름차순 -> 기본값
	address_count desc,
    address desc;
    # 내림차순 desc
    

    



   
    
    
