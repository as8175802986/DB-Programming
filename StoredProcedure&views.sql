-----------Stored procedure--------------------------
--Get All Data

EXEC SelectAllCustomers;

--Get data with name 
EXEC SelectAllEmployee @Name= 'Arunesh';
--Get data by city and salary
Exec EmployeeName_City @City= 'Lucknow',@Salary = 50000;
 --For delete the records by id
 create procedure DeleteByid	
(
 @id int
)
as
begin try
     Delete from employee_Table where id = @id
	 
end try
begin catch
select
		ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage

End catch

exec DeleteByid 16

--Update City Names 
exec TryChangeCityNames
exec TryChangeCityNames1
--Procedure to add new employee
CREATE PROC AddNewEmployes(
    @Name Varchar(20),
    @Salary float,
    @StartDate Date,
	@gender char(1),
	@City Char(50),
	@Experience Char(5),
	@Department Char(20)
) AS
BEGIN TRY
   
    Insert into employee_Table values (@Name,@Salary,@StartDate,@gender,@City,@Experience,@Department)

END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage
END CATCH

Exec AddNewEmployes @Name='Vikrant',@Salary=85000,@StartDate='2004-01-22',@gender='F',@City='Noida',@Experience='4',@Department='HR'
--Curd operations All in One 
CREATE PROC CURD_Operation(
    @id int=0,
    @Name Varchar(20)=null,
    @Salary float=null,
    @StartDate Date=null,
	@gender char(1)=null,
	@City Char(50)=null,
	@Experience Char(5)=null,
	@Department Char(20)=null,
	@Choice Varchar(100)
) AS
BEGIN TRY 
   SET NOCOUNT ON;
   if @choice ='Insert'
   begin 
    Insert into employee_Table values (@Name,@Salary,@StartDate,@gender,@City,@Experience,@Department)
	end
	if @choice = 'Update'
	begin
	Update employee_Table set
	Name=@Name,Salary=@Salary,StartDate=@StartDate,gender=@gender,City=@City,Experience=@Experience,Department=@Department where id=@id
	end
	if @Choice='Delete'
	begin
	Delete from employee_Table where id =@id
	end

END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage
END CATCH

Exec CURD_Operation @Name='Vikrant',@Salary=85000,@StartDate='2004-01-22',@gender='F',@City='Noida',@Experience='4',@Department='HR',@Choice='Insert'
Exec CURD_Operation @Name='Vikrant',@Salary=85000,@StartDate='2004-01-22',@gender='M',@City='Noida',@Experience='4',@Department='HR',@Choice='Update',@id=18
Exec CURD_Operation @Name='Vikas',@Salary=25000,@Experience='4',@Department='HR',@Choice='Update',@id=6
Exec CURD_Operation @id=18,@Choice='Delete'
EXEC SelectAllCustomers;





/*Create View Statement */
select * from [NoidaEmployee]

select * from [NoidaEmployeeCity]

create view employee as select Name,City from employee_Table;
select * from emp
select * from sys.views
--Rename views
exec sp_rename 'employee','emp'
DROP VIEW IF EXISTS EmpCityview;

