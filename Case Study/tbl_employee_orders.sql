INSERT INTO EmployeeOrders (OrderID, Sales, TotalQuantity, EmployeeName, Title, EmployeeCity, EmployeeCountry)
SELECT Orders.OrderID, 
	SUM(od.UnitPrice*Quantity) Sales,
	SUM(od.Quantity) TotalQuantity,
	em.FirstName+' '+em.LastName EmployeeName,
	em.Title,
	em.City EmployeeCity,
	em.Country EmployeeCountry
FROM Orders
LEFT JOIN Employees AS em ON Orders.EmployeeID=em.EmployeeID
LEFT JOIN [Order Details] AS od ON Orders.OrderID=od.OrderID
WHERE YEAR(Orders.OrderDate) = 1997
GROUP BY Orders.OrderID, 
	em.FirstName+' '+em.LastName, 
	em.Title,
	em.City,
	em.Country;