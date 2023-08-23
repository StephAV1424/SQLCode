SELECT s.customer_id, sum(m.price) as total_amount
	FROM dannys_diner.sales s
	LEFT JOIN dannys_diner.menu m
	on s.product_id = m.product_id
	GROUP BY s.customer_id
	ORDER BY s.customer_id ASC;
	
	