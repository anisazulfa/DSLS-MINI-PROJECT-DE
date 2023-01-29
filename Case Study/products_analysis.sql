WITH sales_prod AS (SELECT MonthID,
		SUM(Quantity) Quantity,
		UnitPrice,
		ProductName,
		CategoryName,
		ROW_NUMBER() OVER (PARTITION BY MonthID ORDER BY SUM(Quantity) DESC) AS 'unit_rank'
	FROM ProductCategory 
	GROUP BY MonthID, UnitPrice, ProductName, CategoryName
)
SELECT MonthID, 
	UnitPrice, 
	Quantity, 
	ProductName, 
	CategoryName
FROM sales_prod
WHERE unit_rank = 1;


WITH price_prod AS (SELECT MIN(UnitPrice) UnitPrice, 
	CategoryName, 
	ProductName,		
	ROW_NUMBER() OVER (PARTITION BY CategoryName ORDER BY MIN(UnitPrice) ASC) AS 'unit_rank'
FROM ProductCategory
GROUP BY CategoryName, ProductName
)
SELECT UnitPrice,  
	ProductName,
	CategoryName
FROM price_prod
WHERE unit_rank = 1;

