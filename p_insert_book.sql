call p_insert_book('asdasda','코리아아카데미','미디어아카데미');

# @ 전역변수
set @book_name = '혼자 공부하는 SQL';
set @author = '우재남';
set @publisher = '한빛미디어';
set @new_author_id = 0;
set @new_publisher_id = 0;

insert into author_tb
values (0, @author);

select
	max(author_id) into @new_author_id
from
	author_tb;
    
insert into publisher_tb
values (0, @publisher);

select 
	max(publisher_id) into @new_publisher_id
from 
	publisher_tb;


insert into book_tb
values (0, @book_name, @new_author_id, @new_publisher_id);

select
	*
from
	book_tb
order by
	book_id desc;