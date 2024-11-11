-- select first_name, last_name, title, levels  from employee
-- order by levels desc

-- select billing_country, sum(total) as total_country_sales 
-- from invoice
-- group by billing_country
-- order by total_country_sales desc
-- limit 1


-- select * from invoice
-- order by total desc
-- limit 3

-- select billing_city, sum(total) as invoice_total
-- from invoice
-- group by billing_city
-- order by invoice_total desc
-- limit 1

select i.customer_id, first_name, last_name, sum(total) as total_spends 
from invoice i join customer c
on i.customer_id = c.customer_id
group by i.customer_id, first_name, last_name
order by total_spends desc
limit 1