-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT ProductName, CategoryName FROM ProductDetails_V;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT "Order".Id, Shipper.CompanyName, "Order".OrderDate
FROM "Order" JOIN Shipper WHERE "Order".OrderDate < "2012-08-09"
GROUP BY "Order".Id


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName, OrderDetail.Quantity
FROM OrderDetail JOIN Product ON OrderDetail.ProductId = Product.Id
WHERE OrderDetail.OrderId = "10251"
GROUP BY Product.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT "Order".Id AS "OrderID", "Order".ShipName as "Company Name", Employee.LastName
FROM "Order"
JOIN Employee ON "Order".EmployeeId = Employee.Id
