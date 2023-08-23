--6.Which item was purchased first by the customer after they became a member?

SELECT s.customer_id, m.product_name as first_join_item
FROM dannys_diner.sales s
JOIN dannys_diner.menu m
ON s.product_id = m.product_id
JOIN
(
	SELECT
		s.customer_id, min(s.order_date) as first_date_joined
	FROM dannys_diner.sales s
	LEFT JOIN dannys_diner.members mem
	ON s.customer_id = mem.customer_id
	WHERE mem.join_date <= s.order_date
	GROUP BY s.customer_id
) AS CTE5
ON s.customer_id = CTE5.customer_id AND s.order_date = CTE5.first_date_joined
order by s.customer_id