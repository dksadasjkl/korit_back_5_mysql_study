create view USER_VIEW as
SELECT
	USER_ID,
    USERNAME,
    PASSWORD,
    NAME,
    EMAIL
FROM
    USER_TB
where
    USER_ID BETWEEN 1 AND 200;
    
insert into
	USER_VIEW
values
	(0, 'asd', 010, 'asd', 'sad'),
    (0, 'ads', 010, 'asd', 'sad'),
    (0, 'ssd', 010, 'asd', 'sad'),
    (0, 'ssd', 010, 'asd', 'sad');
    
    
select
	*
from
	USER_VIEW
where
	USERNAME like 'a%';