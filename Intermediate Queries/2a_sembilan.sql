CREATE PROCEDURE MakeInvoiceByCust
	@CustomerID nvarchar(20)
AS
SELECT 
	@CustomerID CustomerID, 
	cs.CompanyName, 
	OrderID, 
	OrderDate, 
	RequiredDate, 
	ShippedDate
FROM Orders
LEFT JOIN Customers AS cs ON Orders.CustomerID=cs.CustomerID
WHERE cs.CustomerID=@CustomerID;
