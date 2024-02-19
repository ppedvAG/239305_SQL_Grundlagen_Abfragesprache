USE Northwind


-- WHERE: filtert Ergebniszeilen
SELECT * FROM Customers
WHERE Country = 'Germany'

-- = wird nach exakten Treffen gefiltert
SELECT * FROM Customers
WHERE Country = ' Germany'

SELECT * FROM Orders
WHERE Freight > 100

-- alle boolschen Vergleichsoperatoren verwenden
-- (>, <, >=, !=, <>, <=)

SELECT * FROM Orders
WHERE Freight < 500

SELECT * FROM Customers
WHERE Country != 'Germany'

-- Kombinieren mit AND oder OR
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

-- "Komplexes Beispiel"
SELECT * FROM Customers
WHERE (City = 'Paris' OR City = 'Berlin') AND 
(Country = 'Germany' OR Country = 'France')

SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 500

-- BETWEEN, Grenzbereich mit Randwerten dazu
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500

SELECT * FROM Customers
WHERE Country = 'Brazil' OR Country = 'Germany' OR Country = 'France' OR Country = 'Austria'

-- Alternativ IN (Wert1, Wert2, Wert3, usw...)
SELECT * FROM Customers
WHERE Country IN ('Brazil', 'Germany', 'France', 'Austria')

-- Übung: 

-- 1. Alle ContactNames die als ContactTitle "Owner" haben
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle = 'Owner'

-- 2. Alle Order Details die ProductID 43 bestellt haben
SELECT * FROM [Order Details]
WHERE ProductID = 43

-- 3. Alle Kunden aus Paris, Berlin, Madrid und Brazilien
SELECT * FROM Customers
WHERE City IN ('Paris', 'Berlin', 'Madrid') OR Country = 'Brazil'

-- "Bonus"
-- Filtern mit/nach NULL Werten:
-- Alle Kunden die eine Fax Nummer haben
-- NULL bedeutet KEIN Wert eingetragen, ist nicht dasselbe wie " " Leerzeichen
SELECT * FROM Customers
WHERE Fax IS NOT NULL