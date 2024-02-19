USE Northwind

-- Die Customers Tabelle und die Orders Tablle in einem Ergebnisfenster ausgeben
SELECT * FROM Customers
SELECT * FROM Orders

-- Join 
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT * FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID

/*
	JOIN Syntax:
	SELECT * FROM TabelleA
	INNER JOIN TabelleB ON A.Spalte1 = B.Spalte1
	
*/

-- Alias
SELECT * FROM Customers as cus
JOIN Orders as o ON cus.CustomerID = o.CustomerID
JOIN [Order Details] as od ON od.OrderID = o.OrderID

-- CustomerID ausgeben
SELECT OrderID, OrderDate, cus.* FROM Customers as cus
JOIN Orders as o ON cus.CustomerID = o.CustomerID

-- Übung: Bestellungen die Herr King bearbeitet hat
-- Tabellen: Orders - Employees
SELECT * FROM Orders
SELECT * FROM Employees

SELECT OrderID, LastName FROM Orders 
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'King'


-- Übung:
-- 1. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
--> Products - Categories Tabelle
SELECT * FROM Products
SELECT * FROM Categories

SELECT * FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE CategoryName IN('Beverages', 'Produce')

-- 2. Alle Bestellungen (Orders) bei denen ein Produkt verkauft wurde, das nicht mehr
-- geführt wird (Discontinued = 1 in Products Tabelle)
--> Orders - Order Details - Products
SELECT ProductName FROM Orders
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE Discontinued = 1

-- 3. Alle Bestellungen (Orders) aus den USA (Customers Country) die im Jahr 1997
-- aufgegeben wurden (OrderDate in Orders) Format vom Datum 'YYYYMMDD'
--> Customers - Orders
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND OrderDate BETWEEN '19970101' AND '19971231'

-- Joinen 
-- Tabellen: Products - Orders - Order Details - Customers
SELECT * FROM Products
SELECT * FROM Orders

SELECT * FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID

-- Joine Tabellen:
-- Employees - Orders - Customers
-- Filterung: Country = Deutschland und Frankreich (Customers Tabelle)
-- Sortiert werden = Absteigend (CustomerID)
SELECT * FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.Country IN('Germany', 'France') -- ODER-Fall
ORDER BY Customers.CustomerID Desc

SELECT * FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.Country = 'Germany' AND Customers.Country = 'France' -- UND-Fall
ORDER BY Customers.CustomerID Desc

-- Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
-- Tabellen: Employees - Orders - [Order Details] - Products
-- Filterung: LastName-Spalte
SELECT DISTINCT ProductName, LastName FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE LastName = 'Leverling'

-- Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName = 'Chai')?
-- Tabellen: [Order Details] - Products
-- Sortierung benötigt!
SELECT TOP 1 ProductName, Quantity FROM Products
JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC


-- OUTER JOINS: Left/Right und FULL OUTER JOIN

-- LEFT:
SELECT * FROM Orders as o
Right JOIN Customers as c ON o.CustomerID = c.CustomerID

SELECT * FROM Orders as o
JOIN Customers as c ON o.CustomerID = c.CustomerID

-- Right: Z: 189 & 502 Kunde nix bestellt hat
SELECT * FROM Orders as o
Right JOIN Customers as c on o.CustomerID = c.CustomerID

-- CROSS JOIN: Erstellt karthesisches Muster zweier Tabellen (A x B)+
SELECT * FROM Orders CROSS JOIN Customers
SELECT * from Orders -- => 830 rows
SELECT * FROM Customers -- => 91 Rows

-- Employees Tabelle:
-- Angestellter der einen anderen Angestellten ersetzen könnte wenn Krankheitsbedingt
SELECT E1.EmployeeID, E1.LastName as Vorgesetzter, E2.EmployeeID, E2.LastName as Angestellter 
FROM Employees as E1
RIGHT JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo

SELECT * FROM Employees
