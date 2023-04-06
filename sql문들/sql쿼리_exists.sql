use market_db;
select * from sales;
select * from orders;


SELECT * FROM sales  
	WHERE NOT EXISTS 
		(SELECT * FROM orders  
			WHERE sales.order_date = orders.order_date);   
            
            
SELECT * FROM sales  
	WHERE EXISTS 
		(SELECT * FROM orders  
			WHERE sales.order_date = orders.order_date);  