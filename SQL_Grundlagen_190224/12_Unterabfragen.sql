USE Northwind

-- Subqueries / Unterabfragen

/*
	- Unterabfragen m�ssen eigenst�ndig funktionieren (fehlerfrei)
	- K�nnen prinzipiell �berall in einer Abfrage eingebaut werden kann (wenn es Sinn ergibt)
	- Abfragen werden "von innen nach au�en" der Reihe nach ausgef�hrt
	

*/

-- Zeige mir alle Orders, deren Freight Wert �ber dem Durchschnitt liegt
SELECT AVG(Freight) FROM Orders

-- Geht nicht
SELECT * FROM Orders
WHERE Freight > AVG(Freight)

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

-- Mehrere Werte aus einer Unterabfrage im WHERE m�glich, mit IN kombiniert
SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)

-- �bung:
-- 1. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce" => WHERE ben�tigt
-- (CategoryName in Categories)
--> Products - Categories Tabelle => JOIN ben�tigt
SELECT * FROM Products
SELECT * FROM Categories

SELECT * FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE CategoryName IN('Beverages', 'Produce')

-- Auch m�glich Joins zu ersetzen
SELECT * FROM Products
WHERE CategoryID IN (SELECT CategoryID FROM Categories WHERE CategoryName IN('Beverages', 'Produce'))

-- �bung
-- 1. Schreiben Sie eine Abfrage, um eine Produktliste
-- (ID, Name, St�ckpreis) mit einem �berdurchschnittlichen Preis zu erhalten
-- Tabelle: Products
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice

-- �bung
-- 1. Schreiben Sie eine Abfrage, um eine Produktliste
-- (ID, Name, St�ckpreis) mit einem unterdurchschnittlichen Preis zu erhalten
-- Tabelle: Products
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice < (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice 