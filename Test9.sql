truncate table USER_MST_TB;

insert into 
	USER_MST_TB
values
	(0, 'JOHN', 'JOHN@gmail.com'),
    (0, 'JANE', 'JANE@gmail.com'),
    (0, 'JIM', 'JIM@gmail.com');
    
select
	*
from
	USER_MST_TB;


insert into
	USER_DTL_TB
values
	(0, '010-1111-2222', 'MALE'),
	(0, '010-3333-4444', 'FEMALE'),
    (0, '010-5555-6666', 'MALE');
    
select
	*	
from
	USER_DTL_TB;
    
delete
	from 
	USER_MST_TB UMT
where
	UMT.USER_ID = 1;
	



    