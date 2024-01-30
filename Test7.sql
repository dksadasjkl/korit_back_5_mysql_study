	
CREATE TABLE sales_tb ( 
    customer VARCHAR(255), 
    amount INT
);

 

INSERT INTO 
	sales_tb (customer, amount)
VALUES 
	('John', 100), 
    ('Jane', 200), 
    ('John', 150), 
    ('Jane', 50), 
    ('Jim', 300);
    
select
	customer,
	sum(amount) as total_sales
from
	sales_tb
group by
	customer