-- 1. Top 10 Selling Products

SELECT
    p.ProductName,
    SUM(od.Quantity) AS Total_Quantity_Sold
FROM Products p
JOIN "Order Details" od
ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;


-- 2. Top 10 Customers by Revenue

SELECT
    c.CompanyName,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS Revenue
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN "Order Details" od
ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
ORDER BY Revenue DESC
LIMIT 10;


-- 3. Monthly Sales Trends

SELECT
    strftime('%Y-%m', o.OrderDate) AS Month,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS MonthlySales
FROM Orders o
JOIN "Order Details" od
ON o.OrderID = od.OrderID
GROUP BY Month
ORDER BY Month;


-- 4. Best-Performing Product Categories

SELECT
    c.CategoryName,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS Revenue
FROM Categories c
JOIN Products p
ON c.CategoryID = p.CategoryID
JOIN "Order Details" od
ON p.ProductID = od.ProductID
GROUP BY c.CategoryID
ORDER BY Revenue DESC;


-- 5. Customer Purchase Frequency

SELECT
    c.CompanyName,
    COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
ORDER BY NumberOfOrders DESC;
