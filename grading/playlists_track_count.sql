/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*grading_set solution*/

/*15.playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.*/
select p.name,s.count from playlist p,
(select playlistid,count(trackid) as count from playlisttrack group by playlistid) s 
where p.playlistid=s.playlistid;
