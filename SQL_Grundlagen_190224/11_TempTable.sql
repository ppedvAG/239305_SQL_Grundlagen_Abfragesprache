USE Northwind

-- Temporäre Tabllen / Temp Tables / #Tables
/*
	- existiert nur innerhalb meiner Session (Abfragefenster)
	- Ergebnisse nur einmal generiert werden -> TempTables nicht aktuell sind
	- werden in SystemDB unter tempDB -> Temporäre Tabellen gespeichert
	- mit einem # = 'lokal'
	- mit zwei ## = 'global'
*/



-- Erstellen
/*
	SELECT *
	INTO #TempTable
	FROM [Tabelle]
	
*/

-- lokal
SELECT *
INTO #TempTable
FROM Customers
WHERE Country = 'Germany'

-- Nur in dieser Abfrage gültig
SELECT * FROM #TempTable

-- manuell löschen
DROP TABLE #TempTable

-- globale Temp Table: bei jedem Abfragefenster aufrufbar
SELECT *
INTO ##TempTable
FROM Customers
WHERE Country = 'Germany'

-- Übung:
-- 1. Hat "Andrew Fuller" (Employees) schonmal Produkte der Kategorie
-- "Seafood" (Categories) verkauft?
-- Wenn ja, wieviel Lieferkosten sind dabei entstanden (Freight)
-- Das ganze in einer Temp Table speichern
-- Tabellen: Employees - Orders - Order Details - Products - Categories
SELECT SUM(Orders.Freight) as Lieferkosten, Employees.LastName 
INTO #TempTable
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details]. ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Employees.LastName = 'Fuller' AND Categories.CategoryName = 'Seafood'
GROUP BY Employees.LastName

SELECT * FROM #TempTable

-- 2. Wie viel Kunden gibt es in der Customerstabelle & gruppiere sie nach Country und City
-- Tipps: COUNT benötigt und GROUP BY
SELECT Country, City, COUNT(CompanyName) FROM Customers
GROUP BY Country, City

SELECT Country, City, COUNT(CustomerID) FROM Customers
GROUP BY Country, City

SELECT * FROM Customers

-- View wiederholung:
-- 3. Wieviel Umsatz haben wir in Q1 1998 mit Kunden aus den USA gemacht
-- View: vRechnungsDaten
SELECT SUM(SummeBestPosi) as GesamtUmsatz FROM vRechnungsDaten
WHERE Country = 'USA' AND DATEPART(YEAR, OrderDate) = 1998 AND DATEPART(QUARTER, OrderDate) = 1

SELECT SUM(SummeBestPosi) as GesamtUmsatz, Country as Land FROM vRechnungsDaten
WHERE Country IN('USA', 'Germany') AND DATEPART(YEAR, OrderDate) = 1998 AND DATEPART(QUARTER, OrderDate) = 1
GROUP BY Country

-- 4. Hatten wir Bestellungen, die wir zu spaet ausgeliefert haben? Wenn 
-- ja, welche OrderIDs waren das und wieviele Tage
-- waren wir zu spaet dran? (Verzoegerung = Unterschied zwischen Shipped 
-- & Required Date in Orders) Tipp: DATEDIFF & ISNULL
-- ISNULL prueft auf Null Werte und ersetzt diese wenn gewuenscht
-- SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax, Fax FROM Customers
/* 37
OrderID, "TageZuSpaet"
OrderID, "TageZuSpaet"
OrderID, "TageZuSpaet"
usw...
*/
SELECT OrderID, DATEDIFF(DAY, RequiredDate, ISNULL(ShippedDate, GETDATE())) as Verspätung FROM Orders
WHERE RequiredDate IS NOT NULL AND DATEDIFF(DAY, RequiredDate, ISNULL(ShippedDate, GETDATE())) > 0 
Order BY Verspätung DESC