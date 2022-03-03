--------------------------------------------INDEXING-----------------------------------------
-----------------------------------Creating table of 1 lakh rows-----------------------------
create table IndexedData (id int identity (1,1) primary key, [Name] varchar(50), Email varchar(50), Department varchar(20))

SET NOCOUNT ON
DECLARE @Counter int = 1
While(@Counter <= 100000)
Begin 
	Declare @Name varchar(50) = 'ABC' + RTRIM(@Counter)
	Declare @Email varchar(50) = 'abc' + RTRIM(@Counter)+ '@bridgelabz.com'
	Declare @Department varchar(20) = 'Department' + RTRIM(@Counter)

	Insert into IndexedData Values (@Name,@Email,@Department)
	Set @Counter = @Counter +1
	if (@Counter%100000 =0)
	Print RTRIM(@Counter) + 'rows inserted'
	End
------------------------------------Clustered index--------------------------------------------
Select * from IndexedData where id =100531
Select * from employee_Table where id =24
	
----------------------------------Non Clustered index---------------------------------------
Select * from IndexedData Where Name ='ABC528'
---------------------------------Creating NonCluster Index-----------------------------------
Create NonClustered Index index2
ON employee_Table(Department)

Select * from employee_Table Where Department ='Back-End Developer  '
----------------------------------------DML Trigger------------------------------------------
CREATE TABLE TriggerTable 
(    
Id int IDENTITY,   
TriggerTable text   
)
select * from TriggerTable

CREATE TRIGGER InsertTrigger   
ON TriggerTable  
FOR INSERT  
AS  
BEGIN
  Declare @Id int
  SELECT @Id = Id from inserted  
  INSERT INTO TriggerTable 
  VALUES ('New employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is added at ' + CAST(Getdate() AS VARCHAR(22)))  
  END

  Insert into TriggerTable Values
  ('Arunesh'),
  ('Vikas');
  select * from TriggerTable
---------------------------------------new trigger-----------------------------
create TRIGGER InsertTrig
ON employee_Table  
FOR INSERT  
AS  
BEGIN
  Declare @id int
 
  SELECT @id = id from inserted  
  INSERT INTO  TriggerTable
  VALUES  ('New employee with Id = ' + CAST(@id AS VARCHAR(10)) + ' is added at ' + CAST(Getdate() AS VARCHAR(22)))    
  END

insert into employee_Table values ('Binod',25000,getdate(),'M','Agra','3','HR')
Select * from employee_Table
Select * from TriggerTable

---------------------------------------Drop trigger-------------------------------
DROP TRIGGER InsertTrig


-------------------------------Functions(Table valued functions)------------------

---------------------------------Built in Function DATENAME------------------------
SELECT Name, Datename(YEAR, StartDate) AS Start_YEAR
FROM employee_Table 

----------------------------------------User defined--------------------------------
SELECT
 Name,
  DATENAME(DW, StartDate)+ '-- '+
  DATENAME(DAY, StartDate)+ ' '+
  DATENAME(MONTH, StartDate) +'-- '+
  DATENAME(YEAR, StartDate) AS StartDate
FROM employee_Table

-------------------------------------User defined functons----------------------------

Alter FUNCTION getFormattedDate
 (
 @DateValue AS DATETIME
 )
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN
	  DATENAME(DW, @DateValue)+ '-'+
	  DATENAME(DAY, @DateValue)+ ' '+
	  DATENAME(MONTH, @DateValue) +'-'+
	  DATENAME(YEAR, @DateValue)
 
END
-------------------------------------Execution stmt----------------------------------
SELECT Name, [dbo].[getFormattedDate](StartDate) FROM employee_Table

-----------------------------------User defined functions-----------------------------
	CREATE FUNCTION GetTotalWorkingDays
(
    @DateFrom Date,
    @DateTo Date
)
RETURNS INT
AS
BEGIN
    DECLARE @TotDays INT= DATEDIFF(DAY, @DateFrom, @DateTo) + 1;
    DECLARE @TotWeeks INT= DATEDIFF(WEEK, @DateFrom, @DateTo) * 2;
    DECLARE @IsSunday INT= CASE
						 WHEN DATENAME(WEEKDAY, @DateFrom) = 'Sunday'
						 THEN 1
						 ELSE 0
					  END;
    DECLARE @IsSaturday INT= CASE
						   WHEN DATENAME(WEEKDAY, @DateTo) = 'Saturday'
						   THEN 1
						   ELSE 0
					    END;
    DECLARE @TotWorkingDays INT= @TotDays - @TotWeeks - @IsSunday + @IsSaturday;
    RETURN @TotWorkingDays;
END
--------------------------------------Execution stmt--------------------------------------
 select dbo.GetTotalWorkingDays('2021-01-01','2022-01-01') as Working_Days