/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*grading_set solution*/

/*14.country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY*/
select billingcountry,count(invoiceid) as count from invoice group by billingcountry;