SELECT customer_id, count(distinct order_date)
	FROM dannys_diner.sales
	GROUP BY customer_id
	ORDER BY customer_id;
	
	