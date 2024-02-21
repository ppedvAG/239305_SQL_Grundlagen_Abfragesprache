USE Northwind

-- CREATE ALTER DROP - DDL (Data Definition Language)

-- Immer wenn wir Datenbankobjekte "bearbeiten"

CREATE TABLE PurchasingOrders
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate date NOT NULL,
	ProductID INT NOT NULL,
)
/*
	CREATE TABLE [Tabellenname]
	(
		Spaltenname [Datentyp] ...
		Spaltenname [Datentyp] ...
	)
*/
-- Tabelle löschen
-- DROP TABLE PurchasingOrders

SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrder und Products anlegen über die ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
/*
ALTER TABLE [Unsere neue Tabelle]
ADD FOREIGN KEY (Die spalte in unsere Tabelle) REFERENCES [Zu vorhandener Tabelle] (Spalte vorhandener Tabelle)
*/

-- Neue Spalte in meiner PurchasingOrders hinzufuegen
-- ALTER: Um unsere Tabellenstruktur zu verändern
ALTER TABLE PurchasingOrders
ADD TestDaten INT

SELECT * FROM PurchasingOrders

ALTER TABLE PurchasingOrders
ADD NeueSpalte2 INT, Zeit DATE

-- Spalte aus bestehenden Tabelle löschen
ALTER TABLE PurchasingOrders
DROP COLUMN NeueSpalte, NeueSpalte2, Zeit

-- INSERT - Hinzufügen von Datensätzen in bestehender Tabelle

-- Alle Spalten befuellen
INSERT INTO PurchasingOrders
VALUES ('20240221', 5, 10)

-- Explizit einzele Spalten hinzufügen
INSERT INTO PurchasingOrders (OrderDate, ProductID, TestDaten)
VALUES('20240221', 10, 21)

-- Ergebnis einer SELECT-Abfrage, direkt Inserten in unsere Tabelle
-- Voraussetzung: Spaltenanzahl muss passen & die Datentypen müssen kompatibel
INSERT INTO PurchasingOrders
SELECT GETDATE(), 20, 30

SELECT * FROM PurchasingOrders

-- DELETE - Datensätzen aus einer bestehenden Tabelle löschen
DELETE FROM PurchasingOrders
WHERE ID = 3

-- Primär-/Fremdschlüsselbeziehungen verhindern das löschen von Datensätzen, wenn andere Datensätze
-- sonst "ins Leere laufen würden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- UPDATE - Ändert unsere Spaltenwerte in einem vorhanden Datensatz
SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 8
WHERE ID = 1

-- "Löschen" von Werten: SET = NULL
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 1

-- Übung:
-- Trage dich selber in die Tabelle "Employees" ein. Bei folgenden Spalten:
-- LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, City, Region
-- PostalCode, Country, HomePhone, ReportsTo
-- (Müssen keine Persönlichen Taten sein)

-- Bonus: Ändere die Werte danach um
