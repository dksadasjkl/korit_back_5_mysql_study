-- 첫 번째 업데이트 쿼리: 'BLACK'인 제품 색상의 이름을 'Black'으로 업데이트합니다.
update product_color_tb
set product_color_name = 'Black'
where 
	product_color_name = 'BLACK';

-- 두 번째 업데이트 쿼리: 'White'인 제품 색상의 이름을 '화이트'로 업데이트합니다.
update product_color_tb
set product_color_name_kor = '화이트'
where
	product_color_name = 'White';

-- 세 번째 업데이트 쿼리: 'Black'인 제품 색상의 이름을 '블랙'으로 업데이트합니다.
update product_color_tb
set product_color_name_kor = '블랙'
where
	product_color_name = 'Black';

-- 네 번째 업데이트 쿼리: 'Green'인 제품 색상의 이름을 '그린'으로 업데이트합니다.
update product_color_tb
set product_color_name_kor = '그린'
where
	product_color_name = 'Green';
 
-- 다섯 번째 업데이트 쿼리: 조건에 따라 제품 색상의 이름을 한글로 업데이트합니다.
update product_color_tb
set 
	product_color_name_kor = case
		when product_color_name = 'Black' then '블랙' 
		when product_color_name = 'White' then '화이트' 
		when product_color_name = 'Green' then '그린' 
	end;
# if문 when (조건) -> 실행 


# update(from) - where - set