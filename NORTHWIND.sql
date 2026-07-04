                                             --Business Overview

 --1 How many customers does the company have? 
 SELECT 
       COUNT ( DISTINCT(CustomerID)) AS Total_Customers
 FROM Customers
 --2 How many products are available?
 SELECT COUNT(*) AS Total_Products
 FROM Products
 
 --3 How many orders have been placed?
 SELECT
       COUNT ( DISTINCT(OrderID)) AS Total_Orders
 FROM Orders
 --4 How many suppliers work with the company?
 SELECT 
       COUNT ( DISTINCT(SupplierID)) AS Total_Suppliers
 FROM Suppliers
 --5 How many categories are available?
 SELECT 
       COUNT ( DISTINCT(CategoryID)) AS Total_Categories
 FROM Categories
                              
                                            --Sales Analysis

--6 What is the total revenue generated?
SELECT 
      SUM(UnitPrice * Quantity) AS Total_Revenue
FROM OrderDetails
--7 What is the average order value?
SELECT 
       AVG(UnitPrice * Quantity) AS Avg_OrderValue
FROM OrderDetails

--8 Which order generated the highest revenue?
SELECT 
      orderID,SUM(UnitPrice * Quantity) AS Sales
FROM OrderDetails
GROUP BY OrderID
ORDER BY Sales DESC

--9 Which month generated the highest sales?
SELECT MONTH(Orderdate) AS Month,SUM(UnitPrice * Quantity) AS Sales
FROM OrderDetails od
INNER JOIN Orders o
ON od.OrderID=o.OrderID
GROUP BY MONTH(Orderdate)
ORDER BY Sales DESC

--10 Which year generated the highest sales?
SELECT YEAR(Orderdate) AS Year,SUM(UnitPrice * Quantity) AS Sales
FROM OrderDetails od
INNER JOIN Orders o
ON od.OrderID=o.OrderID
GROUP BY YEAR(Orderdate)
ORDER BY Sales DESC
                          
                                           --Product Analysis

--11 What are the Top 10 best-selling products?
;WITH Best_sells AS
(SELECT p.ProductID, ProductName,SUM(Quantity) AS Total_Quantity
FROM Products p
INNER JOIN OrderDetails od
ON p.ProductID=od.ProductID
GROUP BY p.ProductID, ProductName)
SELECT TOP 10 *,
       ROW_NUMBER()over(ORDER BY Total_Quantity DESC) AS Ranking
FROM Best_sells

--12 Which products generated the highest revenue?
SELECT TOP 10 ProductName,UnitPrice
FROM Products
ORDER BY UnitPrice DESC

--13 Which products have been never ordered?
SELECT od.ProductID, p.ProductName
FROM OrderDetails od
LEFT JOIN Products p
ON od.ProductID=p.ProductID
WHERE od.ProductID IS NULL

--14 Which products are runnig out of stock?
SELECT ProductID, ProductName, UnitsInStock 
FROM Products
WHERE UnitsInStock <10
ORDER BY UnitsInStock

--15 Which category generates the highest revenue? 
SELECT p.CategoryID,c.CategoryName,SUM(od.UnitPrice * od.Quantity) AS Revenue
FROM Products p
JOIN OrderDetails od
ON p.ProductID=od.ProductID
JOIN Categories c
ON p.CategoryID=c.CategoryID
GROUP BY p.CategoryID,c.CategoryName
ORDER BY Revenue DESC

                                              --Customer Analysis

--16 Who are the Top 10 customers by revenue?
SELECT TOP 10 c.CustomerID,c.CompanyName,SUM(od.UnitPrice * od.Quantity) Revenue
from OrderDetails od
JOIN Orders o
ON o.OrderID=od.OrderID
JOIN Customers c
ON o.CustomerID=c.CustomerID
GROUP BY c.CustomerID,c.CompanyName
ORDER BY Revenue DESC

--17 Which customers placed the most orders?
SELECT  c.CustomerID,c.CompanyName,SUM(od.Quantity) Quantity
from OrderDetails od
JOIN Orders o
ON o.OrderID=od.OrderID
JOIN Customers c
ON o.CustomerID=c.CustomerID
GROUP BY c.CustomerID,c.CompanyName
ORDER BY Quantity DESC

--18 Which countries generate the highest revenue?
SELECT TOP 10 c.Country,SUM(od.UnitPrice * od.Quantity) Revenue
from OrderDetails od
JOIN Orders o
ON o.OrderID=od.OrderID
JOIN Customers c
ON o.CustomerID=c.CustomerID
GROUP BY c.Country
ORDER BY Revenue DESC

--19 Which customer have never placed an order?
SELECT  c.CustomerID,c.CompanyName,SUM(od.Quantity) Quantity
from OrderDetails od
JOIN Orders o
ON o.OrderID=od.OrderID
JOIN Customers c
ON o.CustomerID=c.CustomerID
WHERE Quantity IS NULL
GROUP BY c.CustomerID,c.CompanyName

                                                 --Employee Analysis
                                                  
--20 Which employee handled the most orders?
SELECT  e.EmployeeID,e.LastName,e.FirstName,SUM(od.Quantity) Quantity
from OrderDetails od
JOIN Orders o
ON o.OrderID=od.OrderID
JOIN Employees e
ON e.EmployeeID=o.EmployeeID
GROUP BY  e.EmployeeID,e.LastName,e.FirstName
ORDER BY Quantity DESC

--21 Which employee generated the highest revenue?
SELECT  e.EmployeeID,e.LastName,e.FirstName,SUM(od.UnitPrice * od.Quantity) Revenue
from OrderDetails od
JOIN Orders o
ON o.OrderID=od.OrderID
JOIN Employees e
ON e.EmployeeID=o.EmployeeID
GROUP BY  e.EmployeeID,e.LastName,e.FirstName
ORDER BY Revenue DESC

                                               --Shipping Analysis

--22 Which shipper (shipping company) delivered the most orders?
SELECT s.ShipperID, s.CompanyName Shipper,COUNT(DISTINCT(o.OrderID)) Delever
FROM  Orders o
JOIN Shippers s
ON s.ShipperID=o.ShipVia
GROUP BY s.ShipperID, s.CompanyName
ORDER BY Delever DESC

--23 What is the average shipping time by shipper?
SELECT s.ShipperID, s.CompanyName Shipper,
        
       AVG(DATEDIFF(DAY,OrderDate,ShippedDate)) AS AvgShippingDays
FROM  Orders o
JOIN Shippers s
ON s.ShipperID=o.ShipVia
GROUP BY s.ShipperID,s.CompanyName
ORDER BY s.ShipperID

--24 What is the average freight cost by shipper?
SELECT s.ShipperID, s.CompanyName Shipper,AVG(o.Freight) AvgFreightCost
FROM  Orders o
JOIN Shippers s
ON s.ShipperID=o.ShipVia
GROUP BY s.ShipperID,s.CompanyName


--25 Products revenue classification
;WITH Class AS
(
SELECT od.ProductID, p.ProductName,SUM(od.UnitPrice*Quantity) TotalRevenue
FROM OrderDetails od
JOIN Products p
ON od.ProductID=p.ProductID
GROUP BY od.ProductID, p.ProductName

)
SELECT *,
CASE
    WHEN TotalRevenue BETWEEN 80000 AND 150000 THEN 'High Revenue'
    WHEN TotalRevenue BETWEEN 17000 AND 79999 THEN 'Medium Revenue'
    WHEN TotalRevenue <17000 THEN 'Low Revenue'
    Else 'N/A'

END Status
FROM Class





