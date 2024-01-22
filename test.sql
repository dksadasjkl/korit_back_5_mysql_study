select
	sat.student_sido_id,
    sst.student_sido_name,
    sat.student_sigungu_id,
    sgt.student_sigungu_name
from
	student_address_tb sat
	left outer join student_sido_tb sst on (sst.student_sido_id = sat.student_sido_id)
	left outer join student_sigungu_tb sgt on (sgt.student_sigungu_id = sat.student_sigungu_id);
    
    
    
select

	st.student name,
    st.student age
  
from
	student_tb st
	left outer join student_address_tb sat on (sat.student_address_id = st.student_id)
    ;
    

	