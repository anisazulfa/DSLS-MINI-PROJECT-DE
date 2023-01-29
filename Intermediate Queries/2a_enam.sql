WITH pembelian_customer AS(
	SELECT Orders.OrderID, cs.CompanyName, SUM(od.UnitPrice*od.Quantity) pembelian
	FROM Orders 
	LEFT JOIN Customers AS cs ON Orders.CustomerID=cs.CustomerID
	LEFT JOIN [Order Details] AS od ON Orders.OrderID=od.OrderID
	WHERE YEAR(OrderDate) = 1997
	GROUP BY Orders.OrderID, cs.CompanyName
	HAVING SUM(od.UnitPrice*od.Quantity) > 500
)
SELECT DISTINCT(CompanyName) 
FROM pembelian_customer;