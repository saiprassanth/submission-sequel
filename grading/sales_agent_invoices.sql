/*saiprassanth.ramesh@accenture.com*/

/*25nov2017*/

/*grading_set solution*/


/*6.sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.*/
select i.invoiceid,e.firstname,e.lastname 
from invoice i,customer c,employee e
where i.customerid=c.customerid and c.supportrepid=e.employeeid;
