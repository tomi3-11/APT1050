
-- (ii). Week five assignment.
SELECT * FROM tOrder
WHERE OrderID IN (SELECT OrderID FROM tOrderdetail
                  WHERE OrderQty > 90)


-- (e).
SELECT SalesOrderID, OrderDate, CustomerID, ProductID
FROM tOrder
INNER JOIN tCust
ON tOrder.tCustomerID = tCust.tCustID

INNER JOIN tOrderdetail
ON tOrder.SalesOrderID = tOrderdetail.SalesOrderID

INNER JOIN tProduct
ON tOrderdetail.ProductID = tProduct.ProductID

WHERE 
    tCust.City = 'Bellingham'
    AND tProduct.ProductID IN (751, 752, 753)