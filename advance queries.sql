-- Using Case and when functions 

Select  Firstname, age, LastName,
Case
	When age > 30 THen 'old'
	WHEN AGE BETWEEN 27 AND 30 thEN 'YOUNG'
	Else 'baby'
end AS PERE
From EmployeeDemographics AS ed
where age is not null
order by Age


-- Creating CTE

With CTE_Employee as
(select EmployeeID, JobTitle, Salary
 from dbo.EmployeeSalary
 where Salary > 45000)

Select *
From CTE_Employee

--Using Temp Tables
Create Table #temp_employee (
employeeID int,
jobtitle varchar(100),
Salary int
)

INSERT INTO  #temp_employee 
select *
from EmployeeSalary

Create Table #temp_employee2 ( 
jobtitle varchar(50),
employeesPerjob int,
AvgAge int,
AvgSalary int)

Insert INTO #temp_employee2
select jobtitle, Count(jobtitle), AVg(age), AVG(salary)
From dbo.EmployeeDemographics as ed
Join dbo.EmployeeSalary as es
On ed.EmployeeID = es.EmployeeID
group by JobTitle

select *
From #temp_employee2

-- using Subqueries 

--In select clause

Select employeeID, Salary, (Select AVG(Salary)From EmployeeSalary) as AllAvgSalary
From EmployeeSalary

--IN From clause

Select employeeID, Salary, AVG(Salary) over () as AllAvgSalary
From EmployeeSalary

Select a.EmployeeID, AllAvgSalary
From (Select employeeID, Salary, AVG(Salary) over () as AllAvgSalary
	  From EmployeeSalary) a

--in Where Clause

Select employeeID, Salary, JobTitle
From EmployeeSalary
Where EmployeeID in( 
	  Select EmployeeID
	  From employeedemographics
	  where Age >30 )