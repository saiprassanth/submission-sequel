/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*grading_set solution*/

/*17.invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.*/
select i.invoiceid,count(il.invoicelineid) as count from invoice i join invoiceline il 
on i.invoiceid=il.invoiceid group by i.invoiceid; 