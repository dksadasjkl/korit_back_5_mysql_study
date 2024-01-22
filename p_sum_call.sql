set @count = 0;

call p_sum(10, 20, @result, @count);

select
	@count,
    @result;