WITH pembelian_orderid AS(
	SELECT Orders.OrderID, SUM(od.UnitPrice*od.Quantity) pembelian
	FROM Orders 
	LEFT JOIN [Order Details] AS od ON Orders.OrderID=od.OrderID
	GROUP BY Orders.OrderID
)
SELECT COUNT(CASE WHEN pembelian <= 100 THEN OrderID END) '>500',
	COUNT(CASE WHEN pembelian > 100 AND pembelian <= 250 THEN OrderID END) '100<x<=200',
	COUNT(CASE WHEN pembelian > 250 AND pembelian <= 500 THEN OrderID END) '250<x<=500',
	COUNT(CASE WHEN pembelian > 500 THEN OrderID END) '>500'
FROM pembelian_orderid;