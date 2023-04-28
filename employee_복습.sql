DROP DATABASE IF EXISTS employees;
CREATE DATABASE IF NOT EXISTS employees;
USE employees;

CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);



INSERT INTO `employees` VALUES (10001,'1953-09-02','Georgi','Facello','M','1986-06-26'),
(10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21'),
(10003,'1959-12-03','Parto','Bamford','M','1986-08-28'),
(10004,'1954-05-01','Chirstian','Koblick','M','1986-12-01'),
(10005,'1955-01-21','Kyoichi','Maliniak','M','1989-09-12'),
(10006,'1953-04-20','Anneke','Preusig','F','1989-06-02'),
(10007,'1957-05-23','Tzvetan','Zielinski','F','1989-02-10'),
(10008,'1958-02-19','Saniya','Kalloufi','M','1994-09-15'),
(10009,'1952-04-19','Sumant','Peac','F','1985-02-18'),
(10010,'1963-06-01','Duangkaew','Piveteau','F','1989-08-24'),
(10011,'1953-11-07','Mary','Sluis','F','1990-01-22'),
(10012,'1960-10-04','Patricio','Bridgland','M','1992-12-18'),
(10013,'1963-06-07','Eberhardt','Terkki','M','1985-10-20'),
(10014,'1956-02-12','Berni','Genin','M','1987-03-11'),
(10015,'1959-08-19','Guoxiang','Nooteboom','M','1987-07-02'),
(10016,'1961-05-02','Kazuhito','Cappelletti','M','1995-01-27'),
(10017,'1958-07-06','Cristinel','Bouloucos','F','1993-08-03'),
(10018,'1954-06-19','Kazuhide','Peha','F','1987-04-03'),
(10019,'1953-01-23','Lillian','Haddadi','M','1999-04-30'),
(10020,'1952-12-24','Mayuko','Warwick','M','1991-01-26'),
(10021,'1960-02-20','Ramzi','Erde','M','1988-02-10'),
(10022,'1952-07-08','Shahaf','Famili','M','1995-08-22'),
(10023,'1953-09-29','Bojan','Montemayor','F','1989-12-17'),
(10024,'1958-09-05','Suzette','Pettey','F','1997-05-19'),
(10025,'1958-10-31','Prasadram','Heyers','M','1987-08-17'),
(10026,'1953-04-03','Yongqiao','Berztiss','M','1995-03-20'),
(10027,'1962-07-10','Divier','Reistad','F','1989-07-07'),
(10028,'1963-11-26','Domenick','Tempesti','M','1991-10-22'),
(10029,'1956-12-13','Otmar','Herbst','M','1985-11-20'),
(10030,'1958-07-14','Elvis','Demeyer','M','1994-02-17'),
(10031,'1959-01-27','Karsten','Joslin','M','1991-09-01'),
(10032,'1960-08-09','Jeong','Reistad','F','1990-06-20'),
(10033,'1956-11-14','Arif','Merlo','M','1987-03-18'),
(10034,'1962-12-29','Bader','Swan','M','1988-09-21'),
(10051,'1953-07-28','Hidefumi','Caine','M','1992-10-15'),
(10052,'1961-02-26','Heping','Nitsch','M','1988-05-21'),
(10053,'1954-09-13','Sanjiv','Zschoche','F','1986-02-04'),
(10054,'1957-04-04','Mayumi','Schueller','M','1995-03-13');


select * from employees;

-- 입사일이 오래된 직원 5명의 emp_no(사원번호) 조회(‘ Don’t Limit’ 선택)
USE employees;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date ASC;

-- 상위의 N개만 출력하는 LIMIT 절 사용
SELECT emp_no, hire_date FROM employees ORDER BY hire_date ASC LIMIT 5;

-- LIMIT 시작, 개수’ 형식으로 조회
SELECT emp_no, hire_date FROM employees ORDER BY hire_date ASC LIMIT 0, 5;

-- 테이블 3개 생성
USE cookDB;
CREATE TABLE bigTBL1 (SELECT * FROM employees.employees); 
CREATE TABLE bigTBL2 (SELECT * FROM employees.employees); 
CREATE TABLE bigTBL3 (SELECT * FROM employees.employees);

DELETE FROM bigTBL1;  --  데이터만 삭제, 느림,  로그 남김
DROP TABLE bigTBL2;  -- 테이블자체가필요없는경우에는DROP문사용
TRUNCATE TABLE bigTBL3; -- 테이블의 구조를 남겨놓고 싶은 경우에는 TRUNCATE 문으로 삭제





