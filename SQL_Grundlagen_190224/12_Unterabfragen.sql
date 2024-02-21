USE Northwind

-- Subqueries / Unterabfragen

/*
	- Unterabfragen müssen eigenständig funktionieren (fehlerfrei)
	- Können prinzipiell überall in einer Abfrage eingebaut werden kann (wenn es Sinn ergibt)
	- Abfragen werden "von innen nach außen" der Reihe nach ausgeführt
	

*/

-- Zeige mir alle Orders, deren Freight Wert über dem Durchschnitt liegt
SELECT AVG(Freight) FROM Orders

-- Geht nicht
SELECT * FROM Orders
WHERE Freight > AVG(Freight)

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

-- Mehrere Werte aus einer Unterabfrage im WHERE möglich, mit IN kombiniert
SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)

-- Übung:
-- 1. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce" => WHERE benötigt
-- (CategoryName in Categories)
--> Products - Categories Tabelle => JOIN benötigt
SELECT * FROM Products
SELECT * FROM Categories

SELECT * FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE CategoryName IN('Beverages', 'Produce')

-- Auch möglich Joins zu ersetzen
SELECT * FROM Products
WHERE CategoryID IN (SELECT CategoryID FROM Categories WHERE CategoryName IN('Beverages', 'Produce'))

-- Übung
-- 1. Schreiben Sie eine Abfrage, um eine Produktliste
-- (ID, Name, Stückpreis) mit einem überdurchschnittlichen Preis zu erhalten
-- Tabelle: Products
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice

-- Übung
-- 1. Schreiben Sie eine Abfrage, um eine Produktliste
-- (ID, Name, Stückpreis) mit einem unterdurchschnittlichen Preis zu erhalten
-- Tabelle: Products
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice < (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice 