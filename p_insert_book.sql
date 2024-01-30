-- 저장 프로시저 'p_insert_book'을 호출하여 도서 정보를 삽입합니다. 
-- 이때, 매개변수로 전달되는 값은 각각 도서명, 저자명, 출판사명입니다.
call p_insert_book('asdasda','코리아아카데미','미디어아카데미');

-- 전역 변수를 사용하여 도서 정보를 추가합니다.
-- 도서명, 저자명, 출판사명을 각각 변수에 저장하고, 새로운 저자 및 출판사의 ID 값을 저장할 변수를 초기화합니다.
set @book_name = '혼자 공부하는 SQL';
set @author = '우재남';
set @publisher = '한빛미디어';
set @new_author_id = 0;
set @new_publisher_id = 0;

-- 'author_tb' 테이블에 새로운 저자 정보를 삽입합니다.
insert into author_tb
values (0, @author);

-- 가장 최근에 추가된 저자의 ID를 찾아 'new_author_id' 변수에 저장합니다.
select
	max(author_id) into @new_author_id
from
	author_tb;

-- 'publisher_tb' 테이블에 새로운 출판사 정보를 삽입합니다.
insert into publisher_tb
values (0, @publisher);

-- 가장 최근에 추가된 출판사의 ID를 찾아 'new_publisher_id' 변수에 저장합니다.
select 
	max(publisher_id) into @new_publisher_id
from 
	publisher_tb;

-- 'book_tb' 테이블에 새로운 도서 정보를 삽입합니다.
-- 이때, 새로운 저자 ID와 출판사 ID를 사용합니다.
insert into book_tb
values (0, @book_name, @new_author_id, @new_publisher_id);

-- 'book_tb' 테이블을 조회하여 결과를 확인합니다.
select
	*
from
	book_tb
order by
	book_id desc;