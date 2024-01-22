insert into  
	product_tb (product_name, product_size, product_color, product_pice)
    
values 
	('모헤어 브이넥 앙고라 니트', 'S', 'Black', 37400),
	('모헤어 브이넥 앙고라 니트', 'M', 'Black', 37400),
    ('모헤어 브이넥 앙고라 니트', 'L', 'Black', 37400),
    ('모헤어 브이넥 앙고라 니트', 'XL', 'Black', 37400),
	('콘테 코듀로이 와이드 밴딩 팬츠', 'S', 'White', 38000),
    ('콘테 코듀로이 와이드 밴딩 팬츠', 'M', 'White', 38000),
    ('콘테 코듀로이 와이드 밴딩 팬츠', 'L', 'White', 38000),
    ('콘테 코듀로이 와이드 밴딩 팬츠', 'XL', 'White', 38000),
    ('콘테 코듀로이 와이드 밴딩 팬츠', 'XXL', 'White', 38000),
	('버티칼 투웨이 골지 양털 집업', 'M', 'Navy', 49000),
    ('버티칼 투웨이 골지 양털 집업', 'L', 'Navy', 49000),
    ('버티칼 투웨이 골지 양털 집업', 'XL', 'Navy', 49000),
    ('버티칼 투웨이 골지 양털 집업', 'XXL', 'Navy', 49000),
	('반집업 꽈배기 카라니트', 'SS', 'White', 48000),
    ('반집업 꽈배기 카라니트', 'S', 'White', 48000),
    ('반집업 꽈배기 카라니트', 'M', 'White', 48000),
    ('반집업 꽈배기 카라니트', 'L', 'White', 48000),
    ('반집업 꽈배기 카라니트', 'XL', 'White', 48000),
	('후드 MA-1 패딩 점퍼', 'S', 'Black', 62000),
    ('후드 MA-1 패딩 점퍼', 'M', 'Black', 62000),
    ('후드 MA-1 패딩 점퍼', 'L', 'Black', 62000),
    ('후드 MA-1 패딩 점퍼', 'XL', 'Black', 62000);
    
	
    
    select 
		product_size,
        count(product_size) as product_size_count
	from 
		product_tb
	group by
		product_size;
	
    
    
        
	select 
		product_color,
        count(product_color) as product_color_count
	from 
		product_tb
	group by
		product_color;
	