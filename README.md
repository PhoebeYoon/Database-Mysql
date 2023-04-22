###### :cactus:  Mysql

## 데이터베이스 vs 스키마 
우리가 사용할 데이터를 기록하는 최종적인 곳은 테이블(table) 입니다 액셀처럼 스프레드시트 형태로 생각하시면 됩니다.   
각각의 정보가 흩어져 있다면 특별한 의미를 부여할 수 없습니다. 데이터들이 한군데 모여있을때 특별한 의미를 갖게 됩니다   
그렇기 때문에 테이블(table)은 서로 연관있는 데이터들을 그룹핑한 것입니다. 그리고 이런 특정한 의미를 갖는 여러개의 table들이 모여있는 것이 데이터베이스입니다.   
그럼, table들이 모여있는 것이 데이터베이스라고 하면 우리가 지금 배우는 과목도 데이터베이스인데... 좀 용어가 헷갈리죠!  
그래서 table들이 모여있는 것을 데이터베이스라는 말대신 <b>스키마</b>라고 부릅니다. 그러니까 스키마(schema)는 관련있는 데이터들을 모아놓은 여러개의 테이블들이 모여있는 곳, 폴더와 같은 것이 스키마라고 생각하시면 됩니다.  

> 스카마라는 단어는 형태, 모양, 계획을 의미하는 그리스어 skhēma에서 유래했습니다.   
데이터베이스의 구조와 제약조건에 대한 명세를 기술한것이며 데이터 저장을 나타내는 추상적인 디자인을 말합니다.

<img width="600" alt="스크린샷 2023-04-01 오후 2 28 36" src="https://user-images.githubusercontent.com/48478079/229267389-7594339e-65bf-4f9b-a6d3-c98b2f08d180.png">


여러분이 mySql를 설치했다면 바로 데이터베이스 서버를 설치한 것입니다.  

## 권한 

우리는 이미 mysql를 설치하면서 
``` mysql -uroot -p ``` 를 사용합니다. 이제 이것을 해석해보면, mysql를 실행하되 u(유저)는 'root'라는 이름을 사용한다는 의미입니다 -p는 패스워드를 사용하겠다는 의미이고요    
mysql를 사용하려면 유저 (관리자)가 있어야 하는데 기본적인 유저로 root를 사용합니다. 그래서 특별히 설정하지 않고도 root를 사용합니다. 
접속해서 데이터베이스를 변경할 수 있는 권한을 갖고 있는 사람이 root인 것이죠.   



## 한글설정 및 환경설정 내용보기  
먼저 mysql의 설정파일은 다음과 같습니다 
- Mac에서는 my.cnf <-- mysql에서 사용하는 환경설정파일입니다 
- windows는 my.ini 파일입니다  

이제 mysql의 설정내용을 터미널을 통해 알아보겠습니다.  여기서 우리가 봐야할 것은 
```
mysql>show variables like 'datadir%';
mysql>show variables like 'character_set\_%';
mysql>show variables like 'c%';
mysql> show variables where Variable_Name like "%dir%";
```
<img width="300" alt="스크린샷 2023-04-01 오후 3 30 48" src="https://user-images.githubusercontent.com/48478079/229269817-70f62f3c-0317-40c8-95d0-b461b8ece429.png"> <img width="300" alt="스크린샷 2023-04-01 오후 3 31 15" src="https://user-images.githubusercontent.com/48478079/229269802-11a49f54-8775-4a0f-8962-22e4e3ecc4f9.png">

<img width="600" alt="스크린샷 2023-04-01 오후 3 38 59" src="https://user-images.githubusercontent.com/48478079/229270078-f43c00c1-ae05-4d6d-8c79-6fbe0695879c.png">   

<img width="600" alt="스크린샷 2023-04-01 오후 3 51 42" src="https://user-images.githubusercontent.com/48478079/229270631-40b5b2ab-cfa3-461c-a662-897b0280b7eb.png">


## mysql 설정보기 
```  mysql> status;  ```  

<img width="400" alt="스크린샷 2023-04-01 오후 3 40 50" src="https://user-images.githubusercontent.com/48478079/229270185-18108f58-1641-4356-bb00-b3c92c4f5296.png">


## 데이터베이스 생성 및 삭제 
``` create database 데이터베이스이름  ```    
예)  
```
mysql>create database study_db;  
mysql>show databases;
mysql>use study_db;   
Database changed
mysql>drop database study_db;
Query OK <-- 뭐 이렇게 나오면 됩니 
mysql>show databases;
```  
여기서 세미콜론 과 's'를 주의하세요  




## SQL이란? (Structured Query Language)
RDBMS의 데이터를 관리하기 위해 만들어진 언어입니다.  DB 권한설정, 테이블 CRUD, 데이터 CRUD는 SQL을 통해 이루어진다고 할 수 있습니다. 

1. DCL (Data Control Language):
데이터베이스에 접근할 수 있는 사용자들의 권한을 관리하는 명령어입니다. (grant, revoke) 비유하자면 학년 정보(데이터베이스)에는 담임 선생님만 접근할 수 있게...

2. DDL (Data Definition Language):
테이블 CRUD를 위한 명령어입니다. (create, alter, drop, rename ..) 비유하자면 출석부엔 어떤 컬럼을 넣을 것인가.. (학번, 이름, 출석여부 등..)

3. DML (Data Manipulation Language):
실제 테이블에 있는 데이터를 CRUD하기 위한   명령어입니다. (select, insert, update, delete...) 비유하자면 실제 출석부에 데이터를 넣는 것.   


## SQL 기본은 CRUD ( Create Read Update Delete )

SQL도 관계형 데이터베이스에서 CRUD를 하기 위해 존재합니다.  

### 생성 (insert)
INSERT INTO 테이블이름(컬럼이름1, 컬럼이름2, 컬럼이름3, ...) VALUES (데이터값1, 데이터값2, 데이터값3, ...)
### 수정 (update)
UPDATE 테이블이름 SET 컬럼이름1=데이터값1, 컬럼이름2=데이터값2, ... WHERE 필드이름=데이터값
### 삭제 (delete)
DELETE FROM 테이블이름 WHERE 필드이름=데이터값  

### 조회 (select)
select 컬럼 from 테이블 where 조건
- select
- join
- sub query
- group query
- condition



## DB 외부접속 
<img width="450" alt="스크린샷 2023-03-30 오후 6 48 27" src="https://user-images.githubusercontent.com/48478079/228798278-82a1cd37-188c-46c7-86aa-b18e84f40e2d.png"> 
      
      
아래 내용은 mysql를 사용해서 db에 접속하는 코드입니다. 일반적인 코드이며 개별 디비의 상황에따라 내용은 달라질 수 있습니다.  디비에 접속해서 데이터를 조회하려면 사용자에 대한 정보와 데이터베이스에 대한 정보를 넣고 쿼리문이라는 것을 이용해서 원하는 정보를 가져올 수 있습니다.    
```
var mysql = require('mysql');
var connection = mysql.createConnection({
      host :'localhost',
      user:'root',
      password :'비번',
      database :'데이터베이스이름'
});

connection.connect();

connection.query(' SELECT * FROM sampledb', function(err, results, fields){
      if(err){
            console.log(err)
      } 
      console.log(results);
})
connection.end();
-----------------------------------
터미널에서 >npm install mysql 엔터
터미널에서 >node mysql 엔터 (터미널에 테이블의 내용이 출력되는지 확인)
```
