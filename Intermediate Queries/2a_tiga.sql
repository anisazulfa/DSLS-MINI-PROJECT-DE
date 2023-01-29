SELECT TOP(5) od.ProductID, pd.ProductName, SUM(od.Quantity) jumlah
FROM Orders
LEFT JOIN [Order Details] AS od ON Orders.OrderID=od.OrderID
LEFT JOIN Products AS pd ON od.ProductID=pd.ProductID
WHERE MONTH(OrderDate) = 1 
	AND YEAR(OrderDate) = 1997
GROUP BY od.ProductID, pd.ProductName
ORDER BY jumlah DESC;