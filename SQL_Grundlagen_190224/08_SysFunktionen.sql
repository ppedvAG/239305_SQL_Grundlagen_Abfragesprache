USE Northwind
-- String-Funktionen => Text-Datentypen manipulieren

-- LEN gibt die laenge des Strings zurück (Als int)
SELECT CompanyName, LEN(CompanyName) FROM Customers

-- LEFT/RIGHT geben die "linken" oder "rechten" x Zeichen eines Strings zurück
SELECT CompanyName, LEFT(CompanyName, 5), RIGHT(CompanyName, 5) FROM Customers

-- SUBSTRING(Spalte, x, y) springt zu Position x in einem String und gibt y Zeichen zurück
SELECT CompanyName, SUBSTRING(CompanyName, 5, 5) FROM Customers

-- STUFF(Spalte, x, y, (replace)) ersetzt y Zeichen eines Strings ab Position x
-- ggf. mit dem 'replace Wert'
SELECT STUFF(Phone, LEN(Phone) - 4, 5, 'XXXXX') FROM Customers

-- CONCAT fügt mehrere Strings in die selbe Spalte zusammen
SELECT CONCAT(FirstName, ' ', LastName) as GanzerName FROM Employees
SELECT FirstName + ' ' + LastName as GanzerName FROM Employees

-- Datumsfunktionen
-- aktuelle Systemzeit ausgeben lassen
SELECT GETDATE()

SELECT YEAR(OrderDate) as Jahr,
MONTH(OrderDate) as Monat,
DAY(OrderDate) as Tag, OrderDate
FROM Orders

-- DATEPART = "Zieht" ein gewünschtes Intervall aus einem Datum
SELECT
DATEPART(YEAR, OrderDate) as Jahr,
DATEPART(QUARTER, OrderDate) as Quartal,
DATEPART(WEEK, OrderDate) as KW,
DATEPART(WEEKDAY, OrderDate) as Wochentag,
DATEPART(HOUR, OrderDate) as Stunde,
DATEPART(YY, OrderDate) as YY
FROM Orders

-- DATENAME = Zieht den IntervallNamen aus einem Datum
SELECT 
DATENAME(MONTH, OrderDate),
DATENAME(WEEKDAY, OrderDate),
DATEPART(WEEKDAY, OrderDate),
DATENAME(ISO_WEEK, OrderDate),
DATEPART(ISO_WEEK, OrderDate)
FROm Orders

-- DATEADD = Datum addieren/subtrahieren
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- DATEDIFF = Differenz zwischen 2 Datum
SELECT DATEDIFF(YEAR, '20050213', GETDATE())
SELECT DATEDIFF(YEAR, OrderDate, GETDATE()), OrderDate FROM Orders

--------------------------------------------------------------------
-- Übungen:
-- 1. Alle Bestellungen (Orders) aus Q2 in 1997
SELECT * FROM Orders
WHERE OrderDate BETWEEN '19970401' AND '19970630'

-- => mit Datumsfunktionen umzubauen
SELECT * FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 1997 AND DATEPART(QUARTER, OrderDate) = 2

-- 2. Wieviele Bestellungen kamen aus Spain (Customers) in Quartal 2 1997?
-- Sind es mehr oder weniger als aus Frankreich? (2. Abfrage)
-- Tabellen: Customers - Orders

-- Espaniola
SELECT 'Spanien' as 'Land', COUNT(OrderID) as Bestellungen FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Country = 'Spain' AND DATEPART(QUARTER, OrderDate) = 2 AND DATEPART(YEAR, OrderDate) = 1997
UNION
SELECT 'Frankreich', COUNT(OrderID) FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Country = 'France' AND DATEPART(QUARTER, OrderDate) = 2 AND DATEPART(YEAR, OrderDate) = 1997

-- 3. Welches Produkt (ProductName) hatte die größte Bestellmenge (Quantity in Order Details) 
-- im Februar 1998?
-- Products - [Order Details]- Orders
SELECT ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998 AND DATEPART(MONTH, OrderDate) = 2
ORDER BY Quantity DESC

-- 4. Gab es Bestellungen (OrderID) an Wochenendtagen (6, 7) (OrderDate)?
SELECT OrderID, DATEPART(WEEKDAY, OrderDate) as Wochentag FROM Orders
WHERE DATEPART(WEEKDAY, OrderDate) IN(6,7)
ORDER BY Wochentag DESC

-- 5. Alle Bestellungen (Orders) aus den USA (Customers Country) die im Jahr 1997 aufgegeben wurden
-- (OrderDate in Orders)
-- Customers - Orders
SELECT OrderID, Country, OrderDate FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND OrderDate BETWEEN '19970101' AND '19971231'
-- Aufgabe von gestern in Datumsfunktionen umbauen..
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND DATEPART(YEAR, OrderDate) = 1997

-- BONUS: Rechnet die Zeitdifferenz zwischen eurenm Geburtstag und dem heutigen Datum aus
SELECT DATEDIFF(YEAR, '20050213', GETDATE()) as Jahre
SELECT DATEDIFF(MONTH, '20050213', GETDATE()) as Monate

-- Für Stephan und Nikolas :)
-- 6. Jahrweiser Vergleich unserer 3. Spediteure: (Shippers Tabelle): 
-- Lieferkosten (Freight) gesamt, Durchschnitt (freight) pro Lieferung und Anzahl an Lieferungen
-- Tables: Orders - Shippers
-- Aggregate: SUM, AVG, COUNT
-- DATEPART() benoetigt
/*
	Ergebnis in etwa so:
	SpediteurName, Geschäftsjahr, FreightGesamt, FreightAvg, AnzBestellungen
	Sped 1		 ,1996			, xy		   , xy		   , xy
	Sped 1		 ,1996			, xy		   , xy		   , xy
	Sped 1		 ,1996			, xy		   , xy		   , xy
	usw....
*/
SELECT 
CompanyName as SpediteurName,
DATEPART(YEAR, OrderDate) as Geschäftsjahr,
SUM(Freight) as FreightGesamt,
AVG(Freight) as FreightAvg,
COUNT(OrderID) as AnzBestellungen
FROM Shippers
JOIN Orders ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)
ORDER BY Geschäftsjahr, FreightAvg

SELECT SUM(Freight), ShipVia, OrderID  FROM Orders
GROUP BY ShipVia, OrderID

---------------------------------------------------------------------------------
-- CAST oder CONVERT, wandeln Datentypen in der Ausgabe um
SELECT CAST(OrderDate as date) FROM Orders

SELECT CONVERT(date, OrderDate) FROM Orders

-- ISNULL prüft auf NULL Werte und ersetzt diese wenn gewünscht
SELECT ISNULL(Fax, 'Nicht vorhanden!') FROM Customers

-- REVERSE(Spaltennamen) => 'Hallo' => Ausgabe: 'ollaH'
SELECT CompanyName, REVERSE(CompanyName) FROM Customers

-- UPPER & LOWER => GROß/kleinschreibung
SELECT CompanyName, LOWER(CompanyName), UPPER(CompanyName) FROM Customers