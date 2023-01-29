WITH sales_prod AS (SELECT pd.ProductName, 
		MONTH(OrderDate) bulan, 
		SUM(od.UnitPrice*od.Quantity) sales,
		ROW_NUMBER() OVER (PARTITION BY MONTH(OrderDate) ORDER BY SUM(od.UnitPrice*od.Quantity) DESC) AS 'unit_rank'
	FROM Orders 
	LEFT JOIN [Order Details] AS od ON Orders.OrderID=od.OrderID
	LEFT JOIN Products AS pd ON od.ProductID=pd.ProductID
	WHERE YEAR(OrderDate) = 1997
	GROUP BY  pd.ProductName, MONTH(OrderDate)
)
SELECT bulan, ProductName
FROM sales_prod
WHERE unit_rank <= 5;
