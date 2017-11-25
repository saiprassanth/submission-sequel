/*saiprassanth.ramesh@accenture.com*/

/*25nov2017*/

/*grading_set solution*/



/*7.invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.*/
select i.invoiceid,i.total,c.firstname,c.lastname,c.country,e.firstname as agentfirstname,e.lastname as agentlastname
from invoice i,customer c,employee e
where i.customerid=c.customerid and c.supportrepid=e.employeeid;