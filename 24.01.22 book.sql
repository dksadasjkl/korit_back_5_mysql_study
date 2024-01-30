# select의 내용을 추가 
-- 첫 번째 쿼리: temp_book_tb에서 unique한 작가(author)를 가져와서 author_tb에 삽입합니다.
insert into author_tb
select
	0,
	author
from
	temp_book_tb
group by
	author
order by
	author;
    
select
	*
from
	author_tb;

-- 세 번째 쿼리: temp_book_tb에서 unique한 출판사(publisher)를 가져와서 publisher_tb에 삽입합니다.
insert into  publisher_tb(publisher_name)
select
    publisher
from
	temp_book_tb
group by
	publisher
order by
	publisher;


select
	*
from
	publisher_tb;
    
    
insert into  book_tb(book_name)
select
	book_name
from
	temp_book_tb
group by
	book_name
order by
	book_name;


    
select
	*
from
	book_tb bt
left outer join author_tb at on(at.author_id = bt.author_id)
left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id);



select
	*
from
	temp_book_tb tbt
	left outer join author_tb at on(at.author_name = tbt.author)
	left outer join publisher_tb pt on(pt.publisher_name = tbt.publisher)
group by
	tbt.book_name;



    

insert into book_tb
select
	0,
    tbt.book_name,
    at.author_id,
    pt.publisher_id
from
	temp_book_tb tbt
    left outer join author_tb at on(at.author_name = tbt.author) # 값이 같다면 테이블을 합쳐라(author_tb의 id와 name을)
    left outer join publisher_tb pt on(pt.publisher_name = tbt.publisher)
group by
	tbt.book_name,
    at.author_id,
    pt.publisher_id
order by
	tbt.book_name,
    at.author_id,
    pt.publisher_id;
    



insert into book_register_tb
select
	0,
	tbt.book_code,
    bt2.book_id,
    tbt.loans_count
from
	temp_book_tb tbt
    left outer join  (select 
							bt.book_id,
							bt.book_name,
                            at.author_name,
                            pt.publisher_name
						from 
							book_tb bt 
							left outer join author_tb at on (at.author_id = bt.author_id)
                            left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id)) bt2
on(bt2.book_name = tbt.book_name and bt2.author_name = tbt.author and bt2.publisher_name = tbt.publisher);



# inner join - 교집합 조회(양쪽, 확정o)
# left outer join - 전체 조회(값이 없어도 null출력, 확정x)

select
	*
from
(select
	# partition by bt.publisher_id select될때 그룹화
    # rank() 공동순위
    # row_number() 매칭시킬때 공동 x 
	rank() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as rank_num,
    row_number() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as row_num,
    brt.book_id,
    bt.book_name,
    bt.author_id,
    at.author_name,
    bt.publisher_id,
    pt.publisher_name,
    sum(brt.loans_count) as total_loans_count
from
	book_register_tb brt
    left outer join book_tb bt on (bt.book_id = brt.book_id) 
    left outer join author_tb at on (at.author_id = bt.author_id)
    left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id)
group by
	brt.book_id,
    bt.author_id,
    bt.publisher_id) as temp_book_register_tb #서브쿼드는 무조건 as 달아야함
where
	temp_book_register_tb.row_num = 1;

# 서브쿼리
# select, where, on, having = 컬럼 1개
# from = 컬럼 복수


-- 'book_tb' 테이블에 데이터를 삽입합니다.
insert into book_tb
select
	0,                              -- 'book_tb' 테이블의 'book_id' 필드에 삽입될 값
    tbt.book_name,                  -- 'temp_book_tb' 테이블의 'book_name' 필드 값
    at.author_id,                   -- 'author_tb' 테이블의 'author_id' 값
    pt.publisher_id                 -- 'publisher_tb' 테이블의 'publisher_id' 값
from
	temp_book_tb tbt
    left outer join author_tb at on(at.author_name = tbt.author) -- 'author_tb'와 'temp_book_tb'를 'author_name'을 기준으로 왼쪽 외부 조인
    left outer join publisher_tb pt on(pt.publisher_name = tbt.publisher) -- 'publisher_tb'와 'temp_book_tb'를 'publisher_name'을 기준으로 왼쪽 외부 조인
