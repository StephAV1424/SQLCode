/*select customer_id, order_date,
	CASE
		WHEN (m.product_id = '1') THEN 2
		ELSE 1
	END
from dannys_diner.sales m*/
WITH SP AS
(
	SELECT s.customer_id, m.product_name, s.order_date, mem.join_date, mem.join_date +7 as first_week,
	CASE
		WHEN s.order_date <= mem.join_date +7 AND s.order_date >= mem.join_date THEN sum(m.price)*20
		WHEN (m.product_id = '1') AND s.order_date <= mem.join_date THEN sum(m.price)*20
	    WHEN (m.product_id != '1') AND s.order_date <= mem.join_date THEN sum(m.price)*10
		--ELSE sum(m.price)*10
	END as Total_points
	FROM dannys_diner.sales s
	JOIN dannys_diner.menu m
	ON s.product_id = m.product_id
	JOIN dannys_diner.members mem
	ON s.customer_id = mem.customer_id
	GROUP BY s.customer_id, m.product_name, m.product_id, s.order_date, mem.join_date
	order by order_date asc
)
SELECT customer_id, sum(total_points) FROM SP
GROUP BY customer_id
order by customer_id


