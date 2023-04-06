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
select * from market_db.member where mem_name like '에%'; -- 에로 시작하
select * from market_db.member where mem_name like '%에'; -- 결과가 없음

select * from market_db.member where mem_name like '%소%'; -- mem_name에 '소'가 포함된  
select * from market_db.member where mem_name like '%녀';  -- mem_name 이 '녀'로 끝나는


select * from market_db.member where phone1 in ('02', '031');
select * from market_db.member where phone1 not in ('02', '031');


