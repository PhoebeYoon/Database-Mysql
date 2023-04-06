###### :cactus:  Mysql

## where(조건) 사용하기




```
SELECT * FROM market_db.buy ;
select * from market_db.buy where price >= 50;
select prod_name from market_db.buy where price >=80;
select * from market_db.buy where price  between 30 and 60;
select prod_name from market_db.buy where prod_name between '바' and '지';  

SELECT * FROM market_db.member;
select * from market_db.member where mem_number>5;
select mem_name from market_db.member where debut_date between '2010-01-01'  and '2015-12-31';

select mem_name from market_db.member where debut_date between '2010/01/01'  and '2015-12-31';
select mem_name , debut_date from market_db.member where debut_date between '2010-1-1'  and '2015-1-1';
select * from market_db.member where mem_name like '에%'; -- 에로 시작하는
select * from market_db.member where mem_name like '%에'; -- 결과가 없음

select * from market_db.member where mem_name like '%소%'; -- mem_name에 '소'가 포함된  
select * from market_db.member where mem_name like '%녀';  -- mem_name 이 '녀'로 끝나는

select * from market_db.member where phone1 in ('02', '031');
select * from market_db.member where phone1 not in ('02', '031');
```

## 서브쿼리 사용하기


|  다중 행 연산자 | 설명|
|---|---|
| IN |서브쿼리의 결과에 존재하는 임의의 값과 동일한 조건을 의미한다. |
| ALL | 서브쿼리의 결과에 존재하는 모든 값을 만족하는 조건을 의미한다. |
| ANY | 서브쿼리의 결과에 존재하는 어느 하나의 값이라도 만족하는 조건을 의미한다. |
| EXISTS | 서브쿼리의 결과를 만족하는 값이 존재하는지 여부를 확인하는 조건을 의미한다. |

```
select mem_id, mem_name from market_db.member 
where mem_id = 'APN';

select mem_id, mem_name from market_db.member 
where mem_id = ( SELECT mem_id from market_db.buy where prod_name ="맥북프로");


select mem_id, mem_name from market_db.member 
where mem_id in ( SELECT mem_id from market_db.buy where prod_name ="아이폰");

select mem_id, mem_name from market_db.member 
where mem_id > all ( SELECT mem_id from market_db.buy where price > 50);

--  여기부터 
select mem_id, mem_name from market_db.member 
where mem_id = any (SELECT mem_id from market_db.buy where price>80); 
-- any를 빼면 결과가 없다고 나온다 
-- 위와 같은 조건으로 결과가 나온다. 하지만 위의 조건에서는 any를 주어야 한다
SELECT mem_id , price FROM market_db.buy where price >80;
-- 여기까지가 하나의 예제 
```

#### exists 와 not exists 실습을 위해 간단한 테이블을 2개 만들겠습니다. 
```
mysql> create table sales(id int, order_date date, amount int);
mysql> insert into sales(id, order_date, amount)
      values(1, '2021-01-24',250),
      (2, '2021-01-25',250),
      (3, '2021-01-26',250),
      (4, '2021-01-27',250),
      (5, '2021-01-28',250),
      (6, '2021-01-29',250),
      (7, '2021-01-30',250),
      (8, '2021-01-31',250),
      (9, '2021-02-01',250);
mysql> create table orders(id int, order_date date, amount int);
mysql> insert into orders(id, order_date, amount)
      values(5, '2021-01-28',250),
      (6, '2021-01-29',250),
      (7, '2021-01-30',250),
      (8, '2021-01-31',250),
      (9, '2021-02-01',250);
mysql> SELECT * FROM sales  WHERE NOT EXISTS(SELECT * FROM orders  WHERE sales.order_date = orders.order_date);
```

workbench 에서 실행합니다. 
```
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
```


## 조건이 여러개 일때 사용하는 case문
형식 :    
```
CASE
	WHEN 조건
	THEN '반환 값'
	WHEN 조건
	THEN '반환 값'
	ELSE 'WHEN 조건에 해당 안되는 경우 반환 값'
END
```
when와 then은 한쌍입니다. else는 when의 조건에 만족하지 않을때 실행됩니다.    
