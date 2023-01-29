SELECT TOP(1) FirstName+' '+LastName nama_employee, SUM(Quantity*od.UnitPrice) total_sales
FROM Orders
LEFT JOIN Employees AS em ON em.EmployeeID = Orders.EmployeeID
LEFT JOIN [Order Details] AS od ON Orders.OrderID = od.OrderID
GROUP BY FirstName, LastName
ORDER BY total_sales DESC;