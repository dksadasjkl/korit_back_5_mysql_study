insert into
	student_tb
values
	(0, '김춘식'),
    (0, '손흥민');
    

insert into
	subject_tb
values
	(0, '컴퓨터 구조'),
    (0, '데이터 베이스'),
    (0, '인공지능');
    
insert into
	grade_tb
values
	(0, 1, 1, 95),
    (0, 2, 1, 84),
    (0, 1, 2, 89),
    (0, 2, 2, 92),
    (0, 1, 3, 100),
    (0, 2, 3, 88);

select
	gt.grade_id,
    gt.student_id,
    st.student_name,
    gt.subject_id,
    st2.subject_name,
    gt.grade_point
from
	grade_tb gt
left outer join student_tb st on (st.student_id = gt.student_id)
left outer join subject_tb st2 on (st2.subject_id = gt.subject_id)
where
	grade_id in (1, 2, 3, 4);