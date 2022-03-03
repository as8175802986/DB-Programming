/* cursors */
DECLARE 
    @Name VARCHAR(20), 
    @Salary float;

DECLARE cursor_employee CURSOR
FOR SELECT 
        Name, 
        Salary
    FROM 
        employee_Table;

OPEN cursor_employee;
FETCH NEXT FROM cursor_employee INTO 
    @Name, 
    @Salary;

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @Name +'-'+ CAST(@Salary AS varchar);
        FETCH NEXT FROM cursor_employee INTO 
            @Name, 
            @Salary;
    END;

	CLOSE cursor_employee;
	DEALLOCATE cursor_employee;
