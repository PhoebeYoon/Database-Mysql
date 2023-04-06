SELECT * FROM market_db.buy;
select prod_name, max(price) from market_db.buy group by prod_name;
select prod_name, min(price), avg(price) from market_db.buy group by prod_name;
select prod_name, min(price), ceil(avg(price)) from market_db.buy group by prod_name;
select prod_name, count(price), sum(price) from market_db.buy group by prod_name;

-- 여러개로 그룹화 
select * from market_db.buy  group by mem_id;
select mem_id,prod_name from market_db.buy  
	group by mem_id,prod_name;

select mem_id,prod_name from market_db.buy  
	group by mem_id , prod_name ;

select  price, amount  from market_db.buy 
	group by price, amount;
