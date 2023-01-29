SELECT cs.CustomerID, cs.CompanyName, pd.ProductName
FROM Orders 
LEFT JOIN Customers AS cs ON Orders.CustomerID=cs.CustomerID
LEFT JOIN [Order Details] AS od ON Orders.OrderID=od.OrderID
LEFT JOIN Products AS pd ON od.ProductID=pd.ProductID
WHERE pd.ProductName = 'Chai';