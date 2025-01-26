SELECT CustomerId, 
		FirstName + ' ' + LastName AS "Name Surname",
		Country
FROM Customer


SELECT AL.Title AS 'Album Name', 
       AR.Name AS 'Artist Name',
       G.Name AS 'Genre Name',
       T.Name AS 'Track Name'  -- Burada þarký adý eklenmiþ oluyor
FROM Album AS AL
INNER JOIN Artist AS AR ON AL.ArtistId = AR.ArtistId
INNER JOIN Track AS T ON T.AlbumId = AL.AlbumId
INNER JOIN InvoiceLine AS IL ON IL.TrackId = T.TrackId
INNER JOIN Genre AS G ON G.GenreId = T.GenreId
GROUP BY AR.Name, AL.Title, G.Name, T.Name



SELECT 
    C.CustomerId,
    FirstName + ' ' + LastName AS CustomerName,
    C.Country,
    AL.Title AS AlbumName,
    AR.Name AS ArtistName,
    T.Name AS SongName,
	G.Name AS 'GenreName'
FROM Customer AS C
INNER JOIN Invoice AS I ON C.CustomerId = I.CustomerId
INNER JOIN InvoiceLine AS IL ON I.InvoiceId = IL.InvoiceId
INNER JOIN Track AS T ON IL.TrackId = T.TrackId
INNER JOIN Genre AS G ON G.GenreId = T.GenreId
INNER JOIN Album AS AL ON T.AlbumId = AL.AlbumId
INNER JOIN Artist AS AR ON AL.ArtistId = AR.ArtistId  -- ArtistId'nin doðru yazýldýðýndan emin olun
GROUP BY 
    C.CustomerId, 
    C.FirstName, 
    C.LastName, 
    C.Country, 
    AL.Title, 
    AR.Name, 
    T.Name,
	G.Name
