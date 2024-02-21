USE Northwind

-- CASE - unterscheiden wir definierte F�lle, die die Ausgabe ab�ndern

-- Wenn ein Fall gefunden wird, dann wird der "THEN" Wert eingetragen
SELECT UnitsInStock, 
CASE
	WHEN UnitsInStock = 0 THEN 'Es ist zu sp�t!'
	WHEN UnitsInStock < 10 THEN 'M�ssen Nachbestellen!'
	WHEN UnitsInStock >= 10 THEN 'Genug vorhanden!'
END as Pr�fung
FROM Products

-- "Notausgang" = ELSE
SELECT UnitsInStock, 
CASE
	WHEN UnitsInStock = 0 THEN 'Es ist zu sp�t!'
	WHEN UnitsInStock < 10 THEN 'M�ssen Nachbestellen!'
	ELSE 'Ist gr��er als 10'
END as Pr�fung
FROM Products


-- GROUP BY
SELECT SUM(UnitsInStock),
CASE
	WHEN(UnitsInStock) < 10 THEN 'Nachbestellen!'
	WHEN(UnitsInStock) >= 10 THEN 'Passt.'
	ELSE 'Fehler!'
END as Pr�fung
FROM Products
GROUP BY
CASE
	WHEN(UnitsInStock) < 10 THEN 'Nachbestellen!'
	WHEN(UnitsInStock) >= 10 THEN 'Passt.'
	ELSE 'Fehler!'
END
