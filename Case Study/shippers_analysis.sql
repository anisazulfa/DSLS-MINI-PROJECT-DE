SELECT COUNT(OrderID) TotalLate,
	CompanyName
FROM Shippers97
WHERE ShippedDate > RequiredDate
GROUP BY CompanyName
ORDER BY COUNT(OrderID) DESC;

SELECT COUNT(OrderID) TotalOrder,
	CompanyName
FROM Shippers97
GROUP BY CompanyName
ORDER BY COUNT(OrderID) DESC;

SELECT COUNT(OrderID) TotalOrder,
	ShipCity,
	ShipCountry,
	CompanyName
FROM Shippers97
GROUP BY ShipCity, ShipCountry, CompanyName
ORDER BY COUNT(OrderID) DESC;

