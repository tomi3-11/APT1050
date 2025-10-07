
SELECT SalesOrderID, OrderDate, tOrder.CustomerID, FirstName, LastName, City  
FROM tOrder

INNER JOIN tCust

ON tOrder.CustomerID = tCust.CustID

WHERE tOrder.CustomerID = 5

--ORDER BY OrderDate desc



--SELECT * FROM tCust

SELECT tProduct.ProductID, ProductName, CustomerID, CustID, City 

FROM tCust

INNER JOIN tOrder
ON tCust.CustID = tOrder.CustomerID

INNER JOIN tOrderDetail
ON tOrder.SalesOrderID = tOrderDetail.SalesOrderID

INNER JOIN tProduct
ON tOrderDetail.ProductID = tProduct.ProductID 

WHERE City = 'Seattle';