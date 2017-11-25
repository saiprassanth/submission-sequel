/*saiprassanth.ramesh@accenture.com*/

/*25nov2017*/

/*grading_set solution*/


/*26.top_3_artists.sql: Provide a query that shows the top 3 best selling artists.*/
select ar.name,count(i.invoicelineid)
from invoiceline i,track t,album a,artist ar
where i.trackid=t.trackid and t.albumid=a.albumid and a.artistid=ar.artistid
group by ar.name
order by count(i.invoicelineid) desc
limit 0,3;

