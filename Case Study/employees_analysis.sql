WITH order_hist AS(SELECT COUNT(OrderID) TotalOrder,
	SUM(TotalQuantity) TotalQuantity,
	SUM(Sales) TotalSales,
	EmployeeName,
	Title,
	EmployeeCity, 
	EmployeeCountry
	FROM EmployeeOrders
	GROUP BY EmployeeName, Title, EmployeeCity, EmployeeCountry
)
SELECT *
FROM order_hist
ORDER BY TotalOrder DESC;