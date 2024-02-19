USE Northwind

-- INTERSECT
SELECT * FROM Customers -- 91 Rows
INTERSECT -- Hey, ich suche die gleichen Datensätze zwischen den 2 Abfragen und gebe diese dir zurück
SELECT * FROM Customers -- 11 Rows
WHERE Country = 'Germany'

-- EXCEPT = Zeige mir alle Datensätze aus Abfrage 1, die NICHT ebenfalls in Abfrage 2
-- auftauchen

SELECT * FROM Customers -- => 91 Rows
EXCEPT
SELECT * FROM Customers
WHERE Country = 'Germany' -- => 11 Rows