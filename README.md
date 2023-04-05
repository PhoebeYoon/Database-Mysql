###### :cactus:  Mysql

## SELECT 문법

SELECT 문은 데이터베이스에서 전체 혹은 특정 데이터를 검색할 때 사용됩니다. 반환되는 데이터는 임시의 테이블로 구성됩니다.  
```
SELECT column1, column2, ...
FROM table_name;
```  
모든 칼럼을 조회할때는 * 를 사용합니다.

use testdb;
select actor_id , first_name  from actor;
select actor_id as '아이디', first_name  as '이름' from actor;
-- as 는 별칭을 사용할때 사용합니다 
use sakila;
show tables;
select * from sakila.city;
select count(city) from sakila.city;  -- count() 함수를 사용했습니다.



SELECT * FROM sakila.address; 
select postal_code from sakila.address;
desc sakila.address;
select  IFNULL(postal_code,'a') from sakila.address;


:pencil: 쿼리문 실행시 workbench 하단에 'Read Only'라고 나오면서 수정이 되지 않는다면 
 - windows : 메뉴 > edit > Preferences > SQL Editor > Safe Updates 체크 해제
 - mac : MySqlWorkBench > Settings > SQL Editor > Safe Updates 체크 해제
