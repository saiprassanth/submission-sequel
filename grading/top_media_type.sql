/*saiprassanth.ramesh@accenture.com*/

/*25nov2017*/

/*grading_set solution*/


/*27.top_media_type.sql: Provide a query that shows the most purchased Media Type.*/
select  m.name,count(i.invoicelineid) as count
from  invoiceline i,track t,mediatype m
where i.trackid=t.trackid and t.mediatypeid=m.mediatypeid
group by m.mediatypeid
order by count desc
limit 0,1;