DROP DATABASE IF EXISTS cookDB; -- 만약 cookDB가 존재하면 우선 삭제한다.
CREATE DATABASE cookDB;


USE cookDB;
CREATE TABLE userTBL( -- 회원테이 
userID CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
userName VARCHAR(10) NOT NULL, -- 이름
birthYear INT NOT NULL, -- 출생 연도
addr CHAR(2) NOT NULL, -- 지역(경기, 서울, 경남 식으로 2글자만 입력) 
mobile1 CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
mobile2 CHAR(8), -- 휴대폰의 나머지 번호(하이픈 제외)
height SMALLINT, -- 키
mDate DATE -- 회원 가입일
);
CREATE TABLE buyTBL( -- 구매테이
num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
userID CHAR(8) NOT NULL, -- 아이디(FK) 
prodName CHAR(6) NOT NULL, -- 물품 
groupName CHAR(4), -- 분류
price INT NOT NULL, -- 단가
amount SMALLINT NOT NULL, -- 수량
FOREIGN KEY (userID) REFERENCES userTBL (userID) );

INSERT INTO userTBL VALUES ("YJS", "유재석", 1972, "서울", "010", "11111111", 178, "2008-8-8"); 
INSERT INTO userTBL VALUES ('KHD', '강호동', 1970, '경북', '011', '22222222', 182, '2007-7-7'); 
INSERT INTO userTBL VALUES ('KKJ', '김국진', 1965, '서울', '019', '33333333', 171, '2009-9-9'); 
INSERT INTO userTBL VALUES ('KYM', '김용만', 1967, '서울', '010', '44444444', 177, '2015-5-5'); 
INSERT INTO userTBL VALUES ('KJD', '김제동', 1974, '경남', NULL , NULL, 173, '2013-3-3'); 
INSERT INTO userTBL VALUES ('NHS', '남희석', 1971, '충남', '016', '66666666', 180, '2017-4-4'); 
INSERT INTO userTBL VALUES ('SDY', '신동엽', 1971, '경기', NULL, NULL, 176, '2008-10-10'); 
INSERT INTO userTBL VALUES ('LHJ', '이휘재', 1972, '경기', '011', '88888888', 180, '2006-4-4'); 
INSERT INTO userTBL VALUES ('LKK', '이경규', 1960, '경남', '018', '99999999', 170, '2004-12-12'); 
INSERT INTO userTBL VALUES ('PSH', '박수홍', 1970, '서울', '010', '00000000', 183, '2012-5-5');


INSERT INTO buyTBL VALUES (NULL, 'KHD', '운동화', NULL, 30, 2); 
INSERT INTO buyTBL VALUES (NULL, 'KHD', '노트북', '전자', 1000, 1); 
INSERT INTO buyTBL VALUES (NULL, 'KYM', '모니터', '전자', 200, 1); 
INSERT INTO buyTBL VALUES (NULL, 'PSH', '모니터', '전자', 200, 5);
INSERT INTO buyTBL VALUES (NULL, 'KHD', '청바지', '의류', 50, 3);
INSERT INTO buyTBL VALUES (NULL, 'PSH', '메모리', '전자', 80, 10); 
INSERT INTO buyTBL VALUES (NULL, 'KJD', '책', '서적', 15, 5); 
INSERT INTO buyTBL VALUES (NULL, 'LHJ', '책', '서적', 15, 2);
INSERT INTO buyTBL VALUES (NULL, 'LHJ', '청바지', '의류', 50, 1); 
INSERT INTO buyTBL VALUES (NULL, 'PSH', '운동화', NULL, 30, 2); 
INSERT INTO buyTBL VALUES (NULL, 'LHJ', '책', '서적', 15, 1); 
INSERT INTO buyTBL VALUES (NULL, 'PSH', '운동화', NULL, 30, 2);


SELECT * FROM userTBL; 
SELECT * FROM buyTBL;


SELECT * FROM userTBL WHERE userName = '강호동';
-- 회원 테이블에서 1970년 이후에 출생했고 키가 182cm 이상인 사람의 아이디와 이름을 조회
SELECT userID, userName FROM userTBL WHERE birthYear >= 1970 AND height >= 182;
-- 1970년 이후에 출생했거나 키가 182cm 이상인 사람의 아이디와 이름 조회
SELECT userID, userName FROM userTBL WHERE birthYear >= 1970 OR height >= 182;

-- 회원 테이블에서 키가 180~182cm인 사람 조회
SELECT userName, height FROM userTBL WHERE height >= 180 AND height <= 182;

-- 위 쿼리문은 BETWEEN ... AND 연산자를 사용하여 다음과 같이 작성
SELECT userName, height FROM userTBL WHERE height BETWEEN 180 AND 182;

-- 지역이경남또는충남또는경북인사람은OR연산자를사용하여조회
SELECT userName, addr FROM userTBL WHERE addr='경남' OR addr='충남' OR addr='경북';

-- IN( ) 연산자 사용
SELECT userName, addr FROM userTBL WHERE addr IN ('경남', '충남', '경북');

-- 성이 김씨인 회원의 이름과키 조회
SELECT userName, height FROM userTBL WHERE userName LIKE '김%';

-- 맨앞의 한글자가 무엇이든 상관없고 그다음이 ‘경규’인 사람조회
SELECT userName, height FROM userTBL WHERE userName LIKE '_경규';

-- 김용만보다 키가 크거나같은 사람의 이름과키 출력
SELECT userName, height FROM userTBL WHERE height > 177;
SELECT userName, height FROM userTBL WHERE height > (SELECT height FROM userTBL WHERE userName = '김용만');

