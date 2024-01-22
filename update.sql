update product_color_tb
set product_color_name = 'Black'
where 
	product_color_name = 'BLACK';

update product_color_tb
set product_color_name_kor = '화이트'
where
	product_color_name = 'White';

update product_color_tb
set product_color_name_kor = '블랙'
where
	product_color_name = 'Black';
    
update product_color_tb
set product_color_name_kor = '그린'
where
	product_color_name = 'Green';
    
 
update product_color_tb
set 
	product_color_name_kor = case
		when product_color_name = 'Black' then '블랙' 
		when product_color_name = 'White' then '화이트' 
		when product_color_name = 'Green' then '그린' 
end;
# if문 when (조건) -> 실행 


# update(from) - where - set