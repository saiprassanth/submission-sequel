/*saiprassanth.ramesh@accenture.com*/

/*25nov2017*/

/*grading_set solution*/


/*21.sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.*/
select c.supportrepid,e.firstname,e.lastname,count(c.customerid) as no_of_customers
from customer c,employee e
where c.supportrepid=e.employeeid
group by c.supportrepid;
