SELECT sales.customer_id , menu.product_name, sales.order_date
FROM dannys_diner.sales
LEFT JOIN dannys_diner.menu
  ON sales.product_id = menu.product_id
WHERE order_date = '2021-01-01' 
GROUP BY customer_id, menu.product_name, sales.order_date
ORDER BY customer_id;
	--FETCH FIRST 1 ROW only;
	