/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*grading_set solution*/

/*9.total_sales_{year}.sql: What are the respective total sales for each of those years?*/
select sum(total) as total_for_2009and2011 from invoice where invoicedate like'2009%' union
select sum(total) from invoice where invoicedate like'2011%';