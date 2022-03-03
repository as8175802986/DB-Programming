----------------------------------------Transactions----------------------------------------
-------------------------------Auto Commit Transaction by default--------------------------- 

Select * from employee_Table
Exec CURD_Operation @Name='JHxsad',@Salary=85000,@StartDate='2020-01-22',@gender='F',@City='Mumbai',@Experience='4',@Department='HR',@Choice='Insert'

Exec CURD_Operation @Name='Vikrant',@Salary=85000,@StartDate='2004-01-22',@gender='M',@City='Noida',@Experience='4',@Department='HR',@Choice='Update',@id=13

Exec CURD_Operation @id=28,@Choice='Delete'
select @@TRANCOUNT

-------------------------------------Implicit Transaction ON------------------------------ 
set IMPLICIT_TRANSACTIONS on
--Select * from employee_Table
Exec CURD_Operation @Name='Nidhi',@Salary=38000,@StartDate='2020-01-22',@gender='F',@City='Mumbai',@Experience='7',@Department='HR',@Choice='Insert'

Exec CURD_Operation @Name='Joy',@Salary=85000,@StartDate='2004-01-22',@gender='M',@City='Noida',@Experience='4',@Department='HR',@Choice='Update',@id=13

Exec CURD_Operation @id=26,@Choice='Delete'
select @@TRANCOUNT as OpenTransactions
--ROLLBACK
--COMMIT
select @@TRANCOUNT as OpenTransactions
Declare @Select int; 
set @Select=0;
if @Select=1
Begin
	COMMIT
end
else
Begin
	ROLLBACK
end

-----------------------------------EXPLICIT TRANSACTIONS-----------------------------
Begin TRANSACTION 
--Select * from employee_Table
Exec CURD_Operation @Name='Adarsh',@Salary=90000,@StartDate='2020-01-22',@gender='M',@City='Mumbai',@Experience='7',@Department='HR',@Choice='Insert'

Exec CURD_Operation @Name='Joy',@Salary=85000,@StartDate='2004-01-22',@gender='M',@City='Delhi',@Experience='4',@Department='HR',@Choice='Update',@id=13

Exec CURD_Operation @id=24,@Choice='Delete'

Declare @Sel int; 
set @Sel=0;
if @Sel=1
Begin
	COMMIT
end
else
Begin
	ROLLBACK
end
--------------------------------------Savepoint Command--------------------------------
--------------------------used for partial commit & partial Rollback-------------------
Begin Transaction
Exec CURD_Operation @Name='Anshu',@Salary=90000,@StartDate='2020-01-22',@gender='M',@City='Pune',@Experience='1',@Department='Back-End Developer  ',@Choice='Insert'
Save Transaction DeletePoint
	Exec CURD_Operation @id=24,@Choice='Delete'
	Exec CURD_Operation @id=25,@Choice='Delete'
	Exec CURD_Operation @id=31,@Choice='Delete'
Rollback Transaction DeletePoint
Commit