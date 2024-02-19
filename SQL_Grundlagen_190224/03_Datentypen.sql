/*

	IN SQL 3 Große Datentypsgruppen:

	1. Charakter/String Datentypen:
	char(10) = 'Hallo     ' = 10 Byte Speicherplatz
	nchar() = 1 Charakter = 2 Byte => Verwendet UTF-16

	varchar(10) = 'Hallo' = 5 Byte Speicherplatz
	nvarchar() = 1 Charakter = 2 Byte => Verwendet auch UTF-16

	Legacy: text --> VARCHAR(MAX) = bis zu 2GB
	VARCHAR(8000) & nvarchar(4000) sind maximum


	2. Numerische Datentypen:
	tinyint = 8 Bit = bis 255
	smallint = 16 Bit = 32k
	int = 32 Bit = 2,14Mrd
	bigint = 64 Bit = 9,2 Trillion ca.

	Wir keinen Bool =>
	bit = 1 oder 0 (True = 1, False = 0) 

	decimal(x, y) = x Ziffern sind es insgesamt, davon sind y Nachkommastellen
	decimal(10, 2) = 10 Ziffern insgesamt => davon sind 2 Nachkommastellen
	money = ca 9,2 Trillion
	smallmoney = ca. 214 Tausend


	3. Datum/Zeit Datentypen:
	time = hh:mm:ss.nnnnnnn
	date = YYYY-MM-DD
	datetime = date + time in MS = YYYY-MM-DD hh:mm:ss.mmm
	datetime2 = YYYY-MM-DD hh:mm:ss.nnnnnnn
	smalldatetime = präzise bis Sekunden = YYYY-MM-DD hh:mm:ss

*/

SELECT * FROM Customers