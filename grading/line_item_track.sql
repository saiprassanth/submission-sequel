/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*grading_set solution*/

/*12.line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.*/
select i.invoicelineid,t.name from invoiceline i,track t where i.trackid=t.trackid;