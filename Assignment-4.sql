/* Q2 */
create procedure `SalesByCountry` ()
begin
	select
		orders.ShipCountry as country,
		sum( orderdetails.UnitPrice * orderdetails.Quantity ) as TotalSales
	from orderdetails
	inner join orders
	on orderdetails.OrderID = orders.OrderID
	group by orders.ShipCountry
	order by orders.ShipCountry asc;
end

/* Q3 */
create procedure `SalesByYear` ()
begin
	select 
		year(orders.OrderDate) as "Year",
		sum( orderdetails.UnitPrice * orderdetails.Quantity ) as TotalSales
	from orderdetails
	inner join orders
	on orderdetails.OrderID = orders.OrderID
	group by year(orders.OrderDate);
end


/* Q4 */
create procedure `SalesByCategories` ()
begin
	select 
		categories.CategoryName,
		sum( orderdetails.UnitPrice * orderdetails.Quantity ) as TotalSales
	from orderdetails
	inner join products
	on orderdetails.ProductID = products.ProductID
	inner join categories
	on products.CategoryID = categories.CategoryID
	group by categories.CategoryID;
end




/* Q5 */
create procedure 'Top10ExpensiveProducts' ()
begin
	select *
	from products
	order by UnitPrice desc
	limit 10;
end