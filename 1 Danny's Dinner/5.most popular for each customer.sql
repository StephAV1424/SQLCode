select sales.customer_id, menu.product_name, count(sales.product_id) time_purchased from dannys_diner.sales
left join dannys_diner.menu
on sales.product_id = menu.product_id
group by sales.customer_id, menu.product_name
order by count(sales.product_id) desc