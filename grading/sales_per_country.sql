/*saiprassanth.ramesh@accenture.com*/

/*25nov2017*/

/*grading_set solution*/


/*22.sales_per_country.sql: Provide a query that shows the total sales per country.*/
select billingcountry,sum(total) as total_sales
from invoice 
group by billingcountry;