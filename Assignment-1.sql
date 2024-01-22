select ProductID, ProductName, UnitPrice from Products where UnitPrice < 20.0000



select ProductID, ProductName, UnitPrice from Products where UnitPrice < 25.0000 and UnitPrice > 15.0000



select ProductName, UnitPrice from Products where UnitPrice > (select avg(UnitPrice) from Products)



select top 10 ProductName, UnitPrice 
from Products 
order by UnitPrice desc



select (count(ProductName)) as Discontinued from Products where Discontinued = 1
select (count(ProductName)) as Available from Products where Discontinued = 0



select ProductName, UnitsOnOrder, UnitsInStock from Products where UnitsOnOrder > UnitsInStock 