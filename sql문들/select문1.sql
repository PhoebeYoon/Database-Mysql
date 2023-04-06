
SELECT * FROM market_db.member ;
SELECT mem_name, addr FROM market_db.member ;
SELECT mem_name, phone1, addr FROM market_db.member ;


SELECT count(mem_name) FROM market_db.member ; -- 10
SELECT count(height) FROM market_db.member where height > 160;  -- 9
SELECT distinct height FROM market_db.member; 
SELECT count(distinct height) FROM market_db.member; -- 8

-- group by 
SELECT * FROM market_db.member group by mem_id; -- 성공
SELECT mem_name FROM market_db.member group by mem_id; -- 성공 
SELECT mem_name,  mem_number FROM market_db.member group by mem_id; -- 성공

SELECT height FROM market_db.member group by height;  -- 성공
SELECT mem_name FROM market_db.member GROUP BY height; -- 실패 이렇게 group by 목적에 맞지 않아요
-- height 별로 멤버의 이름을 보겠다는 것인데, 같은 키를 가진 사람들의 이름을 나열해서 보겠다는 의미지만 이런 결과를 원한다면 다른식으로 표현해야 합니다.
-- 기억하시죠 sql는 구조화된 언어이기 때문에 내 생각될것 같다고 해서 모두 실행가능한것은 아닙니다. 
-- 아래쪽에 어떻게 해야 하는지 알려드립니다. 
SELECT addr FROM market_db.member group by addr;  -- 지역으로 그룹화해서 몇군데 지역인지 알수있죠
SELECT mem_number FROM market_db.member group by mem_number;

SELECT addr, mem_number FROM market_db.member group by addr, mem_number;
-- group by에 1개이상으로 그룹화했어요  


-- 단지 그룹화할 뿐 아니라 그룹화한 이유를 알 수 있어요 
-- 그룹화 + 함수 사용하기
SELECT * FROM market_db.member ;
SELECT addr, count(*) FROM market_db.member group by addr;
-- 주소로 그룹한 뒤에 해당 지역별이 몇개 있는지 
SELECT debut_date, count(*) FROM market_db.member group by debut_date;
SELECT addr, avg(height) FROM market_db.member group by addr;
select addr, max(height) from market_db.member group by addr;
select addr, max(height), min(height) from market_db.member group by addr;






