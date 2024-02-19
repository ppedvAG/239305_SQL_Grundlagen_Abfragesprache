
-- USE Datenbankname wechselt angesprochene Datenbank
USE Northwind

-- Alternativ per Dropdown Menü

-- einzeiligen Kommentar
/*
Mehrzeiliger
Kommentar
*/

-----------------------------------
-- SELECT: Wählt Spalten aus, die im Ergebnis fenster angezeigt werden sollen

SELECT * FROM Customers -- * = alle Spalten wollen wir haben von der Tabelle XYZ
SELECT * FROM Orders

-- "Custom"-Ausgabe machen
SELECT 100 as Hundert

SELECT 'Hallo!'

SELECT 'Hallo!', 100

--------------------------------
-- SQL ist NICHT case-sensitive
-- Spaltennamen ändern mit Alias "as"
sElEcT			CoUnTry as Country ,

	CoMpAnYnAme as CompanyName FRoM
	cUsTomers

SELECT * FROM Customers
-- Sortieren mit ORDER BY
SELECT City FROM Customers
ORDER BY City -- (ASC)

-- Absteigend sortieren
SELECT City FROM Customers
ORDER BY City DESC
-- ORDER BY ist syntaktisch IMMER am Ende
-- ASC = Ascending = aufsteigend
-- DESC = Descending = absteigend

-- Auch mehrere Spalten mit dem Order by kombinieren
SELECT City, CompanyName FROM Customers
ORDER BY City ASC, CompanyName DESC

-------------------------------------------------
-- TOP X zeilen mir nur ausgeben lassen
SELECT * FROM Customers
SELECT TOP 10 * FROM Customers

-- Geht auch mit %-Angaben
-- TOP X PERCENT
SELECT TOP 10 PERCENT * FROM Customers

-- die ersten 20 kleinsten Werte
SELECT TOP 20 Freight FROM Orders
ORDER BY Freight ASC

-- die ersten 20 größten Werte
SELECT TOP 20 Freight FROM Orders
ORDER BY Freight DESC

-- Es gibt kein BOTTOM X existiert nicht!, ergebnis einfach mit order by umdrehen

---------------------------------------
-- DISTINCT: Filterung von Duplikaten
SELECT Country FROM Customers 

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT City, Country FROM Customers
------------------------------------------------------------

-- UNION
-- UNION führt mehrere Ergebnistabellen vertikal in eine Tabelle zusammen
-- UNION macht auch automatisch ein DISTINCT MIT
-- Spaltenanzahl muss gleich sein, Datentypen kompatibel

SELECT * FROM Customers
UNION
SELECT * FROM Customers

-- mit UNION ALL wird kein DISTINCT ausgeführt

SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers

-- Geht wegen Datentypen, falsche Reihenfolge
SELECT 100, 'Hallo'
UNION
SELECT 'Tschüss', 5

-- Geht wiederrum schon
SELECT 100 as Test, 'Hallo' as Hallo
UNION
SELECT 5, 'Tschüss'

-- Aliase können auch für Tabellennamen
SELECT * FROM Customers as cus