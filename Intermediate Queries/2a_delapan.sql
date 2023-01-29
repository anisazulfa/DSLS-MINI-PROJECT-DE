CREATE VIEW InfoProdukView AS
SELECT Orders.OrderID,
	od.ProductID, 
	pd.ProductName, 
	od.UnitPrice, od.Quantity, 
	od.Discount, 
	(od.UnitPrice-od.Discount) AfterDicsount
FROM Orders
LEFT JOIN [Order Details] AS od ON Orders.OrderID=od.OrderID
LEFT JOIN Products AS pd ON od.ProductID=pd.ProductID;