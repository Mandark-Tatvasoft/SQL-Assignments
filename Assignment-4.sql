/* Q2 */
CREATE procedure [dbo].[SalesByCountry]
as
begin
	select
		Orders.ShipCountry as country,
		sum( [Order Details].UnitPrice * [Order Details].Quantity ) as TotalSales
	from [Order Details]
	inner join Orders
	on [Order Details].OrderID = Orders.OrderID
	group by Orders.ShipCountry
	order by Orders.ShipCountry asc;
end










/* Q3 */
CREATE procedure [dbo].[SalesByYear]
as
begin
	select 
		year(Orders.OrderDate) as "Year",
		sum( [Order Details].UnitPrice * [Order Details].Quantity ) as TotalSales
	from [Order Details]
	inner join Orders
	on [Order Details].OrderID = Orders.OrderID
	group by year(Orders.OrderDate);
end









/* Q4 */
CREATE procedure [dbo].[SalesByCategories]
as
begin
	select 
		Categories.CategoryName,
		sum( [Order Details].UnitPrice * [Order Details].Quantity ) as TotalSales
	from [Order Details]
	inner join Products
	on [Order Details].ProductID = Products.ProductID
	inner join Categories
	on Products.CategoryID = Categories.CategoryID
	group by Categories.CategoryID, Categories.CategoryName;
end









/* Q5 */
CREATE procedure [dbo].[Top10ExpensiveProducts]
as
begin
	select top 10 *
	from Products
	order by UnitPrice desc
end







/* Q6 */
CREATE PROCEDURE InsertOrderDetails 
	@O_id int,
	@C_id nchar(5),
	@P_id int,
	@E_id int,
	@O_date datetime,
	@O_rdate datetime,
	@O_sdate datetime,
	@O_shipvia int,
	@O_freight money,
	@S_shipname nvarchar(40),
	@S_shipaddress nvarchar(60),
	@S_shipcity nvarchar(15),
	@S_shipregion nvarchar(15),
	@S_shippostalcode nvarchar(10),
	@S_shipcountry nvarchar(15),
	@O_UnitPrice money,
	@O_quantity smallint,
	@O_discount real
	
AS
BEGIN
	INSERT INTO "Orders"
		( "OrderID", "CustomerID", "EmployeeID", "OrderDate", "RequiredDate", "ShippedDate", "ShipVia", "Freight", "ShipName", "ShipAddress", "ShipCity", "ShipRegion", "ShipPostalCode", "ShipCountry" )
	VALUES 
		( @O_id, @C_id, @E_id, @O_date, @O_rdate, @O_sdate,	@O_shipvia,	@O_freight,	@S_shipname, @S_shipaddress, @S_shipcity, @S_shipregion, @S_shippostalcode, @S_shipcountry )

	
	
	INSERT INTO "Order Details"
		( "OrderID", "ProductID", "UnitPrice", "Quantity", "Discount" )
	VALUES
		( @O_id, @P_id, @O_UnitPrice, @O_quantity, @O_discount )
END
GO








/* Q7 */
ALTER PROCEDURE UpdateOrderDetails 
	@O_id int,
	@C_id nchar(5) ,
	@P_id int,
	@E_id int,
	@O_date datetime,
	@O_rdate datetime,
	@O_sdate datetime,
	@O_shipvia int,
	@O_freight money,
	@S_shipname nvarchar(40),
	@S_shipaddress nvarchar(60),
	@S_shipcity nvarchar(15),
	@S_shipregion nvarchar(15),
	@S_shippostalcode nvarchar(10),
	@S_shipcountry nvarchar(15),
	@O_quantity smallint,
	@O_discount real
	
AS
BEGIN
	UPDATE "Orders"
		SET  
			"CustomerID" = @C_id, 
			"EmployeeID" = @E_id, 
			"OrderDate" = @O_date, 
			"RequiredDate" = @O_rdate, 
			"ShippedDate" = @O_sdate, 
			"ShipVia" = @O_shipvia, 
			"Freight" = @O_freight, 
			"ShipName" = @S_shipname, 
			"ShipAddress" = @S_shipaddress, 
			"ShipCity" = @S_shipcity, 
			"ShipRegion" = @S_shipregion, 
			"ShipPostalCode" = @S_shippostalcode, 
			"ShipCountry" = @S_shipcountry
	WHERE "OrderID" = @O_id 
	
	UPDATE "Order Details"
		SET
			"ProductID" = @P_id,
			"Quantity" = @O_quantity, 
			"Discount" = @O_discount
	WHERE "OrderID" = @O_id
END
GO
