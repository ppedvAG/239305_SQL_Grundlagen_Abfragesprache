USE Northwind
-- LIKE: Für ungenaue Filterungen die wir Suchen
-- (statt Vergleichsoperatoren)

SELECT ContactName, ContactTitle FROM Customers 
WHERE ContactTitle LIKE 'Manager'

-- Wildcards
-- "%"-Zeichen: Beliebige Symbole, beliebig viele davon
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%'

-- "_"-Zeichen: Ein beliebiges Symbol
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_l%'

-- "[]"-Zeichen: Alles was in den Klammern ist, ist ein gültiges Symbol
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0123456]%'

-- "[a-z]" oder Gegenteil mit ^ [^a-z]
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0-5]%'

-- NICHT Fall
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^0-5]%'

-- Sonderfälle: % - '
-- Hochkomma-Fall
SELECT * FROM Customers
WHERE CompanyName LIKE '% '' %'

-- Prozent-Fall
SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'