group by
	tbt.book_name,                  -- 그룹화할 기준이 되는 'temp_book_tb'의 'book_name' 값
    at.author_id,                   -- 그룹화할 기준이 되는 'author_tb'의 'author_id' 값
    pt.publisher_id                 -- 그룹화할 기준이 되는 'publisher_tb'의 'publisher_id' 값
order by
	tbt.book_name,                  -- 결과를 정렬하는 기준으로 'temp_book_tb'의 'book_name' 값
    at.author_id,                   -- 결과를 정렬하는 기준으로 'author_tb'의 'author_id' 값
    pt.publisher_id;                -- 결과를 정렬하는 기준으로 'publisher_tb'의 'publisher_id' 값


-- 'book_register_tb' 테이블에 데이터를 삽입합니다.
insert into book_register_tb
select
	0,                              -- 'book_register_tb' 테이블의 'register_id' 필드에 삽입될 값
	tbt.book_code,                  -- 'temp_book_tb' 테이블의 'book_code' 값
    bt2.book_id,                    -- 'book_tb'와 조인하여 얻은 'book_id' 값
    tbt.loans_count                 -- 'temp_book_tb' 테이블의 'loans_count' 값
from
	temp_book_tb tbt
    left outer join  (select 
							bt.book_id,
							bt.book_name,
                            at.author_name,
                            pt.publisher_name
						from 
							book_tb bt 
							left outer join author_tb at on (at.author_id = bt.author_id)
                            left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id)) bt2
on(bt2.book_name = tbt.book_name and bt2.author_name = tbt.author and bt2.publisher_name = tbt.publisher); 
-- 'book_tb', 'author_tb', 'publisher_tb'를 조인하여 'bt2'라는 서브쿼리를 만들고, 이를 'temp_book_tb'와 조인합니다.
-- 조인 조건은 'book_name', 'author_name', 'publisher_name'이 일치하는 경우입니다.


-- -- -- -- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- 
-- 'book_register_tb' 테이블에서 각 출판사별 도서 대출 통계를 조회합니다.
select
	*
from
(select
	-- 'publisher_id'를 기준으로 그룹화된 결과에 순위를 부여합니다.
	rank() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as rank_num,
    row_number() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as row_num,
    brt.book_id,                     -- 'book_register_tb' 테이블의 'book_id' 값
    bt.book_name,                    -- 'book_tb' 테이블의 'book_name' 값
    bt.author_id,                    -- 'book_tb' 테이블의 'author_id' 값
    at.author_name,                  -- 'author_tb' 테이블의 'author_name' 값
    bt.publisher_id,                     
    pt.publisher_name,               -- 'publisher_tb' 테이블의 'publisher_name' 값
    sum(brt.loans_count) as total_loans_count  -- 'book_register_tb' 테이블의 'loans_count' 값을 합산한 값
from
	book_register_tb brt
    left outer join book_tb bt on (bt.book_id = brt.book_id) -- 'book_tb'와 'book_register_tb'를 'book_id'를 기준으로 왼쪽 외부 조인
    left outer join author_tb at on (at.author_id = bt.author_id) -- 'author_tb'와 'book_tb'를 'author_id'를 기준으로 왼쪽 외부 조인
    left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id) -- 'publisher_tb'와 'book_tb'를 'publisher_id'를 기준으로 왼쪽 외부 조인
group by
	brt.book_id,                     -- 그룹화할 기준이 되는 'book_register_tb'의 'book_id' 값
    bt.author_id,                    -- 그룹화할 기준이 되는 'book_tb'의 'author_id' 값
    bt.publisher_id) as temp_book_register_tb -- 서브쿼리로 구성된 결과를 'temp_book_register_tb'라는 이름으로 지정
where
	temp_book_register_tb.row_num = 1;  -- 'row_num'이 1인 결과만 선택하여 최종 결과를 얻습니다. 이는 공동 순위 시 첫 번째로 매칭되는 결과를 선택하는 것입니다. 






    