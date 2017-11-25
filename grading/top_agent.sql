/*saiprassanth.ramesh@accenture.com*/

/*25nov2017*/

/*grading_set solution*/


/*20.top_agent.sql: Which sales agent made the most in sales over all?*/
select s.firstname,s.lastname,max(s.totalsales) from(select e.firstname,e.lastname,sum(i.total) as totalsales from invoice i,customer c,employee e
where i.customerid=c.customerid and c.supportrepid=e.employeeid
group by c.supportrepid) s;