-- 다음의 경과는 에러가 발생합니다. 
SELECT userName, height FROM userTBL WHERE height >= (SELECT height FROM userTBL WHERE addr = '경기');
-- 위의 에러에 any를 추가하여 수정합니다a
SELECT userName, height FROM userTBL WHERE height >= ANY (SELECT height FROM userTBL WHERE addr = '경기');

-- 지역이경기인사람보다키가크거나같은사람추출
SELECT userName, height FROM userTBL
WHERE height >= ALL (SELECT height FROM userTBL WHERE addr = '경기');

-- >=ANY 대신 =ANY사용
SELECT userName, height FROM userTBL WHERE height = ANY (SELECT height FROM userTBL WHERE addr = '경기');

-- ‘= ANY (서브쿼리)’는 ‘ IN (서브쿼리)’와 동일
SELECT userName, height FROM userTBL WHERE height IN (SELECT height FROM userTBL WHERE addr = '경기');

-- 가입한 순서대로 회원 출력(기본적으로 오름차순(ascending)으로 정렬)
SELECT userName, mDate FROM userTBL ORDER BY mDate;


-- 내림차순(descending)으로 정렬(열 이름 뒤에 DESC를 넣음)
SELECT userName, mDate FROM userTBL ORDER BY mDate DESC;

-- 정렬 기준을 2개로 설정하고 정렬
SELECT userName, height FROM userTBL ORDER BY height DESC, userName ASC;


-- DISTINCT 키워드
--  회원테이블에서 회원들의거주지역이 몇곳인지 출력
SELECT addr FROM userTBL;

-- 회원 테이블에서 회원들의 거주 지역이 몇 곳인지 출력(ORDER BY 절 사용)
SELECT addr FROM userTBL ORDER BY addr;

-- 중복 지역을 하나만 출력
SELECT DISTINCT addr FROM userTBL;


-- 입사일이 오래된 직원 5명의 emp_no(사원번호) 조회(‘ Don’t Limit’ 선택)
USE employees;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date ASC;



use supermarket;
desc employee;


-- Group by 연습
USE cookDB;
SELECT userID, amount FROM buyTBL ORDER BY userID;

-- 같은 아이디(userID)끼리 GROUP BY 절로 묶은 후 SUM( ) 함수로 구매 개수(amount)를 합치 는 방식

SELECT userID, SUM(amount) FROM buyTBL GROUP BY userID;

-- 별칭을 사용하여 열 이름을 이해하기 좋게 변경
SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수' FROM buyTBL GROUP BY userID;

-- 구매액의 총합
SELECT userID AS '사용자 아이디', SUM(price * amount) AS '총구매액' FROM buyTBL GROUP BY userID;


-- 회원별로 한 번 구매할 때마다 평균적으로 몇 개를 구매했는지 조회(GROUP BY 절 사용)
SELECT userName, MAX(height), MIN(height) FROM userTBL GROUP BY userName;

-- 서브쿼리와 조합하여 다시 실행
SELECT userName, height
FROM userTBL
WHERE height = (SELECT MAX(height) FROM userTBL)
OR height = (SELECT MIN(height) FROM userTBL);


-- 휴대폰이 있는 회원의 수(의도와 다르게 전체 회원이 조회됨)
SELECT COUNT( * ) FROM userTBL;

-- 휴대폰이 있는 회원만 세려면 휴대폰 열이름(mobile1)을 지정해야 함
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM userTBL;


-- 아이디별 총구매액 구하기
USE cookDB;
SELECT userID AS '사용자', SUM(price * amount) AS '총구매액' FROM buyTBL GROUP BY userID;

-- 총 구매액이 1000 이상인 회원에게만 사은품을 증정하고 싶다면?
-- 아래 문장은 맞는것 같지만 실행에러가 난다
-- SELECT userID AS '사용자', SUM(price * amount) AS '총구매액' FROM buyTBL WHERE SUM(price * amount) >1000 GROUP BY userID;

SELECT userID AS '사용자', SUM(price * amount) AS '총구매액' FROM buyTBL
GROUP BY userID
HAVING SUM(price * amount) > 1000;


--  총 구매액이 적은 회원 순으로 정렬(ORDER BY 절 사용)
SELECT userID AS '사용자', SUM(price * amount) AS '총구매액' FROM buyTBL
GROUP BY userID
HAVING SUM(price * amount) > 1000
ORDER BY SUM(price * amount);

-- 오류가 발생해도 계속 삽입되도록 설정하기
USE cookDB;
CREATE TABLE memberTBL (SELECT userID, userName, addr FROM userTBL LIMIT 3); -- 3건만 가져옴 
ALTER TABLE memberTBL ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID); -- 기본키 지정 SELECT * FROM memberTBL;


INSERT INTO memberTBL VALUES ('KHD', '강후덜', '미국'); -- 기본키 중복 입력 
INSERT INTO memberTBL VALUES ('LSM', '이상민', '서울');
INSERT INTO memberTBL VALUES ('KSJ', '김성주', '경기');
INSERT INTO memberTBL VALUES ('KHD', '강산애', '어메리카'); -- 기본키 중복으로 에러발생


INSERT IGNORE INTO memberTBL VALUES ('KHD', '강산애', '어메리카'); 

SELECT * FROM memberTBL;

-- 데이터를 삽입할 때 기본키가 중복되면 새로 삽입한 데이터로 내용이 변경되게 하기
INSERT INTO memberTBL VALUES ('KHD', '강산', '영국') ON DUPLICATE KEY UPDATE userName='강산', addr='영국';
INSERT INTO memberTBL VALUES ('DJM', '동짜몽', '일본') ON DUPLICATE KEY UPDATE userName='동짜몽', addr='일본';
SELECT * FROM memberTBL;