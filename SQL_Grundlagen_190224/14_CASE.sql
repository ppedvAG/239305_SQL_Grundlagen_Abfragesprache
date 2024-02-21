USE Northwind

-- CASE - unterscheiden wir definierte Fälle, die die Ausgabe abändern

-- Wenn ein Fall gefunden wird, dann wird der "THEN" Wert eingetragen
SELECT UnitsInStock, 
CASE
	WHEN UnitsInStock = 0 THEN 'Es ist zu spät!'
	WHEN UnitsInStock < 10 THEN 'Müssen Nachbestellen!'
	WHEN UnitsInStock >= 10 THEN 'Genug vorhanden!'
END as Prüfung
FROM Products

-- "Notausgang" = ELSE
SELECT UnitsInStock, 
CASE
	WHEN UnitsInStock = 0 THEN 'Es ist zu spät!'
	WHEN UnitsInStock < 10 THEN 'Müssen Nachbestellen!'
	ELSE 'Ist größer als 10'
END as Prüfung
FROM Products


-- GROUP BY
SELECT SUM(UnitsInStock),
CASE
	WHEN(UnitsInStock) < 10 THEN 'Nachbestellen!'
	WHEN(UnitsInStock) >= 10 THEN 'Passt.'
	ELSE 'Fehler!'
END as Prüfung
FROM Products
GROUP BY
CASE
	WHEN(UnitsInStock) < 10 THEN 'Nachbestellen!'
	WHEN(UnitsInStock) >= 10 THEN 'Passt.'
	ELSE 'Fehler!'
END
