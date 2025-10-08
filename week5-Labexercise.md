# APT1050A
## Week 5  Lab Test : Operators 
Run queries against tables in your own database using the operators OR, AND, BETWEEN, IN

#### i. To retrieve from the various tables or views all the records where:

##### a. Customer is based in one city or the other
```sql

-- Retrieving customers based on one city or the other using "OR"

SELECT *
FROM tCustomer
WHERE City = 'East Brisbane' OR City = 'Sydney'

-- Retrieving customers based on one city or the other using "IN"

SELECT *
FROM tCustomer
WHERE City IN ('East Brisbane', 'Sydney')


```
##### b. Orders created between certain dates.

```sql

SELECT *
FROM tOrder
WHERE OrderDate BETWEEN '2003-05-01' AND '2003-08-01';


```

###### -- Joining tables here. --
##### c. Customer is based in *East Brisbane* and has bought productID *753*

```sql

SELECT CustID, FirstName, LastName, city, tOrderDetail.ProductID
FROM tCust
INNER JOIN tOrder 
ON tCust.CustID = tOrder.CustomerID
INNER JOIN tOrderDetail
ON tOrder.SalesOrderID = tOrderDetail.SalesOrderID
WHERE City = 'Nairobi' AND tOrderDetail.ProductID = 1

```
##### d. Customer is based in either *East Brisbane* or *Goulburn* and has bought productID *753*
```sql

Select Distinct FirstName, LastName, City, tOrder.CustomerID, City, tOrderDetail.SalesOrderID, tOrderDetail.ProductID
From tOrder
INNER JOIN tOrderDetail
ON tOrder.SalesOrderID = tOrderDetail.SalesOrderID
INNER JOIN tCust
ON tOrder.CustomerID = tCust.CustId
INNER JOIN tProduct
ON tOrderDetail.ProductID = tproduct.ProductID
where (City = 'Nairobi' or City = 'Kisumu')
AND tOrderDetail.ProductID = 102

```
##### e. Orders for productIDs *751*, *752*, and *753* bought by customers living in the city of *Bellingham*.
```sql


SELECT tOrder.SalesOrderID, OrderDate, CustomerID, tProduct.ProductID
FROM tOrder
INNER JOIN tCust
ON tOrder.CustomerID = tCust.CustID

INNER JOIN tOrderdetail
ON tOrder.SalesOrderID = tOrderdetail.SalesOrderID

INNER JOIN tProduct
ON tOrderdetail.ProductID = tProduct.ProductID

WHERE 
    tCust.City = 'Dallas'
    AND tProduct.ProductID IN (420, 402, 404)

```
##### f. ProductID *751* was bought during *july 2015*

```sql

SELECT tORDERS.OrderID, ProductID, OrderDate

FROM tORDERS
INNER JOIN tORDER_ITEMS
ON tORDERS.OrderID = tORDER_ITEMS.OrderID
WHERE ProductID = 1010 and OrderDate = '2025-09-04'

```

#### ii. Use a subquery to return the orders records from.torder where the order quantity in torderdetail  is greater than 90. 

```sql

SELECT * FROM tOrder
WHERE SalesOrderID IN (SELECT SalesOrderID FROM tOrderDetail
                  WHERE OrderQty > 3)

```
