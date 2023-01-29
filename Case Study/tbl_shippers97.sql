INSERT INTO Shippers97 (OrderID, OrderDate, RequiredDate, ShippedDate, ShipCity, ShipCountry, CompanyName)
SELECT OrderID, 
	OrderDate, 
	RequiredDate, 
	ShippedDate, 
	ShipCity, 
	ShipCountry, 
	CompanyName
FROM Orders
LEFT JOIN Shippers AS sp ON Orders.ShipVia=sp.ShipperID
WHERE YEAR(OrderDate) = 1997;