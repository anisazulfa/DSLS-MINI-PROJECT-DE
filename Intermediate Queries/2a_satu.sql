SELECT MONTH(OrderDate) Bulan, 
	COUNT(CustomerID) jumlah_customer
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY MONTH(OrderDate);