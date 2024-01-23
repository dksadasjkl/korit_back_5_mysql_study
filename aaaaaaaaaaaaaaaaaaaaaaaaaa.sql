CREATE DEFINER=`aws`@`%` PROCEDURE `p_insert_book`(
	in v_book_name varchar(100),
    in v_author_name varchar(100),
    in v_publisher_name varchar(100),
	out v_status int
)
BEGIN
	declare _at_ai int;
	declare _new_author_id int;
    declare _pt_ai int;
    declare _new_publisher_id int;
    declare _bt_ai int;
    declare _new_book_id int;
    
    start transaction;
	
    call p_get_auto_increment('db_study', 'author_tb', _at_ai);
   	
	insert into  author_tb
	values (0, v_author_name);
        
	select 
		max(author_id) into _new_author_id
	from 
		author_tb;
 
 
	call p_get_auto_increment('db_study', 'publisher_tb', _pt_ai);
            
    insert into publisher_tb
	values (0, v_publisher_name);
        
	select max(publisher_id) into _new_publisher_id
	from publisher_tb;
	
	call p_get_auto_increment('db_study', 'book_tb', _bt_ai);
    
	insert into book_tb
	values (0, v_book_name, _new_author_id, _new_publisher_id);
        
	select max(book_id) into _new_book_id
	from book_tb;
        
        
	if not (_at_ai = _new_author_id) then
		set v_status = 0;
		rollback;
	elseif not (_pt_ai = _new_publisher_id) then
		set v_status = 0;
		rollback;
	elseif not (_bt_ai = _new_book_id) then
		set v_status = 0;
		rollback;
	else	
		set v_status = 1;
		commit; # 저장
    end if;
    
END