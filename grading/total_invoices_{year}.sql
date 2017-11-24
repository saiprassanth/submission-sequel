/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*grading_set solution*/

/*8.total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?*/
select count(invoiceid) from invoice where invoicedate like'2009%' or invoicedate like'2011%';