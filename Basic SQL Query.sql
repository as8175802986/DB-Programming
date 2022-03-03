Select * from employee_Table
--Display particular column in table 
select Name from employee_Table
--Select stmt with condition
Select * from employee_Table Where City='Noida';

--fetching details of City Noida ,Name 
select Name, Salary from employee_Table WHERE City = 'Delhi'

--Count-
select count (City) as TotalCities from employee_Table;

--Sorting DAta
-- Fetching the details by address (shows Coloumn by) Descending Order
select * from employee_Table where City = 'Noida' order by Name Desc

--Ascending Order
select * from employee_Table where City = 'Agra' order by Name

select City,Salary from employee_Table order by Name

-- adding table to the database
Alter Table employee_Table Add Experience Char(5);

--uppdate Gender One By one

Update employee_Table set Experience = '1' where Name='Arunesh';
Update employee_Table set Experience = '2' where Name='Harsh';
Update employee_Table set Experience = '3' where Name='Sarthak';
Update employee_Table set Experience = '5' where Name='Dablu';
Update employee_Table set Experience = '5' where Name='Rohan';
Update employee_Table set Experience = '1' where Name='vikas';
Update employee_Table set Experience = '2' where Name='Ronny';
Update employee_Table set Experience = '1' where Name='Ram';
Update employee_Table set Experience = '3' where Name='Ankit';
Update employee_Table set Experience = '1' where Name='Johny';
Update employee_Table set Experience = '5' where Name='Anshu';
-- Update Contact with Name
Update employee_Table set Name = 'Anirudh' where Name = 'Ankit'
 
--Study
select Name,City ,gender from employee_Table order by Salary OffSet 1 Rows;
-- Delete Particular Data
Delete from employee_Table Where Name = 'Vikas' 

-- Select TOP rows
select TOP 5 Name,Salary from employee_Table order by Salary desc
select Top 30 Percent Name,Salary from employee_Table order by Salary
select Top 5 with ties Name,Salary from employee_Table order by Salary desc
--Distinct (duplicate values not allowed)
select Distinct City from employee_Table order by City

select * from employee_Table where Salary >50000
select Name,Salary from employee_Table where Salary >=35000 order by Salary asc
select Name,Salary from employee_Table where Salary >= 40000 and Gender ='M' order by Salary desc
select Name,Salary,City from employee_Table where Salary between 30000  and 50000 order by Salary

--Update multiple row with a single command 
Alter Table employee_Table Add Department Char(20);
Update employee_Table set Department ='HR' where id in(3,6,7,10);
Update employee_Table set Department ='Back-End Developer' where id in(1,4,8,11);
Update employee_Table set Department ='Full-Stack Developer' where id in(2,5,9,12);

--Using Or Operator
SELECT
    Name,
    Salary
FROM
    employee_Table
WHERE
    Salary < 60000
OR Salary > 60000
ORDER BY
    Salary;

--Create new Table
create Table EmployeePost(
Id int Identity(1,1) Primary Key,
Positions varchar(50)
);

select * from EmployeePost

--Insert into table
Insert into EmployeePost values
('Software Engineer'),('Project Manager'),('Project Lead'),('Software Developer'),('Junior Developer'),('Senior HR'),('Intern ');

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
