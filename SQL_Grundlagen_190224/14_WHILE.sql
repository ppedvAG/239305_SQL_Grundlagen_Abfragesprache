USE Northwind

-- WHILE - Schleifenanweisung

DECLARE @zähler INT = 0

WHILE @zähler <= 5
BEGIN
SELECT 'Hallo'
SET @zähler = @zähler + 1
END

DECLARE @OrderID INT = 10248

WHILE @OrderID <= 10254
BEGIN
SELECT * FROM Orders
WHERE OrderID = @OrderID
SET @OrderID = @OrderID + 1
END