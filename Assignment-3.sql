/* Q1 */
select 
	max(employee.Salary) as MaxSalary,
    department.DeptName
from department
inner join employee
on employee.DeptID = department.DeptID 
group by employee.DeptID, department.DeptName;

/* Q2 */
select 
	department.DeptName,
	count(employee.EmployeeID) as NoOfPeople
from department
inner join employee
on employee.DeptID = department.DeptID 
/* where count(employee.EmployeeID) < 3 */
group by employee.DeptID, department.DeptName
having NoOfPeople < 3

