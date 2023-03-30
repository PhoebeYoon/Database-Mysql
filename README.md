###### :cactus:  Mysql

## SQL이란? (Structured Query Language)
RDBMS의 데이터를 관리하기 위해 만들어진 언어입니다.  DB 권한설정, 테이블 CRUD, 데이터 CRUD는 SQL을 통해 이루어진다고 할 수 있습니다. 

1. DCL (Data Control Language):
데이터베이스에 접근할 수 있는 사용자들의 권한을 관리하는 명령어입니다. (grant, revoke) 비유하자면 학년 정보(데이터베이스)에는 담임 선생님만 접근할 수 있게...

2. DDL (Data Definition Language):
테이블 CRUD를 위한 명령어입니다. (create, alter, drop, rename ..) 비유하자면 출석부엔 어떤 컬럼을 넣을 것인가.. (학번, 이름, 출석여부 등..)

3. DML (Data Manipulation Language):
실제 테이블에 있는 데이터를 CRUD하기 위한   명령어입니다. (select, insert, update, delete...) 비유하자면 실제 출석부에 데이터를 넣는 것.   
[ DB 외부접속 ]  
      <img width="350" alt="스크린샷 2023-03-30 오후 6 48 27" src="https://user-images.githubusercontent.com/48478079/228798278-82a1cd37-188c-46c7-86aa-b18e84f40e2d.png">


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



```
var mysql = require('mysql');
var connection = mysql.createConnection({
      host :'localhost',
      user:'root',
      password :'111111',
      database :'opentutorials'
});

connection.connect();

connection.query(' SELECT * FROM topic', function(err, results, fields){
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
