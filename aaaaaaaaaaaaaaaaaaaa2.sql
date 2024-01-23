CREATE DEFINER=`aws`@`%` PROCEDURE `p_get_auto_increment`(
	in v_schema_name varchar(100),
    in v_table_name varchar(100),
    out v_auto_increment int
)
BEGIN
	 select
		auto_increment into v_auto_increment
	from
		information_schema.tables
	where
		table_schema = 'v_schema_name'
        and table_name = 'v_table_name';
END