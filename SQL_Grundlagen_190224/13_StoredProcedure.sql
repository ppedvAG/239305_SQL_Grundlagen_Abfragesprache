USE Northwind

-- Stored Procedures

/*
	- Arbeiten mit Variablen
	
*/

/*
	Syntax:
	CREATE PROCEDURE [ProzedurNamen] @Var1 Datentyp, @Var2 Datentyp ....
	AS
	[Übliche Abfrage]
	GO
*/

CREATE PROCEDURE spRechnungsByOrderID @OrderID INT
AS
SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID
GO

-- Prozedur ausführen
-- Syntax: EXEC [ProzedurNamen] (Wert von der Variable)
EXEC spRechnungsByOrderID 10250

-- Zwei Variablen
CREATE PROCEDURE spRechnungsByOrderIDZwei @OrderID INT, @OrderIDZwei INT
AS
SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID
SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderIDZwei
GO

EXEC spRechnungsByOrderIDZwei 10250, 10251

-- Neuer Kunde anlegen
CREATE PROCEDURE spNewCustomerNeu
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(30), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomerNeu 'ALDIS', 'ppedv AG', 'Germany', 'Burghausen'
EXEC spNewCustomerNeu LIDLI, 'Lidl GmbH', 'Germany', Burghausen
EXEC spNewCustomerNeu EDEKA, 'Edeka GmbH', Germany, Burghausen

SELECT * FROM Customers
WHERE CompanyName = 'Edeka GmbH'

-- Default Werte (Standard Werte)
CREATE PROCEDURE spKundenNachLandCity @Country varchar(50) = 'Germany', @City varchar(50) = 'Berlin'
AS
SELECT * FROM Customers 
WHERE Country = @Country AND City = @City
GO

EXEC spKundenNachLandCity 


CREATE PROCEDURE spKundenNachLandCityTest @Country varchar(50), @City varchar(50)
AS
SELECT * FROM Customers 
WHERE Country = @Country AND City = @City
GO

EXEC spKundenNachLandCityTest Austria, Salzburg

/*
	-- Variablen allgemein

	Was sind den Variablen?:
		- Platzhalter
		- Speicherort für Daten
*/


-- Deklarieren für Variablen
/*
	Syntax:
	DECLARE @Var1 INT (= Wert1) ggf.
*/
-- Merke!: Variablen im Zusammenhang mit der Abfrage ausführen!
DECLARE @OrderID INT = 10250

SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID

SET @OrderID = 10251

SELECT * FROM vRechnungsDaten
WHERE OrderID = @OrderID


CREATE PROCEDURE SchwierigerKunde @Rechnungsnummer INT
AS
SELECT *  FROM [KundenTabelle]
WHERE [Recnungsnummer] = @Rechnungsnummer
GO

EXEC SchwierigerKunde 723589