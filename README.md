###### :cactus:  Mysql

## SELECT 문법

SELECT 문은 데이터베이스에서 전체 혹은 특정 데이터를 검색할 때 사용됩니다. 반환되는 데이터는 임시의 테이블로 구성됩니다. 다음의 명령어 순서를 잘 기억하세요.
```
SELECT column1, column2, ...
FROM table명(위의 컬럼을 갖고 있는 )
WHERE 조건 
ORDER BY 컬럼영 ( ASC 또는 DESC )
LIMIT 출력하고자 하는 갯수
```
우선 SELECT 문에 사용할 수 있는 함수부터 연습해 보겠습니다. 
기본적으로 
```  
SELECT * FROM market_db.member ;
SELECT mem_name, addr FROM market_db.member ;
SELECT mem_name, phone1, addr FROM market_db.member ;
```  
모든 칼럼을 조회할때는 * 를 사용합니다. 출력결과에서 알 수 있는 것중 하나는 출력컬럼의 순서가 select문에서 주어진 순서대로 나온다는 것입니다. 확인하셨죠.

### count,distinct 사용해보기   
member 테이블에서 전체 몇명인지, 키가 160이상 몇명인지 , 키가 160이상 중에 중복을 제외하고 
즉 161이 2명이라면 이것을 하나로 계산해서 몇명인지 알아보도록 하겠습니다.    
```
SELECT * FROM market_db.member ;
SELECT count(mem_name) FROM market_db.member ; -- 10
SELECT count(height) FROM market_db.member where height > 160;  -- 9
SELECT distinct height FROM market_db.member; 
SELECT count(distinct height) FROM market_db.member; -- 8
```    
#### count(), count(표현식), count(distinct 표현식) 으로 사용합니다. 

### group by(그룹화)+함수 사용하기
group by를 이용하여 관련내용을 그룹화할 수 있어요. 그리고 그룹화할때는 어떤 목적이랄까 이런게 있겠죠. 
		예를들어 같은 날짜에 데뷔한 그룹이 몇그룹인지, 같은 키높이를 가진 멤버가 몇명인지    
group by와 아래의 함수들을 함께 사용할 수 있습니다.   

```
-- group by 
SELECT * FROM market_db.member group by mem_id; -- 성공
SELECT mem_name FROM market_db.member group by mem_id; -- 성공 
SELECT mem_name,  mem_number FROM market_db.member group by mem_id; -- 성공

SELECT height FROM market_db.member group by height;  -- 성공
SELECT mem_name FROM market_db.member GROUP BY height; -- 실패 이렇게 group by 목적에 맞지 않아요
-- height 별로 멤버의 이름을 보겠다는 것인데, 같은 키를 가진 사람들의 이름을 나열해서 보겠다는 의미지만.  
   이런 결과를 원한다면 다른식으로 표현해야 합니다. 
   ( 뭐 이런식으로, 즉 정렬을 해야 하는 것이지 그룹으로 묶을 수 있는 것은 아니죠 ) 
   select mem_name , height from market_db.member order by height desc;  )
-- 기억하시죠 sql는 구조화된 언어이기 때문에 내 생각될것 같다고 해서 모두 실행가능한것은 아닙니다. 
-- 아래쪽에 어떻게 해야 하는지 알려드립니다. 
SELECT addr FROM market_db.member group by addr;  -- 지역으로 그룹화해서 몇군데 지역인지 알수있죠
SELECT mem_number FROM market_db.member group by mem_number;

SELECT addr, mem_number FROM market_db.member group by addr, mem_number;
-- group by에 1개이상으로 그룹화했어요  
````

| group by 와 함께 사용할 함수 | 	설명 |
|---|---|
| MAX	 | 그룹중에 가장 큰 값 |
| MIN	 | 그룹중에가장 작은 값 |
| COUNT | 그룹의 갯수를 셉니다 (NULL값 제외) |
| SUM	| 그룹별로 합계를 구합니다 |
| AVG |	룹별로 평균를 구합니다 |

#### 그룹중에서 지역별로 평균키를 알고자 합니다 
```
-- 그룹화 + 함수 사용하기
SELECT * FROM market_db.member ;
SELECT addr, count(*) FROM market_db.member group by addr;

-- 주소로 그룹한 뒤에 해당 지역별이 몇개 있는지 
SELECT debut_date, count(*) FROM market_db.member group by debut_date;
SELECT addr, avg(height) FROM market_db.member group by addr;
select addr, max(height) from market_db.member group by addr;
select addr, max(height), min(height) from market_db.member group by addr;

