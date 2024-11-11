/* Q1: Find how much amount spent by each customer on artists? 
Write a query to return customer name, artist name and total spent */


-- select c.first_name, c.last_name, ar.name as artist_name, sum(il.unit_price * il.quantity) as total_spent
-- from customer c join invoice i on c.customer_id = i.customer_id
-- join invoice_line il on i.invoice_id = il.invoice_id
-- join track t on il.track_id = t.track_id
-- join album a on t.album_id = a.album_id
-- join artist ar on a.artist_id = ar.artist_id
-- group by c.first_name, c.last_name, ar.name
-- order by total_spent desc

/* Q2: We want to find out the most popular music Genre for each country. 
We determine the most popular genre as the genre with the highest amount of purchases. 
Write a query that returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres. */

-- with cte as(
-- select i.billing_country, g.genre_id, g.name as genre_name, sum(il.unit_price * il.quantity) as spent
-- -- ROW_NUMBER() OVER (PARTITION BY i.billing_country, g.genre_id, g.name ORDER BY spent DESC) AS row_num
-- from invoice i join invoice_line il on i.invoice_id = il.invoice_id
-- join track t on il.track_id = t.track_id
-- join genre g on t.genre_id = g.genre_id
-- group by i.billing_country, g.genre_id, g.name
-- -- order by i.billing_country
-- ),
-- cte1 as(
-- select *,
-- ROW_NUMBER() OVER (PARTITION BY billing_country ORDER BY spent DESC) AS row_num
-- from cte
-- order by billing_country, row_num)

-- select * 
-- from cte1
-- where row_num = 1
-- order by billing_country, row_num

/* Q3: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */

with total_spends as(
select billing_country, customer_id, sum(total) as spends
from invoice
group by 1, 2),

ranked_spends as (
select *, 
row_number() over (partition by billing_country order by spends desc) as row_num
from total_spends
)

select * 
from ranked_spends
where row_num = 1
order by billing_country
























	

















