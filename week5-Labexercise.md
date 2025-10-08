# APT1050A
## Week 5  Lab Test : Operators 
Run queries against tables in your own database using the operators OR, AND, BETWEEN, IN

#### i. To retrieve from the various tables or views all the records where:

##### a. 
##### b. 

###### -- Joining tables here. --
##### c. 
##### d. 
##### e. 
##### f. 
```sql

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

```

#### ii. Use a subquery to return the orders records from.torder where the order quantity in torderdetail  is greater than 90. 

```sql

SELECT * FROM tOrder
WHERE OrderID IN (SELECT OrderID FROM tOrderdetail
                  WHERE OrderQty > 90)

```
