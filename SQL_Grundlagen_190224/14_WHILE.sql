USE Northwind

-- WHILE - Schleifenanweisung

DECLARE @z�hler INT = 0

WHILE @z�hler <= 5
BEGIN
SELECT 'Hallo'
SET @z�hler = @z�hler + 1
END

DECLARE @OrderID INT = 10248

WHILE @OrderID <= 10254
BEGIN
SELECT * FROM Orders
WHERE OrderID = @OrderID
SET @OrderID = @OrderID + 1
END