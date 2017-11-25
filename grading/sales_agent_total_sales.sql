/*saiprassanth.ramesh@accenture.com*/

/*25nov2017*/

/*grading_set solution*/


/*18.sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.*/
select e.firstname,e.lastname,sum(i.total) as totalsales from invoice i,customer c,employee e
where i.customerid=c.customerid and c.supportrepid=e.employeeid
group by c.supportrepid;

