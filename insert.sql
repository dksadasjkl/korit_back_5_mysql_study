use `db_study`; #데이터 베이스 선택

insert into student_tb(student_id, name, age, address) values (0, '서창현', 27, '부산 남구');
insert into student_tb(address, name, age, student_id) values ('부산 남구', '서창훈', 27, 1);
insert into student_tb(name, adderss) values ('서창훈', null);
insert into student_tb values (0, '서창현', null, null);

insert into student_tb values (0, '서창&', null, null), (0, '서창*', null, null);
insert into student_tb 
    (student_id, name, age, address)
values 
	(0, '서창&', null, null), 
	(0, '서창*', null, null);