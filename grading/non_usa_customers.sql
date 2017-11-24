/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*grading_set solution*/

/*1.non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.*/
select customerid,firstname,lastname,country from customer where country not like'USA';