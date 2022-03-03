--Using In operator
--Order By
select id,City,Name from employee_Table where id in (2,7,4,10) order by id;
--Group By
select id,Name,City from employee_Table where id in(1,5,7,9,11) group by id,Name,City order by id;
--IN Between Operator
SELECT
    id,
    Name,
    Salary,
    Experience
FROM
    employee_Table
WHERE
    Experience  BETWEEN '2' AND '5'
ORDER BY
    Experience;

-- coloumn and Table Aliases(Add two columns and rename it)
select Name +''+ Experience as 'Full Name' from employee_Table order by Name
--Begin And end stmts -----
BEGIN
    SELECT
        Name,
        Salary
    FROM
        employee_Table
    WHERE
        Salary > 80000;

    IF @@ROWCOUNT = 0
        PRINT 'No employee with Salary greater than 80000 found';
END
--Nested Begin & end stmt 
BEGIN
    DECLARE @Name VARCHAR(MAX);

    SELECT TOP 1
        @Name = Name
    FROM
        employee_Table
    ORDER BY
        Salary DESC;
    
    IF @@ROWCOUNT <> 0
    BEGIN
        PRINT 'The Highest Paid Employee is ' + @Name
    END
    ELSE
    BEGIN
        PRINT 'No Employee data  found';
    END;
END
