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
	count(employee.EmpID) as People,
	department.DeptName
from department
inner join employee
on employee.DeptID = department.DeptID 
group by employee.DeptID, department.DeptName
having count(employee.EmpID) < 3

/* Q3 */
select 
	count(employee.EmpID) as People,
	department.DeptName
from department
inner join employee
on employee.DeptID = department.DeptID 
group by employee.DeptID, department.DeptName

/* Q4 */
select 
	sum(employee.Salary) as TotalSalary,
	department.DeptName
from department
inner join employee
on employee.DeptID = department.DeptID 
group by employee.DeptID, department.DeptName