--Inner join
Select 
e.id employeeid,
e.Name Full_Name,
e.Salary Salary,
p.Positions Position
from
employee_Table e Inner Join EmployeePost p On Name=Name;

--Left Join
select 
e.id employeeid,
e.Name FName,
p.Positions Position
from
employee_Table e left join EmployeePost p on Salary=Salary;
--Right Join
select 

e.id employeeid,
e.Name Name,
p.Positions Position,
from
employee_Table e right join EmployeePost p on Salary=Salary;

-- left join with where conditions
select
e.id employeeid,
e.Name FName,
p.Positions Position
from
employee_Table e left join EmployeePost p on Salary=Salary
where Salary >50000;

--Right Join with where Condition
select
e.id employeeid,
e.Name Name,
p.Positions Position,
e.Salary Emp_Salary
from
employee_Table e right join EmployeePost p on Salary=Salary
where Salary >40000;

-- Cross Join
select
Name,
City,
Salary,
Positions
from
employee_Table
Cross join  EmployeePost
order by Salary;

--Full Join
select
e.id ID,
e.Name Name,
p.Positions Position,
e.Salary Salary
from
employee_Table e full join EmployeePost p on Name=Name;
