-- select distinct c.email, c.first_name, c.last_name, g.name
-- from customer c inner join invoice i on c.customer_id = i.customer_id
-- inner join invoice_line il on i.invoice_id = il.invoice_id
-- inner join track t on il.track_id = t.track_id
-- inner join genre g on t.genre_id = g.genre_id
-- WHERE g.name = 'Rock'
-- order by c.email asc

-- select ar.artist_id, ar.name, count(t.track_id) as c_tracks
-- from track t inner join genre g on t.genre_id = g.genre_id
-- inner join album a on t.album_id = a.album_id
-- inner join artist ar on a.artist_id = ar.artist_id
-- WHERE g.name = 'Rock'
-- group by ar.artist_id, ar.name
-- order by c_tracks desc
-- limit 10

-- select t.track_id, t.name, t.milliseconds
-- from track t
-- where t.milliseconds > (select avg(milliseconds) from track)
-- order by t.milliseconds desc










