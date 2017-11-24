/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*grading_set solution*/

/*16.tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.*/
select t.name,a.title,m.name,g.name from track t,album a,mediatype m,genre g where 
t.albumid=a.albumid and t.mediatypeid=m.mediatypeid and t.genreid=g.genreid;