```

```
SELECT * FROM market_db.buy;
select prod_name, max(price) from market_db.buy group by prod_name;
select prod_name, min(price), avg(price) from market_db.buy group by prod_name;
select prod_name, min(price), ceil(avg(price)) from market_db.buy group by prod_name;
select prod_name, count(price), sum(price) from market_db.buy group by prod_name;

```

#### 여러개로 그룹화 합니다. 
```
select * from market_db.buy  group by mem_id;
select mem_id,prod_name from market_db.buy  
	group by mem_id,prod_name;

select mem_id,prod_name from market_db.buy  
	group by mem_id , prod_name ;

select  price, amount  from market_db.buy 
	group by price, amount;
```



### order by (오름차순, 내림차순)으로 보기

order by에서 정렬기준을 1개 이상 사용할때는 순서를 고려해야 합니다. 맨왼쪽에 기준대로 정렬하고 그 정렬된 값들을 가지고 2번째 기준대로 정렬하는 것입니다.  
내림차순에는 'desc'를 오름차순에는 'asc'를 사용하는데 'asc'는 생략가능합니다.   


order by colm1 desc, colm2 ;  

이렇게 기술되어 있다면 먼저 colm1를 내림차순으로 정렬하고 colm1에 같은 값이 있다면 그값을 다시 오름차순으로 정렬하는 것입니다. 
```
SELECT * FROM market_db.member;
select * from market_db.member order by mem_id desc;
select debut_date ,addr from market_db.member order by  debut_date desc, addr ;
-- 결과에서 2015, 04-21에 2개의 그룹이 데뷔했는데 지역이 오름차순이기에 경기 , 서울 순입니다
```    


가격과 제품이름을 그룹화하여 보려고 하는데 가격은 높은 가격부터 낮은 가격순으로 이름은 오름차순으로 보기 
```
-- 가격은 내림차순, 이름은 오름차순으로 그룹화하여 보기
select price,prod_name ,count(price) from market_db.buy  
group by price, prod_name 
order by price desc, prod_name;
```
#### group by 와 order by를 함께 사용해 보겠습니다. 
```
SELECT * FROM testdb.actor;
select last_name , count(last_name) from testdb.actor 
group by last_name ;


select last_name ,count(last_name) from testdb.actor group by last_name;
select last_name ,count(last_name) from testdb.actor group by last_name order by last_name desc; 

-- 아래 2개의 결과는 동일합니다 
select last_name ,first_name from testdb.actor  group by last_name, first_name order by last_name; 
select last_name ,first_name from testdb.actor  order by last_name, first_name;
-- first_name으로 그룹화하는 의미가 없습니다. 

select last_name ,first_name from testdb.actor  order by last_name desc, first_name;
select last_name ,first_name from testdb.actor  order by last_name desc, first_name desc;


-- last_name으로 그룹화하고 first_name으로 다시 그룹화하고 싶다면 아래 구문처럼 적으면 에러가 납니다. 
-- 다다음줄처럼 기술해야 합니다. 
-- select last_name ,first_name from testdb.actor  group by last_name order by first_name; 
select last_name ,first_name from testdb.actor  group by last_name, first_name 
    order by last_name, first_name;

```

#### is null , ifnull 
기존에 만든 디비 'wellknowpeople'를 사용해 보겠습니다.  기존의 내용중에 일부러 null 값을 주도록할건데,
내용을 조회해보니 'Read Only'로 나옵니다.  해당 디비의 구조로 들어가서 primary key (pk)를 설정,
반드시 'Apply'클릭해서 디비에 반영해야 합니다.   

ifnull 은 지정된 칼럼의 값이 null 이면 지정된 값으로 보이도록 합니다. 

```   SELECT IFNULL(Column명, "Null일 경우 대체 값") FROM 테이블명;  ```

```
alter table testdb.wellknowpeople add comments varchar(50) after rating;
SELECT * FROM testdb.wellknowpeople;
use testdb;
select  ifnull(comments, "생략") from wellknowpeople;
SELECT * FROM testdb.wellknowpeople
```


:pencil: 쿼리문 실행시 workbench 하단에 'Read Only'라고 나오면서 수정이 되지 않는다면 
 - windows : 메뉴 > edit > Preferences > SQL Editor > Safe Updates 체크 해제
 - mac : MySqlWorkBench > Settings > SQL Editor > Safe Updates 체크 해제
