/*saiprassanth.ramesh@accenture.com*/

/*25nov2017*/

/*grading_set solution*/


/*24.top_2013_track.sql: Provide a query that shows the most purchased track of 2013.*/
SELECT t.Name, COUNT(il.InvoiceLineId) 
FROM Track t, InvoiceLine il, Invoice i 
WHERE t.TrackId == il.TrackId AND il.InvoiceId == i.InvoiceId AND i.InvoiceDate LIKE "2013%" 
GROUP BY t.name
ORDER BY COUNT(il.InvoiceLineId) DESC Limit 0,1;