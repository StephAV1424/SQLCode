--8.What is the total items and amount spent for each member before they became a member?


SELECT s.customer_id, count(s.product_id) as total_items, sum(m.price) as amount_spent
FROM dannys_diner.sales s
JOIN dannys_diner.menu m
ON s.product_id = m.product_id
JOIN
(
SELECT
		s.customer_id, s.order_date
	FROM dannys_diner.sales s
	LEFT JOIN dannys_diner.members mem
	ON s.customer_id = mem.customer_id
	WHERE  s.order_date < mem.join_date
	GROUP BY s.customer_id, s.order_date
) AS TIAS
ON s.customer_id = TIAS.customer_id and TIAS.order_date = s.order_date
GROUP BY s.customer_id
order by s.customer_id ASC;
