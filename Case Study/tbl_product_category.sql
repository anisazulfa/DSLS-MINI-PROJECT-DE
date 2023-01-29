INSERT INTO ProductCategory (MonthID, Quantity, ProductName, UnitPrice, QuantityPerUnit, CategoryName)
SELECT MONTH(Orders.OrderDate) MonthID, 
	SUM(od.Quantity) Quantity,
	pd.ProductName,
	od.UnitPrice,
	pd.QuantityPerUnit,
	ct.CategoryName
FROM Orders
LEFT JOIN [Order Details] AS od ON Orders.OrderID=od.OrderID
LEFT JOIN Products AS pd ON od.ProductID=pd.ProductID
LEFT JOIN Categories AS ct ON pd.CategoryID=ct.CategoryID
WHERE YEAR(Orders.OrderDate) = 1997
GROUP BY MONTH(Orders.OrderDate), 
	pd.ProductName, 
	od.UnitPrice,
	pd.QuantityPerUnit, 
	ct.CategoryName;