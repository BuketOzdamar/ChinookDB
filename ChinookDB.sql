
--Q.1 What is the title of the album with AlbumId 67

--SELECT Title
--FROM Album
--WHERE AlbumId=67;

--Q.2 Find the name and length (in seconds) of all tracks that have lengthbetween 50 and 70 seconds.

--SELECT Name, Milliseconds/1000 AS seconds
--FROM Track 
--WHERE Milliseconds / 1000 BETWEEN 50 AND 70; --SELECT SÜTUNUNDA OLUÞAN SECONDS SANAL BÝR SÜTUN OLDUÐU ÝÇÝN BURADA TEKRAR OLUÞTURMAMIZ GEREKTÝ.

--Q.3 List all the albums by artists with the word ‘black’ in their name.

--SELECT *
--FROM Album
--INNER JOIN Artist
--ON 
--Album.ArtistId=Artist.ArtistId
--WHERE
--Artist.Name like'%black%'

--select name
--from Artist
--where name like '%black%'

--Q.4 Provide a query showing a unique/distinct list of billing countries from theInvoice table

--SELECT DISTINCT BillingCountry
--FROM Invoice;

--Q.5 Display the city with highest sum total invoice.

--SELECT TOP 1 BillingCity,round(sum(Total),2) as 'TOPLAM_SATÝS'
--FROM Invoice
--group by BillingCity
--ORDER by TOPLAM_SATÝS DESC 

--Q.6 Produce a table that lists each country and the number of customers inthat country. 
--(You only need to include countries that have customers) indescending order. 
--Highest count at the top)

--SELECT Country, COUNT(DISTINCT CustomerId) AS 'ToplamMusteri'
--FROM Customer
--GROUP BY Country
--ORDER BY ToplamMusteri DESC

--Q.7 Find the top five customers in terms of sales i.e. find the five customerswhose total combined invoice amounts are the highest. 
--Give their name,CustomerId and total invoice amount. Use join 

--SELECT TOP 5 FirstName, LastName, Total, i.CustomerId, SUM(total) AS total_sum 
--FROM Invoice i 
--INNER JOIN Customer c 
--ON c.CustomerId = i.CustomerId 
--GROUP BY i.CustomerId, FirstName, LastName, Total
--ORDER BY total_sum DESC;

-- Q.8 Find out state wise count of customerID and list the names of states withcount of customerID in decreasing order. Note:- do not include where states isnull value.

--SELECT State, COUNT(CustomerId) AS 'EYALET BAZINDA TOPLAM MSTERÝ'
--FROM Customer
--WHERE State IS NOT NULL -- BOÞ OLAN DEÐERLERÝ ALMAYALIM
--GROUP BY State

-- Q.9 How many Invoices were there in 2009 and 2011?
----1

--SELECT COUNT(InvoiceId) as "Total Invoices"
--FROM Invoice
--WHERE DATEPART (YEAR, InvoiceDate) BETWEEN 2021 AND 2022
------2

--SELECT COUNT(InvoiceId) AS "Total Invoices"
--FROM Invoice
--WHERE InvoiceDate BETWEEN '2021-01-01' AND '2022-12-31';

-- Q.10 Provide a query showing only the Employees who are Sales Agents.

--SELECT FirstName + LastName as "Sales Employee" -- CONCAT(FirstName, ' ', LastName) DAHA KULLANIÞLI YÖNTEM
--FROM Employee
--WHERE Title LIKE 'Sales%'

-- Q.11 Which Employee has the Highest Total Number of Customers?

--SELECT TOP 1 CONCAT(Employee.FirstName, ' ', Employee.LastName) AS "Sales Employee", 
--			 COUNT(CustomerId) AS 'TOPLAM MUSTERÝ'
--FROM Employee
--INNER JOIN Customer
--ON 
--Customer.SupportRepId=Employee.EmployeeId
--GROUP BY Employee.FirstName, Employee.LastName
--ORDER BY COUNT(CustomerId) DESC

-- Q.2 Who are our top Customers according to Invoices?

--SELECT TOP 5 
--		CONCAT(C.FirstName, ' ', C.LastName) AS 'NAME AND SURNAME', 
--		SUM(I.Total) AS 'TOTAL'
--FROM Customer C
--INNER JOIN Invoice I
--ON
--I.CustomerId=C.CustomerId
--GROUP BY C.FirstName, C.LastName
--ORDER BY SUM(I.Total) DESC

--Q.3 Who are the Rock Music Listeners? We want to know all Rock Music listeners’ email, first names, last names, and Genres.




