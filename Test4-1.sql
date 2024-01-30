insert into
	product_tb
values
	(0, '딸기사탕', 50),
    (0, '누룽지사탕', 100);

insert into
	product_tb
values
	(0, '오렌지사탕', 20);

START TRANSACTION;

savepoint rollbackpoint;
update 
	product_tb
set 
	product_quantity = 200
where
	product_id = 1;
    
    rollback to savepoint rollbackpoint;
    
update 
	product_tb
set 
	product_quantity = 200
where
	product_id = 2;
    
commit;

select
	*
from
	product_tb;