/*select customer_id, order_date,
	CASE
		WHEN (m.product_id = '1') THEN 2
		ELSE 1
	END
from dannys_diner.sales m*/
WITH SP AS
(
	SELECT s.customer_id, m.product_name,
	CASE
		WHEN (m.product_id = '1') THEN sum(m.price)*20
		ELSE sum(m.price)*10
	END as Total_points
	FROM dannys_diner.sales s
	JOIN dannys_diner.menu m
	ON s.product_id = m.product_id
	GROUP BY s.customer_id, m.product_name, m.product_id
)
SELECT customer_id, sum(total_points) FROM SP
GROUP BY customer_id
order by customer_id
