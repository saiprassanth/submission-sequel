/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*grading_set solution*/

/*13.line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.*/
select t.name,t.composer from invoiceline i,track t where i.trackid=t.trackid