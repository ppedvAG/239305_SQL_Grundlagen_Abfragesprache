/*
	Aggregatfunktionen: Führt eine Berechnung auf einer Menge von Werten durch und gibt uns dann einen
						einzigen Wert zurück
	Ausnahme: COUNT(*) ignoriert keine NULL Werte, Aggregatfunktion schon

	GROUP BY: Fassen mehrer Werte in Gruppen zusammen

	HAVING:  Das gleiche wie WHERE + Aggregate!
*/

SELECT SUM(Freight) FROM Orders

USE Northwind 

-- Verkaufte Stueckzahlen pro Produkt, aber nur die über 1000
SELECT ProductName as Produkt, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE SUM(Quantity) > 1000
GROUP BY ProductName
ORDER BY SummeStueckzahl DESC

-- Mit HAVING
SELECT ProductName as Produkt, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
--WHERE SUM(Quantity) > 1000
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY SummeStueckzahl DESC

-- Übung
-- 1. In welcher Stadt (City) waren "Wimmers gute Semmelknödel" am beliebtesten (Quantity)?
-- Tabellen: Products - [Order Details] - Orders - Customers
SELECT TOP 1 ProductName, Customers.City, MAX(Quantity) FROM Products
JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY ProductName, City, Quantity
HAVING ProductName = 'Wimmers gute Semmelknödel'
ORDER BY Quantity DESC

-- 2. Wieviele Bestellungen hat jeder Mitarbeiter bearbeitet? (9 Ergebniszeilen)
-- Tabellen: Employees - Orders
SELECT LastName, COUNT(OrderID) as Bestellungen FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY LastName
ORDER BY Bestellungen DESC



SELECT TOP 1 ShipCity, OrderID, CustomerID, MAX(Freight) as Fracht FROM Orders
GROUP BY OrderID, CustomerID, ShipCity
ORDER BY Fracht DESC